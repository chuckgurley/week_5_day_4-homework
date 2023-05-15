-- Tonight create two procedures that do the following:

-- 1. Create a procedure that adds a late fee to any customer who returned their rental after 7 days.
-- Use the payment and rental tables.

-- SELECT return_date, rental_date
-- FROM customer
-- WHERE (return_date - rental_date) > INTERVAL 7 DAY



CREATE PROCEDURE add_late_fee()



BEGIN
    SELECT customer_id
    FROM rental  ON payment.rental_id = rental.rental_id
    SET payment.amount = payment.amount + 5.00
    WHERE (return_date - rental_date) > 7 DAY
END;


-- SELECT customer_id
-- FROM rental
-- SELECT  (return_date - rental_date) > 7;

-- SELECT *
-- FROM payment
-- WHERE  (return_date - rental_date) > 7;

-- SELECT *
-- FROM rental








-- 2. Add a new column in the customer table for Platinum Member. This can be a boolean.
-- Platinum Members are any customers who have spent over $200. 
-- Create a procedure that updates the Platinum Member column to True for any customer who has spent over $200 and False for any customer who has spent less than $200.
-- Use the payment and customer table.



-- ALTER TABLE customer ADD COLUMN platinum_member BOOLEAN; <++ ALREDY CREATED

CREATE PROCEDURE update_platinum_member()

BEGIN
    UPDATE customer
    SET platinum_member = (
        SELECT SUM(amount) >= 200
        FROM payment
        WHERE payment.customer_id = customer.customer_id
        GROUP BY customer_id
    )
END





-- ALTER TABLE customer ADD COLUMN platinum_member BOOLEAN;

-- PROCEDURE update_platinum_member()

-- BEGIN
--     FOR payment IN SELECT payment.customer_id, SUM(payment.amount) AS total_payment
--                        FROM customer 
--                        JOIN payment  ON customer.customer_id = payment.customer_id
--                        GROUP BY c.customer_id
--     LOOP
--         UPDATE customer SET platinum_member = (customer_id.total_payment >= 200)
--         WHERE customer_id = customer.customer_id;
--     END LOOP;
-- END;
-- $$ LANGUAGE plpgsql;


SELECT *
FROM customer


SELECT *
FROM payment




subQ


