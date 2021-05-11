

DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;

CREATE TABLE card_holder (
    card_holder_id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY (card_holder_id)
);
CREATE TABLE credit_card (
    card VARCHAR(20) NOT NULL,
    card_holder_id INT NOT NULL,
	PRIMARY KEY (card),
    FOREIGN KEY (card_holder_id) REFERENCES card_holder(card_holder_id)
);
CREATE TABLE merchant_category (
    merchant_category_id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY (merchant_category_id)
);
CREATE TABLE merchant (
    merchant_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
	merchant_category_id INT NOT NULL,
	PRIMARY KEY (merchant_id),
    FOREIGN KEY (merchant_category_id) REFERENCES merchant_category(merchant_category_id)
);
CREATE TABLE transaction (
    transaction_id INT NOT NULL,
	transaction_date TIMESTAMP NOT NULL,
	card VARCHAR(20) NOT NULL,
	merchant_id INT NOT NULL,
    FOREIGN KEY (card) REFERENCES credit_card(card),
	FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id)
);