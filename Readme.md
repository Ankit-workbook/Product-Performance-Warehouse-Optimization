
# 📦 Product Performance & Warehouse Optimization

*Analyzing sales and warehouse operations to identify profitability drivers, reduce inefficiencies, and optimize resource utilization using Python, SQL, and Tableau.*

---

## 📌 Table of Contents

* <a href="#overview">Overview</a>
* <a href="#business-problem">Business Problem</a>
* <a href="#dataset">Dataset</a>
* <a href="#tools--technologies">Tools & Technologies</a>
* <a href="#project-structure">Project Structure</a>
* <a href="#data-cleaning--preparation">Data Cleaning & Preparation</a>
* <a href="#exploratory-data-analysis-eda">Exploratory Data Analysis (EDA)</a>
* <a href="#research-questions--key-findings">Research Questions & Key Findings</a>
* <a href="#dashboard">Dashboard</a>
* <a href="#how-to-run-this-project">How to Run This Project</a>
* <a href="#final-recommendations">Final Recommendations</a>
* <a href="#author--contact">Author & Contact</a>

---

<h2><a class="anchor" id="overview"></a>Overview</h2>  

This project integrates **sales performance** with **warehouse operations** to provide a holistic view of business efficiency. Using Python for data analysis, SQL for querying, and Tableau for interactive dashboards, the project identifies high ROI products, underperforming categories, and warehouse inefficiencies. The analysis supports data-driven strategies to improve profitability and optimize warehouse space utilization.

---

<h2><a class="anchor" id="business-problem"></a>Business Problem</h2>  

Companies often struggle with balancing sales performance and warehouse efficiency. The challenges include:

* Overstocking and high storage costs
* Products with high sales but low margins
* Poor warehouse utilization (some overburdened, others underused)
* High levels of damaged inventory and order delays

This project aims to uncover patterns in sales and warehouse operations to improve cost efficiency, optimize resources, and drive better business outcomes.

---

<h2><a class="anchor" id="dataset"></a>Dataset</h2>  

* **Sales Data:**
  Columns → Product\_ID, Product\_Name, Category, Cost\_Price, Selling\_Price, Units\_Sold, Revenue, Profit/Loss Status, Profit/Loss Amount, Customer Region, Order Date

* **Warehouse Data:**
  Columns → Warehouse\_ID, Product\_ID, Stock\_On\_Hand, Reorder\_Level, Storage\_Cost\_Per\_Unit, Damaged\_Units, Space\_Utilization, Order\_Fulfillment\_Time, Product\_Name

* **Combined Data (Merged):**
  Used to link sales performance with warehouse efficiency (e.g., Profit per Space Utilization, ROI by Warehouse).

---

<h2><a class="anchor" id="tools--technologies"></a>Tools & Technologies</h2>  

* **Python (Pandas, NumPy):** Data preprocessing, merging, and feature engineering (Profit/Loss columns, ROI metrics).
* **Matplotlib & Seaborn:** Exploratory and business-focused visualizations (bar charts, scatter plots, heatmaps, radar charts).
* **SQL:** For data validation, joins, and advanced aggregations on sales and warehouse datasets.
* **Jupyter Notebook:** Step-by-step EDA and narrative analysis.
* **Tableau:** Final interactive dashboards for stakeholder-friendly insights.
* **Google Docs:** Final report creation with visual placeholders and executive summary.
* **GitHub:** Version control and portfolio showcase.

---

<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>  

```
product-performance-warehouse-optimization/
│
├── README.md
├── Product_Performance_Report.pdf
│
├── notebooks/                  
│   ├── sales_analysis.ipynb
│   ├── warehouse_analysis.ipynb
│   └── combined_analysis.ipynb
│
├── Sql_scripts/                    
│   ├── warehouse.sql
│   
│ 
│
├── dashboard/                  
│   └── warehouse_sales_dashboard.twbx
│
├── data/                       
│   ├── sales_data.csv
│   ├── warehouse_data_named.csv
│   └── cleaned_sales_data.csv
```

---

<h2><a class="anchor" id="data-cleaning--preparation"></a>Data Cleaning & Preparation</h2>  

* Removed redundant columns (`Product_Name_x`, `Category_y`, etc.).
* Reordered sales data columns: Product\_Name, Product\_ID, Category, Cost\_Price, Selling\_Price, Units\_Sold, Revenue.
* Created **Profit/Loss Status** and **Profit/Loss Amount** columns.
* Standardized warehouse column names (removed spaces, unified naming).
* Created **Total\_Storage\_Cost = Stock\_On\_Hand × Storage\_Cost\_Per\_Unit**.
* Merged sales and warehouse datasets on `Product_ID`.

---

<h2><a class="anchor" id="exploratory-data-analysis-eda"></a>Exploratory Data Analysis (EDA)</h2>  

**Sales Data EDA:**

* Revenue & profit distribution by category
* Top 10 products by revenue & profit
* Profit margin trends across categories
* Regional breakdown of sales

**Warehouse Data EDA:**

* Average space utilization by warehouse
* Damaged units distribution
* Reorder risk analysis
* Storage cost comparison

**Combined Analysis:**

* Profit vs Space Utilization (Warehouse efficiency)
* Revenue vs Storage Cost
* Top Products by Profit per Space Utilization
* Warehouse ROI benchmarking

---

<h2><a class="anchor" id="research-questions--key-findings"></a>Research Questions & Key Findings</h2>  

1. **Which categories drive the most revenue and profit?**
   → Top 20% of products contribute to \~70% revenue.

2. **Which warehouses are most efficient?**
   → Warehouse C had the highest profit-to-space efficiency.

3. **Which warehouses have inefficiencies?**
   → Warehouse B generated high revenue but had the highest storage cost.

4. **Where are damages concentrated?**
   → Warehouse D reported the highest damaged units, linked to >90% utilization.

5. **Which products are low ROI?**
   → Several products consumed large warehouse space while contributing <15% profit.

---

<h2><a class="anchor" id="dashboard"></a>Dashboard</h2>  

* **Tableau Dashboard Includes:**

  * KPI Cards: Revenue, Profit, Storage Cost, Damaged Units
  * Revenue vs Profit by Category
  * Heatmap: Warehouse Efficiency Metrics
  * Scatter: Profit vs Space Utilization
  * Top Products by Profit per Space

```markdown
![Dashboard Screenshot](images/warehouse_sales_dashboard.png)
```

---

<h2><a class="anchor" id="how-to-run-this-project"></a>How to Run This Project</h2>  

1. Clone the repository:

```bash
git clone https://github.com/Ankit-workbook/product-performance-warehouse-optimization.git
```

2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. Run the Jupyter notebooks inside `/notebooks/`.
4. Open Tableau dashboard (`.twbx` file) or Tableau Public link.

---

<h2><a class="anchor" id="final-recommendations"></a>Final Recommendations</h2>  

* **Product Strategy:** Scale high ROI products, phase out bottom 10–15% low ROI products.
* **Warehouse Strategy:** Reallocate profitable products to underutilized warehouses.
* **Cost Optimization:** Improve Warehouse D infrastructure to reduce damages.
* **Revenue Growth:** Prioritize marketing for high-margin categories instead of just high-sales categories.

---

<h2><a class="anchor" id="author--contact"></a>Author & Contact</h2>  

**Your Name**
Data Analyst
📧 Email: *[ankit005.ac@gmail.com](mailto:ankit005.ac@gmail.com)*
🔗 LinkedIn: *\[https://www.linkedin.com/in/ankityadav05/]*
🐙 GitHub: *\[https://github.com/Ankit-workbook/]*

---
