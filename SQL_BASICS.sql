SELECT
    'London' as place,
    day, 
    hour,
    phenomena,
    temperature*9/5+32 as "temperature in Fahrenheit",
    feels_like < temperature as "feels colder",
    wind_speed as "wind speed in m/s"
FROM
    weather
;

SELECT
    id, 
    title,
    author,
    language,
    rating,
    price,
    amount
FROM 
    books
WHERE
    author = 'Charles Dickens'
    AND (language = 'EN' OR language = 'FR')
    AND rating > 4.0
    AND amount > 0
;

SELECT
    hotel_id, 
    hotel_name, 
    price_per_night,
    price_for_early_check_in,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    price_per_night
;

SELECT
    hotel_id, 
    hotel_name, 
    price_per_night,
    price_for_early_check_in,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    price_per_night*2 + price_for_early_check_in
;


SELECT
    hotel_id, 
    hotel_name, 
    price_per_night,
    price_for_early_check_in,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    rating DESC  /*ASC*/
;


SELECT
    hotel_id, 
    hotel_name, 
    price_per_night,
    price_for_early_check_in,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    rating DESC,
    price_per_night*2 + price_for_early_check_in 
;


SELECT
    hotel_name, 
    price_per_night*2 + price_for_early_check_in AS total_price,
    rating, 
    stars
FROM 
    hotels
ORDER BY
    total_price, 3 DESC
;

/*AGGREGATE FUNCTIONS*/

SELECT AVG(price) as avg_price, AVG(yesterday_deals) as avg_deals 
FROM stocks 
WHERE price > 40;


SELECT name FROM teachers 
UNION 
SELECT name FROM administrative_staff;


INSERT INTO customers (name, surname, zip_code, city) 
VALUES ('Mary', 'West', 75201, 'Dallas'), ('Steve', 'Palmer', 33107, 'Miami');


SELECT stock_name, MAX(price) as maximum
FROM stocks
GROUP BY stock_name;


SELECT stock_name, MIN(datetime) as moment, MAX(price) as maximum
FROM stocks
GROUP BY stock_name;


UPDATE table SET capacity = 40 WHERE LOCATE('Algebra', course) > 0 OR tutor = 'Laura Gibbs';

