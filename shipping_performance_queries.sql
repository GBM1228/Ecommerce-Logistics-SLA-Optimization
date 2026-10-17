use `Olist_operations database`;
select * from olist_customers_dataset;
select * from olist_orders_dataset;

select count(*) from  shipping_performance;
select count(*) from olist_orders_dataset;

-- 1 Data cleaning and transformation
select * from olist_customers_dataset;
alter table olist_customers_dataset
modify customer_id varchar(50);
alter table olist_customers_dataset
modify customer_unique_id varchar(50);

select * from olist_order_items_dataset;
alter table olist_order_items_dataset
modify order_id varchar(50);
alter table olist_order_items_dataset
modify product_id varchar(50);
alter table olist_order_items_dataset
modify seller_id varchar(50);

select * from olist_order_reviews_dataset;
alter table olist_order_reviews_dataset
modify review_id varchar(50);
alter table olist_order_reviews_dataset
modify order_id varchar(50);

select * from olist_orders_dataset;
alter table olist_orders_datset
modify order_id varchar(50);
alter table olist_orders_dataset
modify customer_id varchar(50);

select * from olist_sellers_dataset;
alter table olist_sellers_dataset
modify seller_id varchar(50);

-- olist_shipping_performance_analysis
create table olist_shipping_performance  as 
select * from shipping_performance;
select count(*) from shipping_performance;

create table olist_shipping_performance as 
select 
distinct (order_id),
customer_id,
order_status,
order_purchase_timestamp,
order_approved_at,
order_delivered_carrier_date,
order_delivered_customer_date,
order_estimated_delivery_date,

 -- 2. Operational Metrics (Calculated in Days)
-- Internal processing time (Purchase to Carrier Handover)
datediff(order_delivery_carrier_date,order_purchase_timestamp) as internal_fullfilment_date,

-- External delivery time (Carrier Handover to Customer Doorstep)
datediff( order_delivered_customer_date,order_delivered_carrier_date) as external_transit_days,

-- Total end-to-end turnaround time
datediff(order_delivered_customer_date, order_purchase_timestamp) as total_lead_time_days,

-- Target performance lag (Difference between Promised Date and Actual Delivery)
datediff(order_delivered_customer_date, order_estimated_delivery_date) as days_laggard,

-- 3. Operational Flagging
case
when o.order_delivered_customer_date > o.order_estimated_delivery_date then 'SLA Breached'
else 'SLA Met'
end as sla_status
from olist_order_status_dataset o
join olist_order_items_dataset oi on o.order_id = oi.order_id
where o.order_status = 'delivered'
and o.order_delivered_carrier_date is not null
and o.order_delivered_customer_date is not null;

