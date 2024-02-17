# Analyzing-eCommerce-Business-Performance-with-SQL

## Background Project
“In a company measuring business performance is very important tracking, monitoring, and assessing successor failure of various business processes. Therefore, in this paper will analyze the business performance for an eCommerce company, taking into account some business metrics such as customers growth, product quality and payment type.”

## Data Preparation
Data pre-processing stages:
- Prepare raw dataset to be processed
- Create a new database according to the many tables that have been prepared
- Make sure there are no errors in the input data type of each column
- Importing data in csv format into database using PostgreSQL
- Creating an Entity Relationship Diagram (ERD) in accordance with the provision in the figure beside.
- Export the ERD in the form of an image and make sure the naming of the columns between the tables are related and the data types are correct

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/8d3fdcd4-f09f-4105-be27-013305a7f208)

The Entity Relationship Diagram (ERD) of Analizing eCommerce_Business_Performance

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/f209a552-d192-42ab-a83d-545e3326c626)



## Annual Customer Activity Growth Analysis
Combine data tables

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/09dfc928-39b4-4c35-868a-215743d56b16)

Average  Monthly Active User

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/c8ba1758-7ed9-40ea-b568-6cd85b9d09a6)

Interpretation
MAU measures the number of users who have made transactions with the company product every single month. 
MAU has increased every year, especially in 2017 and 2018 there was rapidly increased. The lowest activity occurred in 2016 because transaction data was only available from September. 

New Customer and Customer doing Repeat Order

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/642795de-6027-4c3e-9bc3-e92dd1461d1e)

Interpretation
New customer are customers who have made transactions for the first time, while repeating customer are customers who have made transactions more than once.
Total new customers has increased every year. However, total customers who make repeat transactions has decreased in 2018. From the average order data, it is known that most customers only place orders once a year.



## Annual Product Category Quality Analysis
Combine data tabels

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/2d7d06d4-793d-4cca-b668-d18d9b3a70dc)

Total Revenue

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/fe9b6408-37c9-4e7f-b9c0-b3e4c0b49f17)

Top Product

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/7a752870-f537-4ea0-a29f-a43e8d4c0a3c)

Interpretation:
Total revenue has increased every year, showing that the company has good growth. There are several best-selling product categories that differ each year. In 2016 the products were dominated by furniture decoration. In 2017 the products were dominated by bed tables, and in 2018 the products were dominated by health and beauty.

Total Cancel Order

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/621cea6c-6563-494f-90d3-c58e7d376acc)

Top Cancelled Product

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/0de9dfd0-a902-43d6-9ffb-6ef3999676e1)

Interpretation:
Total canceled orders are increasing every year, further research is needed to determine the factors of order cancellation. The products with the most cancellations are different each year. In 2016 the canceled products were dominated by toys, in 2017 the canceled products were dominated by sports leisure and in 2018 the canceled products were dominated by health and beauty. 



## Analysis of Annual Payment Type Usage
Total uses of each payment type in order of highest usage

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/760473cb-6a07-44c8-a00e-3a5c6a8cd9fd)

Total uses of each payment type for each year

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/299c6bac-f590-4650-9c4b-978707c2924c)

Combined table of total users using payment types for each year

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/426b0c14-d0c6-4659-8495-0b0111785aa8)

Payment Type Usage

![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/30c31d1b-f0a0-4b25-9f8f-880e241ebc9f)

Interpretation:
Analyzing the performance of each payment type will provide insights for building partnerships with payment method providers.
The most widely used payment methods over the past 3 years are credit cards, boleto, vouchers, and debit cards. The highest increase in debit card usage occurred from 2017 to 2018, while voucher usage actually decreased from 2017 to 2018.
Credit card payment methods usually offer many benefits such as rewards and discounts so customers are more interested in making payments with this method.
