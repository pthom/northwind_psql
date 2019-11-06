Albert Yakubov
NorthWing Database Practice: 

Created own dataset called budget, with Table called Accounts
Then inserted my first value:

INSERT INTO accounts(account_id, first_name, last_name, account_name, budget)
VALUES (1234, 'The Shire', 'Bilbo', 'Hobbit-Hole', 'Bag End', 1000.000)

Checked if the value actually inserted and it did:

SELECT * FROM accounts

find all customers that live in London. Returns 6 records.
SELECT * 
FROM customers
WHERE city = 'London'

find all customers with postal code 1010. Returns 3 customers.
SELECT * 
FROM customers
WHERE postal_code = '1010'

find the phone number for the supplier with the id 11. Should be (010) 9984510.
SELECT * 
FROM suppliers
WHERE supplier_id= '11'

EXTRA:
this query work for finding a number containing certain digits
SELECT * 
FROM suppliers
WHERE phone LIKE '%11%'

list orders descending by the order date. The order with date 1998-05-06 should be at the top.
SELECT DISTINCT order_id, ship_name, order_date
FROM orders
ORDER BY order_id DESC

find all suppliers who have names longer than 20 characters. You can use length(company_name) to get the length of the name. Returns 11 records.
SELECT LENGTH(company_name), contact_name  
FROM suppliers
WHERE LENGTH(company_name) > 20




