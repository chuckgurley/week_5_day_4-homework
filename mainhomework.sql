-- 1. Create a procedure that adds a late fee to any customer who returned their rental after 7 days.
-- Use the payment and rental tables.





SELECT customer_id
FROM rental
GROUP BY customer_id
HAVING AOTEFF(return_date, rental_date) AS datediff > 7

SELECT DATEDIFF(days, return_date, rental_id) AS DATEdiff;
FROM rental;

--  2. Add a new column in the customer table for Platinum Member. This can be a boolean.
-- Platinum Members are any customers who have spent over $200. 
-- Create a procedure that updates the Platinum Member column to True for any customer who has spent over $200 and False for any customer who has spent less than $200.
-- Use the payment and customer table.




CREATE PROCEDURE customer_plat()
BEGIN
	UPDATE customer; 
	SET platinum_member = TRUE
	WHERE customer_id IN (
			Select customer_id
			FROM payment
			GROUP BY customer_id, amount
			HAVING SUM(amount) >200 );
END;


CREATE PROCEDURE customer_plat()
BEGIN
	UPDATE customer;
	SET platinum_member = TRUE
	WHERE customer_id IN (
			SELECT customer_id
			FROM payment
			GROUP BY customer_id
			HAVING SUM(amount) > 200
	);
END;