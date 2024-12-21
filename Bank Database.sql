-- 1 --

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth VARCHAR (15) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL,
   );

INSERT INTO Clients (ClientID, FirstName, LastName, DateOfBirth, Email, PhoneNumber)
VALUES (1, 'Nikola', 'Boshkov', '10.10.1995', 'nm@live.com', '111111'),
(2, 'Petar', 'Smilevski', '18.03.1987', 'ps@yahoo.com', '222222'),
(3, 'Sara', 'Maneva', '23.11.2000', 'am@hotmail.com', '333333'),
(4, 'Bojan', 'Janev', '07.08.1966', 'bj@yahoo.com', '444444'),
(5, 'Ana', 'Mladenovska', '15.02.1993', 'am@gmail.com', '555555'),
(6, ' Elena', 'Markovska', '09.09.2001', 'em@icloud.com', '666666'),
(7, 'Darko', 'Jovevski', '30.01.1975', 'dj@gmail.com', '777777'),
(8, 'Jovan', 'Apostolovski', '08.10.1986', 'ja@yahoo.com', '888888');

SELECT * FROM Clients


CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    ClientID INT NOT NULL,
    AccountNumber VARCHAR(20) UNIQUE NOT NULL,
    AccountType VARCHAR (20) NOT NULL,
    Balance DECIMAL(15, 2),

    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

INSERT INTO Accounts (AccountID, ClientID, AccountNumber, AccountType, Balance)
VALUES (1, 1, '1111111111111111', 'Checking', 15530),
(2, 2, '222222222222222', 'Checking', 35000),
(3, 3, '333333333333333', 'Savings', 645000),
(4, 4, '444444444444444', 'Checking', 56595),
(5, 5, '555555555555555', 'Savings', 2250.35),
(6, 6, '666666666666666', 'Checking', 325000),
(7, 7, '777777777777777', 'Checking', 65450),
(8, 8, '888888888888888', 'Savings', 6500.98);

SELECT * FROM Accounts


CREATE TABLE Savings (
    SavingsID INT PRIMARY KEY,
    AccountID INT NOT NULL,
    InterestRate DECIMAL(5, 2),

    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Savings (SavingsID, AccountID, InterestRate)
VALUES (1, 3, 3.8),
(2, 5, 1.25),
(3, 8, 4.2);

SELECT * FROM Savings


CREATE TABLE DebitCards (
    DebitCardID INT PRIMARY KEY,
    AccountID INT NOT NULL,
    CardNumber VARCHAR(16) UNIQUE NOT NULL,
	IssueDate DATE,
    ExpiryDate DATE,
    CVV CHAR(3) NOT NULL,
    IsActive BIT,
    
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID) ON DELETE CASCADE
);

INSERT INTO DebitCards (DebitCardID, AccountID, CardNumber, Issuedate, ExpiryDate, CVV, IsActive)
VALUES (1, 1, '4324111111111111', '2022-02-01', '2029-02-01', '123', 1),
(2, 2, '5437222222222222', '2027-08-02', '2032-08-02', '456', 1),
(3, 4, '5422333333333333', '2020-11-12', '2025-11-12', '789', 0),
(4, 6, '4358444444444444', '2025-07-23', '2030-07-23', '159', 1),
(5, 7, '5422555555555555', '2022-05-15', '2027-05-15', '753', 0);

SELECT * FROM DebitCards

CREATE TABLE Credits (
    CreditID INT PRIMARY KEY,
    ClientID INT NOT NULL,
    LoanAmount INT,
    InterestRate DECIMAL(5, 2) NOT NULL,
    LoanStartDate DATE,
    LoanEndDate DATE,

    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID) 
);

INSERT INTO Credits (CreditID, ClientID, LoanAmount, InterestRate, LoanStartDate, LoanEndDate)
VALUES (1, 2, 250000, 2.8,  '2015-02-01', '2040-02-01'),
(2, 4, 40000, 3.5, '2018-04-03', '2028-04-03'),
(3, 5, 100000, 4.1, '2020-06-05', '2035-06-05'),
(4, 7, 60000, 2.3, '2009-08-07', '2039-08-07'),
(5, 8, 450000, 3.2, '2024-10-09', '2029-10-09');

SELECT * FROM Credits

-- 2 --
 -- Design Decision:

-- Define each table's purpose and its key columns. Decide on the relationships between tables 
-- (e.g., a client may have multiple accounts or debit cards).
-- Create a clear structure that ensures data integrity and ease of access.

-- Reshenijata na tochka 2 se opfateni vo tochka 1 preku spojuvanjeto na tabelite so pomosh na foreign keys
-- PRIMER: Accounts so Clients, Savings, Debit Cards, ili Clients so Credits.


-- 3 --
-- Write the following SQL queries to retrieve specific data from the Bank Database:


-- Query 1:
-- List all clients who have more than a specific amount in their savings account (e.g., $10,000).

SELECT 
    c.FirstName, 
    c.LastName, 
    a.AccountNumber, 
    a.Balance
FROM 
    Clients c
JOIN Accounts a ON c.ClientID = a.ClientID
JOIN Savings s ON a.AccountID = s.AccountID
WHERE a.AccountType = 'Savings' AND a.Balance > 10000;

-- Query 2: 
-- Retrieve all debit cards issued within a specific date range.

SELECT 
    c.FirstName, 
    c.LastName, 
    d.CardNumber, 
    d.IssueDate
FROM 
    Clients c
JOIN Accounts a ON c.ClientID = a.ClientID
JOIN DebitCards d ON a.AccountID = d.AccountID
WHERE d.IssueDate BETWEEN '2023-01-01' AND '2028-12-31';

-- Query 3: 
-- List all clients who have taken credit, along with the credit amount and start date, filtering for credits issued after a specific date (e.g., after 2023).

SELECT 
    cl.ClientID,
    cl.FirstName,
	cl.LastName,
    cr.LoanAmount,
    cr.LoanStartDate
FROM Credits cr
JOIN Clients cl ON cr.ClientID = cl.ClientID
WHERE cr.LoanStartDate > '2020-01-01';