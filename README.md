# plsql-window-functions-Darius-MUTABAZI
## Individual Assignment I: PL/SQL Window Functions Mastery Project




## Business Problem Definition
## Business Context
I have analyzed a small retail company in Rwanda called "Rwanda Retail Hub" that sells items like beverages, snacks, stationery, electronics, and clothing. The focus is on the sales department in the retail industry, where they track customer purchases across regions like Kigali, Musanze, and Huye.
## Data Challenge
The company has sales data but struggles to spot trends, like which products sell best in each region or how sales change over time. Without this, they can't decide what to stock more of or target marketing effectively. For example, they need to rank products, calculate growth, and group customers by spending to avoid wasting resources on areas with low values.

## Expected Outcome
From this analysis, the company can get insights like top products to promote in specific regions, monthly sales trends for budgeting, and customer segments for personalized campaigns , ultimately boosting revenue by 10-15% through good and smarter decisions.
Success Criteria
## 1.	Top 5 products per region/quarter by total sales revenue :
Using RANK() to rank products within each region and quarter, measured by summing amounts and limiting to rank <= 5. This helps prioritize inventory – for example, if shirts rank #1 in Kigali Q1, stock more there to avoid shortages. 

## 2.	Running monthly sales totals across all regions :
Using SUM() OVER() with an ORDER BY sale month to calculate cumulative sales up to each month, measured in total RWF (Rwandan Francs). It's useful for seeing if we're on track for annual targets, like hitting 10M RWF by mid-year. 


## 3.	Month-over-month sales growth percentage per category:
Using LAG() (or LEAD() for forward looks) to compare current month's sales to the previous, measured as a percentage change (e.g., +15% growth). This spots trends, like if beverages drop 10% in rainy months, we can adjust promotions accordingly.

## 4.	Customer quartiles based on lifetime spend:
Using NTILE(4) to divide customers into 4 groups by total amount spent, measured by assigning 1 (top 25%) to 4 (bottom 25%). This segments for marketing – e.g., send VIP discounts to quartile 1 to boost retention. 


## 5.	3-month moving averages of regional sales :
Using AVG() OVER() with a frame of ROWS BETWEEN 2 PRECEDING AND CURRENT ROW to smooth monthly sales per region, measured in average RWF over the period. It helps forecast – if Kigali's average rises to 500k, plan for expansion there.


## Database Schema

I designed 3 related tables with foreign keys for **customers**, **products**, and **transactions**.

| Table        | Purpose            | Key Columns                                                                 | Example Row                |
|--------------|--------------------|-----------------------------------------------------------------------------|----------------------------|
| customers    | Store customer info | customer_id (**PK**), name, region                                          | 1, MUTABAZI Darius, Kigali |
| products     | Product catalog     | product_id (**PK**), name, category                                         | 1, Coffee Beans, Beverages |
| transactions | Sales records       | transaction_id (**PK**), customer_id (**FK**), product_id (**FK**), sale_date, amount | 1, 1, 1, 2024-01-15, 25000 |

**Notes:**
- **PK** = Primary Key  
- **FK** = Foreign Key  

## ER DIAGRAM
![image alt](https://github.com/dariusmutabazi-commits/plsql-window-functions-Darius-MUTABAZI/blob/main/table%20creation.PNG)

Now we are going to create tables, insert data and make sure they have a relation to one another. The following tables were created by Oracle Database edition with the help of a Command prompt

# 1.CUSTOMERS TABLE
![image alt](https://github.com/dariusmutabazi-commits/plsql-window-functions-Darius-MUTABAZI/blob/main/customers%20data%20table.PNG)
# 2.PRODUCTS TABLE

![image alt](https://github.com/dariusmutabazi-commits/plsql-window-functions-Darius-MUTABAZI/blob/main/products%20data%20table.PNG)
# 3.TRANSACTIONS TABLE
![image alt](https://github.com/dariusmutabazi-commits/plsql-window-functions-Darius-MUTABAZI/blob/main/transactions%20data%20table.PNG)
## 1. Ranking Functions: ROW_NUMBER(), RANK(), DENSE_RANK(), PERCENT_RANK()
**Use case:** Ranking top customers by total revenue to identify VIPs.
![image alt](https://github.com/dariusmutabazi-commits/plsql-window-functions-Darius-MUTABAZI/blob/main/percent%20rank.PNG)
**Interpretation:** This query highlights Darius MUTABAZI as the top spender with 50,000 RWF from his January purchase, ranking #1 across all functions since no other customer matches that amount yet. RANK and DENSE_RANK align here due to no ties, but they’d split with equal spends; PERCENT_RANK shows him at 0%, guiding us to prioritize him for a loyalty program. As more data comes in, this will help spot other high-value customers like Fatima Kagabo with her 45,000 RWF April buy.

## 2. Aggregate Functions: SUM(), AVG(), MIN(), MAX()
**Use case:** Running totals of monthly sales.
 ![image alt](https://github.com/dariusmutabazi-commits/plsql-window-functions-Darius-MUTABAZI/blob/main/SUM.PNG)
**Interpretation:** Sales peaked in April at 45k, with a running total hitting 170k by May. The ROWS frame ensures each month builds on the last, helping track progress.

## 3. Navigation Functions: LAG(), LEAD()
**Use case:** Month-over-month growth analysis.
 ![image alt](https://github.com/dariusmutabazi-commits/plsql-window-functions-Darius-MUTABAZI/blob/main/lag().PNG)
**Interpretation:** A big drop in February (-50%) suggests a slow start, but growth in April (50%) shows recovery. LAG helps pinpoint these shifts for planning.

## 4. Distribution Functions: NTILE(), CUME_DIST()
**Use case:** Customer segmentation by spend.
 ![image alt](https://github.com/dariusmutabazi-commits/plsql-window-functions-Darius-MUTABAZI/blob/main/ntile().PNG)
**Interpretation:**
 Top spenders like Darius and Amina fall in quartile 1, with 20% of the cumulative distribution. NTILE groups them for targeted campaigns.







# Results Analysis



## 1. Descriptive (What happened?)

Total sales for Rwanda Retail Hub hit 170,000 RWF by May 2024, with April standing out at 45,000 RWF due to strong purchases like Fatima Kagabo’s 45,000 RWF T-Shirt buy. Darius MUTABAZI led individual spending with 50,000 RWF in January, while Emmanuel Habimana’s 20,000 RWF in May was the lowest among the top buyers. Sales took dips in February (25,000 RWF) and May, hinting at possible seasonal shifts.

## 2. Diagnostic(Why?)

The April peak likely ties to a seasonal event or promotion, possibly around a local holiday, boosting Fatima’s clothing purchase. The drops in February and May could be due to rainy weather reducing store visits, especially in Musanze where Amina’s lower spend aligns with rural challenges. Regional differences might also play a role, with Kigali showing steadier sales from Darius and Fatima.

## 3. Prescriptive (What next?)

Focus stock on high-demand items like T-Shirts in Kigali for April peaks, and launch discounts on Beverages in May to counter slow months. Offer loyalty rewards to top spenders like Darius MUTABAZI to encourage repeat buys, and gather more transaction data from Musanze to understand rural sales patterns better.





# References
•	GeeksforGeeks - Window Functions in PL/SQL https://www.geeksforgeeks.org/plsql/window-functions-in-plsql/
•	Mode Analytics - SQL Window Functions Tutorial  https://mode.com/sql-tutorial/sql-window-functions/
•	LearnSQL.com - What Are SQL Window Functions?  https://learnsql.com/blog/window-functions/
•	DbVisualizer - Beginners Guide to SQL Window Functions https://www.dbvis.com/thetable/a-beginners-guide-to-sql-window-functions/
•	DataLemur - SQL Time-Series Window Functions https://datalemur.com/sql-tutorial/sql-time-series-window-function-lead-lag
•	freeCodeCamp - How to Use Window Functions in SQL https://www.freecodecamp.org/news/window-functions-in-sql/
•	DataCamp - SQL Window Functions Cheat Sheet  https://www.datacamp.com/cheat-sheet/sql-window-functions-cheat-sheet

