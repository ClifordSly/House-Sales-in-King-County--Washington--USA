-- Load the CSV data into the house_price table that I had already created
-- Copy it to psql tool in order to load the data
\copy house_price FROM 'C:/Users/Pc/Desktop/House Sales/house_price.csv' WITH (FORMAT csv, HEADER true);



