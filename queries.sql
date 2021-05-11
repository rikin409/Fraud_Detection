--Investigate which cards have a lot of transactions under $2
SELECT COUNT(amount),card FROM transaction WHERE amount<2 GROUP BY card

-- Investigate which cards have a lot of transaction between 7AM and 9AM
select card, COUNT(*) from transaction where transaction_date::time between '07:00' and '09:00' GROUP BY card

-- Investigate which cards have a lot of transactions between 7 and 9 that are under $2.00
select card, COUNT(*) from transaction where (transaction_date::time between '07:00' and '09:00') and (amount<2.00) GROUP BY card 

-- Get a count of how many transactions occured between 7 and 9
select COUNT(*) from transaction where (transaction_date::time between '07:00' and '09:00')

-- Get a count of how many transactions occured between 7 and 9 and were less than $2
select COUNT(*) from transaction where (transaction_date::time between '07:00' and '09:00') and (amount<2.00)

--Get a count of total transactions
select COUNT(*) from transaction

--Get a count of total transactions under $2
select COUNT(*) from transaction where amount<2.00

-- Get the amount of transactions under $2 by merchant name
SELECT merchant.name, COUNT(*)
FROM merchant
JOIN transaction
ON (merchant.merchant_id = transaction.merchant_id)
WHERE amount<2.00
GROUP BY merchant.name
ORDER BY COUNT(*) DESC

-- Get all the transactions done by customer 2 and customer 18
select credit_card.card, credit_card.card_holder_id, transaction.transaction_date, transaction.amount from credit_card JOIN transaction  ON (credit_card.card = transaction.card) where credit_card.card_holder_id = 2

select credit_card.card, credit_card.card_holder_id, transaction.transaction_date, transaction.amount from credit_card JOIN transaction  ON (credit_card.card = transaction.card) where credit_card.card_holder_id = 18

-- Get all the transactions for customer 25 between january and june

select transaction.transaction_date, transaction.amount from credit_card JOIN transaction  ON (credit_card.card = transaction.card) where credit_card.card_holder_id = 25 and transaction_date::date between '2018-01-01' and '2018-06-30'
