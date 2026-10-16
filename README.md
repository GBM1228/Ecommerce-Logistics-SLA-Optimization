# E-Commerce Logistics & SLA Optimization Case Study

## 📌 Project Overview
This project simulates an end-to-end consulting assignment for a scaling e-commerce marketplace (utilizing the Olist dataset of ~100k records). The objective was to diagnose network inefficiencies, isolate fulfillment bottlenecks, and build an executive-ready diagnostic tool to recover failing customer Service Level Agreements (SLAs).

### 🖥️ Executive Dashboard Snapshot
![Dashboard Visual](./Screenshot(82).png)

---

## 📈 Key Operational Findings & Bottleneck Diagnosis
* **The External Transport Crisis:** While internal warehouse picking and packing processes operate at high efficiency (averaging under 2.5 days across almost all states), the core bottleneck is driven by external carrier transit times, which drag out delivery timelines by 7–9 additional days.
* **High-Risk Customer Corridors:** Destination matrices identify severe geographic service failures in the North and Northeast regions. Customers in **Alagoas (AL) experience a staggering 24% SLA breach rate** with a 24-day average wait time, followed by **Maranhão (MA) at 20%**.
* **Systemic Seasonality Strain:** Logistics networks predictably break down under cyclical volume surges in March (SLA failures spike to 17.5%) and during the Q4 holiday rush in November/December (hitting 14%).

---

## 💼 Data-Backed Strategic Recommendations
1. **Decentralize Distribution Nodes:** Establish regional fulfillment centers closer to high-risk destination corridors (like Alagoas) to bypass centralized hub dependencies and reduce transit lead times by up to 50%.
2. **Proactive Capacity Pre-Booking:** Secure seasonal Service Level Agreements (SLAs) with secondary freight partners 60 days ahead of predictable March and November holiday volume spikes.
3. **Vendor Automation Audits:** Deploy automated warehouse tracking tools for high-volume vendors in São Paulo (SP) to optimize internal fulfillment pipelines down under 24 hours.

---

## 🛠️ Technical Stack & Tools Used
* **Project Management:** Agile Workflow and Kanban sprint execution via Trello.
* **Data Ingestion & Cleaning:** MySQL Workbench (Relational schema optimization and metric engineering views).
* **Business Intelligence & Data Modeling:** Power BI Desktop (Star schema architectural mapping, DAX calculated measures, dynamic visualization formatting).
