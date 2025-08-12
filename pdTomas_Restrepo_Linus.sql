CREATE DATABASE pdTomas_Restrepo_Linus;
USE  pdTomas_Restrepo_Linus;

CREATE TABLE CLIENTS (
	id INT PRIMARY KEY AUTO_INCREMENT,
	client_name VARCHAR(100) NOT NULL,
	identification_number VARCHAR(20) NOT NULL,
	client_address VARCHAR(255),
	phone VARCHAR(20),
	email VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE TRANSACTIONS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Date_and_time_of_the_transaction DATETIME DEFAULT CURRENT_TIMESTAMP,
    transaction_amount DECIMAL(10, 2) NOT NULL,
    transaction_status ENUM('pending', 'completed', 'failed') DEFAULT 'pending',
    transaction_type ENUM('bill_payment') DEFAULT 'bill_payment',
    platform ENUM('Nequi', 'Daviplata') NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES CLIENTS(id)
);   

CREATE TABLE INVOICES (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_number VARCHAR(50) NOT NULL UNIQUE,
    billing_period VARCHAR(20) NOT NULL,
    billed_amount DECIMAL(10, 2) NOT NULL,
    amount_paid DECIMAL(10, 2) DEFAULT 0.00,
    transaction_id INT NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES TRANSACTIONS(id)
);   
	







)

