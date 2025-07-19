SELECT *
FROM coffee_sales;

#### TOTAL SALES REVENUE 
SELECT SUM(quantity* unitprice) AS TotalRevenue
from coffee_sales;
 


#####best selling product 
SELECT product,
SUM(quantity) AS totalsold
from coffee_sales 
GROUP BY PRODUCT
ORDER BY totalsold DESC;


#######sales by city
SELECT CITY,
SUM(QUANTITY) AS Totalsales
from coffee_sales 
GROUP BY CITY;


######most active barista

SELECT BARISTA,
        COUNT(*) AS ORDERHANDLED 
from coffee_sales 
GROUP BY BARISTA
ORDER BY COUNT(*) DESC;

#######Average unit price of coffee products 
SELECT product,
AVG(unitprice) AS Averageprice
from coffee_sales 
GROUP BY product;

#####Minimum quantity ordered by any customer 
Select
MIN(quantity) AS customerorder
from coffee_sales;

#####maximum revenue generated in a single order 
Select
MAX(quantity*Unitprice) AS Revenuegenerated 
from coffee_sales;

#####Top selling product by city 

SELECT CITY, PRODUCT,
SUM(QUANTITY) AS TOTALSOLD 
FROM coffee_sales
GROUP BY CITY,PRODUCT
ORDER BY CITY, TOTALSOLD DESC;

########Daily Revenue Trend
SELECT DATE,
SUM(QUANTITY*UNITPRICE) AS "DAILY REVENUE"
FROM coffee_sales
GROUP BY DATE
ORDER BY DATE;

########Running Total of quantity sold per city 
SELECT 
    CITY,
	PRODUCT,
	QUANTITY,
SUM(QUANTITY) OVER (PARTITION BY CITY)
FROM coffee_sales;

######Row number to idenity first sale of each barista 
SELECT 
      BARISTA,
	  PRODUCT,
      QUANTITY,
ROW_NUMBER() OVER (PARTITION BY BARISTA  ORDER BY Quantity DESC) AS SALESRANK
FROM coffee_sales;

#####Get barista ranked by total quantity sold on each date (timestamp)
SELECT 
     DATE,
     BARISTA,
SUM(quantity) AS total_quantity,
DENSE_RANK() OVER ( PARTITION BY DATE ORDER BY SUM(QUANTITY) DESC) AS DAILYSALESRANK
from coffee_sales
GROUP BY DATE, BARISTA;











