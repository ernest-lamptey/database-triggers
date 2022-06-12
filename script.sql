SELECT * FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log;

CREATE TRIGGER update_customer
  AFTER UPDATE ON customers
  FOR EACH ROW
  EXECUTE PROCEDURE log_customers_change();

UPDATE customers
SET first_name = 'Henry'
WHERE last_name = 'Hall';

SELECT * FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log;

UPDATE customers
SET city = 'Accra'
WHERE customer_id = 2;

SELECT * FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log;

CREATE TRIGGER customer_insert
  AFTER INSERT ON customers
  FOR EACH STATEMENT
  EXECUTE PROCEDURE log_customers_change();

INSERT INTO customers (first_name, last_name, email_address, home_phone, city, state_name, years_old)
VALUES ('Jeffrey', 'Cook', 'Jeffrey.Cook@example.com', '202-555-0398', 'Jersey city', 'New Jersey', 66),
('Ernest', 'Lamptey', 'elamptey@gmail.com', '059-300-1000', 'Nungua', 'Accra', 29),
('Gifty', 'Adu', 'gifty@hotmail.com', '020-998-0909', 'Kroma', 'Kumasi', 24);

SELECT * FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log;

CREATE TRIGGER override_age
  BEFORE UPDATE ON customers
  FOR EACH ROW
  WHEN (NEW.years_old < 13)
  EXECUTE PROCEDURE override_with_min_age();

UPDATE customers
SET years_old = 11
WHERE first_name = 'Gifty';

UPDATE customers
SET years_old = 18, first_name = 'James'
WHERE first_name = 'Henry';

SELECT * FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log;

DROP TRIGGER override_age ON customers;

SELECT * FROM information_schema.triggers;