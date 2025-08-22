-- LOAD THE ALL THE DATASET

-- ARTIST
CREATE TABLE Artist (
    artist_id INT PRIMARY KEY,
    name VARCHAR(100)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/iTUNES Dataset/artist.csv'
INTO TABLE Artist
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@artist_id,@name)
SET
	artist_id = NULLIF(@artist_id, ''),
    name = NULLIF(@name, '');

-- ALBUM
CREATE TABLE Album (
    album_id INT PRIMARY KEY,
    title VARCHAR(100),
	artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/iTUNES Dataset/album.csv'
INTO TABLE Album
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@album_id,@title,@artist_id)
SET
    album_id = NULLIF(@album_id, ''),
    title = NULLIF(@title, ''),
	artist_id = NULLIF(@artist_id, '');

-- GENRE
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,
    name VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/iTUNES Dataset/genre.csv'
INTO TABLE Genre
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@genre_id,@name)
SET
	genre_id = NULLIF(@genre_id, ''),
    name = NULLIF(@name, '');

-- MEDIA TYPE
CREATE TABLE Media_type (
    media_type_id INT PRIMARY KEY,
    name VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/iTUNES Dataset/media_type.csv'
INTO TABLE Media_type
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@media_type_id,@name)
SET
	media_type_id = NULLIF(@media_type_id, ''),
    name = NULLIF(@name, '');

-- PLAYLIST
CREATE TABLE Playlist (
    playlist_id INT PRIMARY KEY,
    name VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/iTUNES Dataset/playlist.csv'
INTO TABLE Playlist
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@playlist_id,@name)
SET
	playlist_id = NULLIF(@playlist_id, ''),
    name = NULLIF(@name, '');

-- PLAYLIST TRACK
CREATE TABLE Playlist_track (
    playlist_id INT,
    track_id INT,
    PRIMARY KEY (playlist_id, track_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/iTUNES Dataset/playlist_track.csv'
INTO TABLE Playlist_track
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@playlist_id, @track_id)
SET
	playlist_id = NULLIF(@playlist_id, ''),
    track_id = NULLIF(@track_id, '');


-- EMPLOYEE
SET foreign_key_checks = 0;

CREATE TABLE Employee (
	employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    title VARCHAR(50),
    reports_to INT,
    levels VARCHAR(50),
    birthdate DATE,
    hire_date DATE,
    address VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(50),
    phone  VARCHAR(25),
    fax  VARCHAR(25),
    email VARCHAR(50),
    FOREIGN KEY (reports_to) REFERENCES Employee(employee_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/iTUNES Dataset/employee.csv'
INTO TABLE Employee
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@employee_id, @first_name, @last_name, @title,@reports_to,@levels,@birthdate, @hire_date, @address, @city, @state, @country, @postal_code, @phone, @fax ,@email)
SET
	employee_id = NULLIF(@employee_id, ''),
    first_name = NULLIF(@first_name, ''),
    last_name = NULLIF(@last_name, ''), 
    title = NULLIF(@title, ''), 
    reports_to = NULLIF(@reports_to, '') ,
    levels = NULLIF(@levels, ''),
    birthdate = STR_TO_DATE(@birthdate, '%d-%m-%Y %H:%i'), 
    hire_date = STR_TO_DATE(@hire_date, '%d-%m-%Y %H:%i'),
    address = NULLIF(@address, ''),
    city = NULLIF(@city, ''), 
    state = NULLIF(@state, ''), 
    country = NULLIF(@country, ''),
    postal_code = NULLIF(@postal_code, ''),
    phone = NULLIF(@phone, ''),
    fax = NULLIF(@fax, ''),
    email = NULLIF(@email, '');

-- CUSTOMER
CREATE TABLE Customer (
	customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    company VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(50),
    phone  VARCHAR(25),
    fax  VARCHAR(25),
    email VARCHAR(50),
    support_rep_id INT,
    FOREIGN KEY (support_rep_id) REFERENCES Employee(employee_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/iTUNES Dataset/customer.csv'
INTO TABLE Customer
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@customer_id, @first_name, @last_name, @company,@address, @city, @state, @country, @postal_code, @phone, @fax ,@email , @support_rep_id)
SET
	customer_id = NULLIF(@customer_id, ''),
    first_name = NULLIF(@first_name, ''),
    last_name = NULLIF(@last_name, ''), 
    company = NULLIF(@company, ''), 
    address = NULLIF(@address, ''),
    city = NULLIF(@city, ''), 
    state = NULLIF(@state, ''), 
    country = NULLIF(@country, ''),
    postal_code = NULLIF(@postal_code, ''),
    phone = NULLIF(@phone, ''),
    fax = NULLIF(@fax, ''),
    email = NULLIF(@email, ''),
    support_rep_id = NULLIF(@support_rep_id, ''); 

-- INVOICE
CREATE TABLE Invoice (
	invoice_id INT PRIMARY KEY,
    customer_id INT,
    invoice_date DATE,
    billing_address VARCHAR(50),
    billing_city VARCHAR(50),
    billing_state VARCHAR(50),
    billing_country VARCHAR(50),
    billing_postal_code VARCHAR(50),
    total FLOAT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/iTUNES Dataset/invoice.csv'
INTO TABLE Invoice
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@invoice_id, @customer_id, @invoice_date, @billing_address, @billing_city, @billing_state, @billing_country, @billing_postal_code, @total)
SET
	invoice_id = NULLIF(@invoice_id, ''),
    customer_id = NULLIF(@customer_id, ''),
    invoice_date = STR_TO_DATE(@invoice_date, '%Y-%m-%d %H:%i:%s'), 
    billing_address = NULLIF(@billing_address, ''),
    billing_city = NULLIF(@billing_city, ''), 
    billing_state = NULLIF(@billing_state, ''), 
    billing_country = NULLIF(@billing_country, ''),
    billing_postal_code = NULLIF(@billing_postal_code, ''),
    total = NULLIF(@total, '');

-- INVOICE LINE 
CREATE TABLE Invoice_line (
	invoice_line_id INT PRIMARY KEY,
    invoice_id INT,
    track_id INT,
    unit_price FLOAT,
    quantity INT,
    FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/iTUNES Dataset/invoice_line.csv'
INTO TABLE Invoice_line
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@invoice_line_id ,@invoice_id ,@track_id ,@unit_price ,@quantity)
SET
	invoice_line_id = NULLIF(@invoice_line_id, ''),
    invoice_id = NULLIF(@invoice_id, ''),
    track_id = NULLIF(@track_id, ''),
    unit_price = NULLIF(@unit_price, ''), 
    quantity = NULLIF(@quantity, '');
    

-- PREPROCESSING STEPS --

-- check datatype 
 DESCRIBE artist;
 DESCRIBE album;
 DESCRIBE employee;
 DESCRIBE customer;
 DESCRIBE genre;
 DESCRIBE invoice;
 DESCRIBE invoice_line;
 DESCRIBE media_type;
 DESCRIBE playlist;
 DESCRIBE playlist_track;

-- check for missing values 

-- for artist table
SELECT
    SUM(artist_id IS NULL) as missing_artist_id ,
    SUM(name IS NULL) as missing_name
FROM Artist; 

-- for album table
Select 
     sum('album_id'is null) as missing_album_id,
     sum('title' is null) as missing_title,
     sum('artist_id' is null) as missing_artist_id
from Album;

-- for Genre table
SELECT
  SUM(genre_id IS NULL) AS missing_genre_id,
  SUM(name IS NULL) AS missing_name
FROM Genre;

-- for media table
SELECT
  SUM(media_type_id IS NULL) AS missing_media_type_id,
  SUM(name IS NULL) AS missing_name
FROM Media_type;

-- for playlist table
SELECT
  SUM(playlist_id IS NULL) AS missing_playlist_id,
  SUM(name IS NULL) AS missing_name
FROM Playlist;

-- For Playlist_track table
SELECT
  SUM(playlist_id IS NULL) AS missing_playlist_id,
  SUM(track_id IS NULL) AS missing_track_id
FROM Playlist_track;

-- for Customer table
SELECT
  SUM(customer_id IS NULL) AS missing_customer_id,
  SUM(first_name IS NULL) AS missing_first_name,
  SUM(last_name IS NULL) AS missing_last_name,
  SUM(company IS NULL) AS missing_company,
  SUM(address IS NULL) AS missing_address,
  SUM(city IS NULL) AS missing_city,
  SUM(state IS NULL) AS missing_state,
  SUM(country IS NULL) AS missing_country,
  SUM(postal_code IS NULL) AS missing_postal_code,
  SUM(phone IS NULL) AS missing_phone,
  SUM(fax IS NULL) AS missing_fax,
  SUM(email IS NULL) AS missing_email,
  SUM(support_rep_id IS NULL) AS missing_support_rep_id
FROM Customer;

-- for Employee table
SELECT
  SUM(employee_id IS NULL) AS missing_employee_id,
  SUM(first_name IS NULL) AS missing_first_name,
  SUM(last_name IS NULL) AS missing_last_name,
  SUM(title IS NULL) AS missing_title,
  SUM(reports_to IS NULL) AS missing_reports_to,
  SUM(levels IS NULL) AS missing_levels,
  SUM(birthdate IS NULL) AS missing_birthdate,
  SUM(hire_date IS NULL) AS missing_hire_date,
  SUM(address IS NULL) AS missing_address,
  SUM(city IS NULL) AS missing_city,
  SUM(state IS NULL) AS missing_state,
  SUM(country IS NULL) AS missing_country,
  SUM(postal_code IS NULL) AS missing_postal_code,
  SUM(phone IS NULL) AS missing_phone,
  SUM(fax IS NULL) AS missing_fax,
  SUM(email IS NULL) AS missing_email
FROM Employee;

-- for Invoice table
SELECT
  SUM(invoice_id IS NULL) AS missing_invoice_id,
  SUM(customer_id IS NULL) AS missing_customer_id,
  SUM(invoice_date IS NULL) AS missing_invoice_date,
  SUM(billing_address IS NULL) AS missing_billing_address,
  SUM(billing_city IS NULL) AS missing_billing_city,
  SUM(billing_state IS NULL) AS missing_billing_state,
  SUM(billing_country IS NULL) AS missing_billing_country,
  SUM(billing_postal_code IS NULL) AS missing_billing_postal_code,
  SUM(total IS NULL) AS missing_total
FROM Invoice;

-- for invoice_line table
SELECT
  SUM(invoice_line_id IS NULL) AS missing_invoice_line_id,
  SUM(invoice_id IS NULL) AS missing_invoice_id,
  SUM(track_id IS NULL) AS missing_track_id,
  SUM(unit_price IS NULL) AS missing_unit_price,
  SUM(quantity IS NULL) AS missing_quantity
FROM Invoice_line;


-- Handle missing values 

SET SQL_SAFE_UPDATES = 0;

-- In Customer table

UPDATE customer
SET Company = 'Unknown'
WHERE Company IS NULL;

UPDATE customer
SET State = 'Unknown'
WHERE State IS NULL;

UPDATE customer
SET postal_code = 'N/A'
WHERE postal_code IS NULL;

UPDATE customer
SET phone = 'N/A'
WHERE phone IS NULL;

UPDATE customer
SET fax = 'N/A'
WHERE fax IS NULL;

-- in Employee table 

DELETE FROM employee
WHERE reports_to IS NULL;


-- Check for Duplicates for each table

SELECT name, COUNT(*) AS count
FROM Artist
GROUP BY name
HAVING COUNT(*) > 1;

SELECT title, artist_id, COUNT(*) AS count
FROM Album
GROUP BY title, artist_id
HAVING COUNT(*) > 1;

SELECT name, COUNT(*) AS count
FROM Genre
GROUP BY name
HAVING COUNT(*) > 1;

SELECT name, COUNT(*) AS count
FROM Media_type
GROUP BY name
HAVING COUNT(*) > 1;

SELECT name, COUNT(*) AS count
FROM Playlist
GROUP BY name
HAVING COUNT(*) > 1;

SELECT playlist_id, track_id, COUNT(*) AS count
FROM Playlist_track
GROUP BY playlist_id, track_id
HAVING COUNT(*) > 1;

SELECT first_name, last_name,company,phone, email,fax, COUNT(*) AS count
FROM Customer
GROUP BY first_name, last_name,company,phone, email,fax
HAVING COUNT(*) > 1;

SELECT customer_id, invoice_date, total, COUNT(*) AS count
FROM Invoice
GROUP BY customer_id, invoice_date, total
HAVING COUNT(*) > 1;

SELECT invoice_id, track_id, unit_price, quantity, COUNT(*) AS count
FROM Invoice_line
GROUP BY invoice_id, track_id, unit_price, quantity
HAVING COUNT(*) > 1;



-- Delete Duplicates

DELETE FROM Playlist
WHERE playlist_id NOT IN (
  SELECT playlist_id FROM (
    SELECT MIN(playlist_id) AS playlist_id
    FROM Playlist
    GROUP BY name
  ) AS keep
);


DELETE FROM Invoice_line
WHERE invoice_line_id NOT IN (
  SELECT invoice_line_id FROM (
    SELECT MIN(invoice_line_id) AS invoice_line_id
    FROM Invoice_line
    GROUP BY track_id, unit_price, quantity, invoice_id
  ) AS keep
);


-- ADVANCE QUERING---

-- =========================================
-- 1. CUSTOMER ANALYTICS
-- =========================================

-- a. Customers who spent the most
SELECT c.customer_id, c.first_name, c.last_name, SUM(i.total) AS total_spent
FROM Customer c
JOIN Invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

-- b. Average Customer Lifetime Value
SELECT ROUND(AVG(customer_total), 2) AS avg_customer_lifetime_value
FROM (
    SELECT c.customer_id, SUM(i.total) AS customer_total
    FROM Customer c
    JOIN Invoice i ON c.customer_id = i.customer_id
    GROUP BY c.customer_id
) AS customer_values;

-- c. Repeat vs One-time Customers
SELECT
    CASE WHEN invoice_count > 1 THEN 'Repeat' ELSE 'One-time' END AS customer_type,
    COUNT(*) AS total_customers
FROM (
    SELECT customer_id, COUNT(*) AS invoice_count
    FROM Invoice
    GROUP BY customer_id
) AS counts
GROUP BY customer_type;

-- d. Revenue per Customer per Country
SELECT country, ROUND(SUM(i.total)/COUNT(DISTINCT c.customer_id), 2) AS revenue_per_customer
FROM Customer c
JOIN Invoice i ON c.customer_id = i.customer_id
GROUP BY country
ORDER BY revenue_per_customer DESC;

-- e. Customers inactive in last 6 months
SELECT c.customer_id, c.first_name, c.last_name, MAX(i.invoice_date) AS last_purchase
FROM Customer c
JOIN Invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id
HAVING MAX(i.invoice_date) < CURDATE() - INTERVAL 6 MONTH;

-- =========================================
-- 2. SALES & REVENUE ANALYSIS
-- =========================================

-- a. Monthly Revenue (Last 2 Years)
SELECT DATE_FORMAT(invoice_date, '%Y-%m') AS month, SUM(total) AS revenue
FROM Invoice
WHERE invoice_date >= '2019-01-01'
GROUP BY month
ORDER BY month;

-- b. Average Invoice Value
SELECT ROUND(AVG(total), 2) AS avg_invoice_value FROM Invoice;

-- c. Revenue by Sales Representative contribute
SELECT e.employee_id, e.first_name, e.last_name, ROUND(SUM(i.total),2) AS total_revenue
FROM Employee e
JOIN Customer c ON e.employee_id = c.support_rep_id
JOIN Invoice i ON c.customer_id = i.customer_id
GROUP BY e.employee_id;

-- d. Peak Sales Months or Quarters
SELECT
    DATE_FORMAT(invoice_date, '%Y-%m') AS month,
    SUM(total) AS revenue
FROM Invoice
GROUP BY month
ORDER BY revenue DESC
LIMIT 5;

-- =========================================
-- 3. PRODUCT & CONTENT ANALYSIS
-- =========================================

-- a. Tracks with Most Revenue
SELECT 
    track_id,
    SUM(unit_price * quantity) AS revenue
FROM 
    Invoice_line
GROUP BY 
    track_id
ORDER BY 
    revenue DESC
LIMIT 10;

-- b. Most Purchased Playlists
SELECT 
    p.name AS playlist_name,
    COUNT(il.track_id) AS total_purchases
FROM 
    Playlist p
JOIN 
    Playlist_track pt ON p.playlist_id = pt.playlist_id
JOIN 
    Invoice_line il ON pt.track_id = il.track_id
GROUP BY 
    p.playlist_id
ORDER BY 
    total_purchases DESC
LIMIT 10;

-- c. Tracks Never Purchased
SELECT 
    DISTINCT pt.track_id
FROM 
    Playlist_track pt
LEFT JOIN 
    Invoice_line il ON pt.track_id = il.track_id
WHERE 
    il.track_id IS NULL;

-- =========================================
-- 4. EMPLOYEE & OPERATIONAL EFFICIENCY
-- =========================================

-- a. Avg Customers per Employee
SELECT ROUND(AVG(customer_count), 2) AS avg_customers_per_employee
FROM (
    SELECT support_rep_id, COUNT(*) AS customer_count
    FROM Customer
    GROUP BY support_rep_id
) AS emp_customers;

-- b. Revenue by Employee Region (if available via address or city)
SELECT e.country, SUM(i.total) AS total_revenue
FROM Employee e
JOIN Customer c ON e.employee_id = c.support_rep_id
JOIN Invoice i ON c.customer_id = i.customer_id
GROUP BY e.country;

-- =========================================
-- 5. GEOGRAPHIC TRENDS
-- =========================================

-- a. Highest Number of Customers by Country or City
SELECT country, COUNT(*) AS total_customers
FROM Customer
GROUP BY country
ORDER BY total_customers DESC;

-- b. Revenue by Region (Country)
SELECT country, ROUND(SUM(i.total), 2) AS revenue
FROM Customer c
JOIN Invoice i ON c.customer_id = i.customer_id
GROUP BY country
ORDER BY revenue DESC;

-- =========================================
-- 6. CUSTOMER RETENTION & PATTERNS
-- =========================================

-- a. Purchase Frequency per Customer
SELECT customer_id, COUNT(*) AS purchase_count
FROM Invoice
GROUP BY customer_id;

-- b. Avg Time Between Purchases
WITH PurchaseDates AS (
  SELECT customer_id, invoice_date,
         LAG(invoice_date) OVER (PARTITION BY customer_id ORDER BY invoice_date) AS prev_purchase
  FROM Invoice
)
SELECT customer_id,
       ROUND(AVG(DATEDIFF(invoice_date, prev_purchase)), 2) AS avg_days_between
FROM PurchaseDates
WHERE prev_purchase IS NOT NULL
GROUP BY customer_id;

-- =========================================
-- 7. OPERATIONAL OPTIMIZATION
-- =========================================

-- a. Most Common Track Combinations
SELECT il1.track_id AS track1, il2.track_id AS track2, COUNT(*) AS times_bought_together
FROM Invoice_line il1
JOIN Invoice_line il2 ON il1.invoice_id = il2.invoice_id AND il1.track_id < il2.track_id
GROUP BY track1, track2
ORDER BY times_bought_together DESC
LIMIT 10;

-- b. Price vs Sales Analysis
SELECT il.unit_price, COUNT(*) AS total_sales
FROM Invoice_line il
GROUP BY il.unit_price
ORDER BY il.unit_price;
  