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
Average monthly active user (MAU) per year
![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/66b7913e-b1e7-4eed-af21-f20ef866902a)

Total new customers per Year
![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/bd912f58-8c4b-4853-8ef0-23834cea3dd6)

Total customers doing repeat order per year
![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/184ae55a-3807-4713-a1ea-9751dfc98b1b)

Average order frequency for every year
![image](https://github.com/Yasmin63/Analyzing-eCommerce-Business-Performance-with-SQL/assets/146631940/c8037fd7-dccb-42f9-af25-66ce1975d8b0)

Combine the five data tables
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
















