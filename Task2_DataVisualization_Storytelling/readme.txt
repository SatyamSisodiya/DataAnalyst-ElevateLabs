AtliQ Hardware Sales Dashboard
README.TXT
Updated 2025‑04‑22
============================================================

CONTENTS
------------------------------------------------------------
1.  Purpose of the Dashboard
2.  Required Data Sources
3.  Common Navigation & Filters
4.  Finance View
      4.1  Business Questions Answered
      4.2  Visuals, Metrics & Interactions
      4.3  Key DAX Measures
5.  Sales View
      5.1  Business Questions Answered
      5.2  Visuals, Metrics & Interactions
      5.3  Key DAX Measures


------------------------------------------------------------
1.  PURPOSE OF THE DASHBOARD
------------------------------------------------------------
The AtliQ Hardware Sales Dashboard delivers a single source of truth for
revenue, margin, cost‑to‑serve and customer performance.  
It enables finance, sales and executive teams to:
* Track Net Sales growth vs. last year (LY) at any grain of time, region,
  customer or product segment.
* Understand margin leakage through pre‑ and post‑invoice deductions.
* Compare year‑over‑year (YoY) performance and spot risk or upside early.
* Prioritise high‑value customers, products and geographies.
------------------------------------------------------------
2.  REQUIRED DATA SOURCES
------------------------------------------------------------
• fact_sales (actuals & forecast)        • dim_date  
• dim_customer                           • dim_product  
• fact_costs (COGS, freight, deductions) • dim_region  

All tables are pre‑staged in SQL Server (schema = bi_stage).

------------------------------------------------------------
3.  COMMON NAVIGATION & FILTERS
------------------------------------------------------------
• Slicers (header ribbon)  
   – Year buttons (2018‑2022) | Quarter buttons (Q1‑Q4)  
   – Period flags YTD / YTG  
• Dropdowns (top left)  
   – region_market, customer, segment_category_product  
• Cross‑highlighting is ON across every visual.  

------------------------------------------------------------
4.  FINANCE VIEW
------------------------------------------------------------
4.1  BUSINESS QUESTIONS ANSWERED
• “How are Net Sales, Gross Margin % and Net Profit % trending vs LY?”  
• “Which P&L lines drive the YoY delta?”  
• “Where are the biggest YoY gains/losses by region or segment?”  

4.2  VISUALS, METRICS & INTERACTIONS
• KPI Cards (top middle)  
   ─ Net Sales ₹ 268.0 M (+140.6 % LY)  
   ─ GM % 37.10 % (‑9.95 pp LY)  
   ─ Net Profit % ‑0.85 % (‑138.7 % LY)  
• “Net Sales Performance Over Time”  
   – Area/line chart: Selected Year vs Previous Year monthly.  
   – Hover shows absolute and YoY % delta tooltips.  
• “Profit & Loss Statement” Matrix  
   Rows = Line Item hierarchy; Columns = 2020, LY, YoY Chg, YoY Chg %.  
   Scroll enabled to expose full P&L depth.  
• “Top / Bottom Products & Customers”  
   – Two side‑by‑side tables: Region and Segment.  
   – Sorted by YoY Chg % descending; conditional formatting highlights
     outliers.  
• Drill‑through: Right‑click any region/segment ⟶ Sales View.

4.3  KEY DAX MEASURES
• Net Sales = SUM(fact_sales[net_sales])  
• Gross Margin = [Net Sales] ‑ SUM(fact_costs[total_cogs])  
• GM % = DIVIDE([Gross Margin], [Net Sales])  
• Net Profit = [Gross Margin] ‑ SUM(fact_costs[opex]) ‑ SUM(fact_costs[deductions])  
• YoY Chg = [This Year] ‑ [Last Year]  
• YoY Chg % = DIVIDE([YoY Chg], [Last Year])  
(A complete DAX catalogue is stored in /docs/DAX_Dictionary.xlsx)

------------------------------------------------------------
5.  SALES VIEW
------------------------------------------------------------
5.1  BUSINESS QUESTIONS ANSWERED
• “Which customers are driving the top line and margin?”  
• “How do countries compare on NS$ and GM$?”  
• “What is the unit economics breakdown of revenue, deductions, COGS
  and gross margin?”  

5.2  VISUALS, METRICS & INTERACTIONS
• “Product Performance” Table (top left)  
   Columns = Customer | NS $ | GM $ | GM %.  
   Scrollable; header icons allow on‑the‑fly sorting.  
• “Performance Matrix” (center)  
   Bubble chart: X = NS $, Y = GM $, size = Total COGS, color = Region.  
   Axis end‑caps show ₹0M‑₹70M (x) and 0‑20 M GM$ (y).  
• “Region / Market / Customer Performance” Table (bottom left)  
   Segment‑level view of NS$, GM$ and GM %.  
• “Unit Economics” Donut Charts (bottom right)  
   – Chart #1: Net Sales vs Pre & Post‑Invoice Deductions.  
   – Chart #2: Total COGS vs Gross Margin.  
• Slicer interactions: selecting a bubble filters every table and donut.

5.3  KEY DAX MEASURES ADDONS
(in addition to section 5.3)  
• Post Invoice Deduction = SUM(fact_costs[post_invoice])  
• Pre Invoice Deduction = SUM(fact_costs[pre_invoice])  
• Total COGS = SUM(fact_costs[total_cogs])  
