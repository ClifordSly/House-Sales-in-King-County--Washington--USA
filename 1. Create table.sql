-- Create a table to store the house_price.csv data
CREATE TABLE house_price (
    id BIGINT,
    date DATE,
    price NUMERIC,
    bedrooms INTEGER,
    bathrooms NUMERIC,
    sqft_living INTEGER,
    sqft_lot INTEGER,
    floors NUMERIC,
    waterfront INTEGER,
    view INTEGER,
    condition INTEGER,
    grade INTEGER,
    sqft_above INTEGER,
    sqft_basement INTEGER,
    yr_built INTEGER,
    yr_renovated INTEGER,
    zipcode INTEGER,
    lat NUMERIC,
    long NUMERIC,
    sqft_living15 INTEGER,
    sqft_lot15 INTEGER
);
