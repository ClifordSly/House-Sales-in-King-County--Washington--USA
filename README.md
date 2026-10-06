# Introduction
Hello Data Nerds!

Welcome to my **SQL Project**, where I dive deeper into the real estate market in Washington, United States of America, with a focus on **House Sales in King County, Washington, USA**.

This project is my personal exploration aimed at identifying **factors associated with house sale prices**, understanding **how location affects house prices in King County**, and determining **which property grades offer relatively good value**.

My SQL queries? Check them out here [SQL_folder](/PROJECT/)

# Background
This project was driven by my desire to better understand the real estate sector in **King County, Washington, USA**. I ran several SQL queries to investigate factors associated with house sale prices in King County, understand how location is associated with house prices, and identify which property grades offer relatively good value based on a combination of size, quality, and price.

Using real world data that I got from kaggle, here is the link [dataset](https://www.kaggle.com/datasets/sukuna05/house-prediction-price-cleaned). The dataset contains the following features: **id, date, bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, latitude, longitude, sqft_living15, and sqft_lot15**. The dataset contains a total of **21,436 houses**.

### The question I wanted to answer through my SQL queries were:

1.**What Factors Influence House Sale Prices?**

2.**How Does Location Affect House Prices in King County?**

3.**What Property Grade Offers the Best Value?**

### Tools I used

**Power Query:** My go to tool for cleaning, transforming, and standardizing data.

**SQL:** The backbone of my analysis, enabling me to query, transform, and analyze the data to uncover critical insights.

**Power BI:** I used Power BI to create interactive visualizations from the results of the SQL queries, making the analysis easier to interpret and communicate.

**PostgreSQL:** The chosen database management  system, ideal for handling the data.

**Visual Studio Code:** My go to for database management and executing SQL queries.

**Git and GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis

Each query in this project aimed to investigate specific aspects of the **house sales in King county, Washington, USA**.
Here is how I approached each question:

### 1. What Factors Influence House Sale Prices?
This question examines how property characteristics, particularly **living area (`sqft_living`)** and **property grade (`grade`)**, are associated with house sale prices.

The analysis looks at:
- The relationship between living area and house price.
- How average house prices change across different property grades.
- Whether larger and higher-grade properties tend to have higher sale prices.

**Grade**
```
SELECT
  grade,
  count(*) as house_count,
  ROUND(min(price),2 )as min_price,
  ROUND(max(price),2 )as max_price,
  ROUND(AVG(price),2) as avg_price
FROM
  house_price
Group BY grade 
ORDER BY avg_price DESC;
```
**Results**

*Average House Price by Grade*
![grade](/PROJECT/IMAGES/Grade.jpg)

### Insights
The analysis shows a strong positive relationship between property grade and average house sale price. As the property grade increases, the average sale price rises substantially. Higher grade properties, particularly grade 9 to 13, have considerably higher average sale prices than lower grade properties.

This suggests that property quality is an important factor associated with house sale prices in King County.


**sqft_living (living area)**
```
SELECT
  sqft_living,
  count(*) as house_count,
  ROUND(min(price),2) as min_price,
  ROUND(max(price),2) as max_price,
  ROUND(AVG(price),2) as avg_price
FROM
  house_price
Group BY sqft_living
ORDER BY avg_price DESC;
```
**Results**

*Living Area vs. House Price*
![living_area](/PROJECT/IMAGES/Living%20Area.jpg)

### Insights

The analysis shows a positive relationship between living area and house price. In general, houses with larger living areas tend to have higher sale prices.

However, the scatter plot also shows considerable variation in prices among houses with similar living areas. This indicates that living area alone does not determine house price, and other factors such as property grade, location, condition, and amenities also contribute to differences in sale prices.


### 2. How Does Location Affect House Prices in King County?
This question examines differences in house prices across **ZIP codes** within King County.

The analysis compares:
- Average house prices by ZIP code.
- The highest-priced ZIP codes based on average sale price.
- The number of houses represented in each ZIP code.

This helps identify areas where houses tend to have higher average sale prices.

```
SELECT
  zipcode,
  count(*) as house_count,
  ROUND(min(price),2) as min_price,
  ROUND(max(price),2) as max_price,
  ROUND(AVG(price),2) as average_price
FROM house_price
Group BY zipcode
ORDER BY average_price DESC
limit 10;
```
**Results**

*Location and house prices*
![zipcode](/PROJECT/IMAGES/Zipcode.jpg)

### Insights
House prices vary considerably across ZIP codes in King County. The highest average house prices are concentrated in a small number of ZIP codes.

ZIP code 98039 has the highest average house sale price at approximately $2.16 million, followed by 98004 at approximately $1.36 million and 98040 at approximately $1.19 million.

This indicates that location is an important factor associated with differences in house prices across King County.

### 3. What Property Grade Offers the Best Value?
This question evaluates the combination of **property size, quality, and price** that provides relatively good value.

The analysis considers:
- Average living area (`sqft_living`) as a measure of size.
- Property grade (`grade`) as an indicator of quality.
- Average price per square foot (`price / sqft_living`) as a measure of affordability.

Properties or property grades with **higher quality and size but lower-than-average price per square foot** are considered to have a stronger value proposition.

```
SELECT
  ROUND(AVG(sqft_living), 2) AS Average_sqft_living,
  ROUND(AVG(price/sqft_living),2) As Average_price_per_sqft
FROM house_price;


SELECT
    grade,
    COUNT(*) AS house_count,
    ROUND(AVG(sqft_living), 2) AS avg_size,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(price / sqft_living), 2) AS avg_price_per_sqft
FROM house_price
GROUP BY grade
HAVING ROUND(AVG(sqft_living), 2) > 2079.9 
AND ROUND(AVG(price / sqft_living), 2) < 264.16 
ORDER BY grade;
```
**Results**

*Best Value*
![properties](/PROJECT/IMAGES/best%20value.jpg)

### Insights
The analysis identified Grade 8 properties as a strong value segment based on the combination of size, quality, and price per square foot.

Grade 8 properties represent 6,068 houses, with an average living area of approximately 2,184.75 sqft, an average sale price of approximately $542,852.77, and an average price of $258.09 per square foot.

This suggests that Grade 8 properties offer a relatively balanced combination of property quality, living space, and price.

### Conclusion
The analysis of house sales in King County shows that **property grade, living area, and location** are important factors associated with house sale prices. Higher-grade and larger properties generally have higher average sale prices, while substantial differences in prices exist across ZIP codes. The value analysis also suggests that some property grades, particularly **Grade 8**, provide a relatively balanced combination of size, quality, and price per square foot.

Overall, the findings demonstrate how **SQL** can be used to uncover patterns in housing data and **Power BI** can transform those results into clear, interactive visualizations for decision-making.




