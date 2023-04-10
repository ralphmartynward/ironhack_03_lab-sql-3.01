-- Activity 1 

USE sakila;

-- 1. Drop column picture from staff.
ALTER TABLE sakila.staff
DROP COLUMN picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. 
-- Update the database accordingly.

SELECT * FROM sakila.customer where first_name = 'TAMMY' and last_name = 'SANDERS';
-- now I know the customer_id is 79 and her details 
SELECT * FROM staff WHERE first_name LIKE 'Jon';
-- now I know the store_id is 2 where Jon and Tammy will be working together

INSERT INTO staff(staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update)
VALUES
(3,'Tammy','Sanders', 79, 'Tammy.Sanders@sakilastaff.com', 2, 1, 'Tammy', null, '2023-04-10 14:08:00');

-- check if she was added correctly
SELECT * FROM sakila.staff;


-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- You can use current date for the rental_date column in the rental table. 
-- Hint: Check the columns in the table rental and see what information you would need to add there. 
-- You can query those pieces of information. For eg., you would notice that you need customer_id information as well. 
-- To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

-- Customer ID is 130

SELECT first_name, last_name, staff_id, store_id from staff
where store_id = 1, 

-- Mike has staff_id = 1

SELECT * FROM rental
-- I see that I need to add the following columns: rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
-- I can also see that the last rental_id is 16049, so I can use 16050 for my new rental

SELECT title, film_id from film
WHERE title='Academy Dinosaur';
-- "Academy Dinosaur" has film_id = 1

SELECT film_id, inventory_id, store_id from inventory
WHERE film_id = 1 and store_id = 1;
-- "Academy Dinosaur" has inventory_id = 1, 2; 3 & 4

SELECT inventory_id, rental_date, return_date from sakila.rental
WHERE inventory_id BETWEEN 1 and 4;
-- Everything has been returned so I can use any of the inventory_id's 


-- Now add the new rental with info gathered 
INSERT INTO rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id)
VALUES
(16050, '2023-04-10 14:08:00', 1, 130, null, 1);

-- check if she was added correctly
SELECT * from rental
where rental_id = 16050;




