## SE 2141 LAB 4
> Online Library Management System Database Design <br>
> Suoberon, Jose Arron Franz I.

## Table of Contents

- [Conceptual Design](#conceptual-design)
- [Logical Design](#logical-design)
- [SQL Queries](#sql-queries)
- [Data Integrity and Optimization](#data-integrity-and-optimization)
- [Reflection](#reflection)


## Conceptual Design

<b>Entity-Relationship (ER) Diagram</b> for the system based on the given
requirements

![The ERD diagram of the system](conceptual_design.png)

## Logical Design

[Table Schemas](schema.sql)

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE Users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    membership_date DATE NOT NULL
  );
  
CREATE TABLE Books (
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    isbn VARCHAR(17) PRIMARY KEY NOT NULL,
    genre VARCHAR(50),
    published_year INT,
    quantity_available INT NOT NULL,
  );
  
CREATE TABLE Book_Loans (
    user_id UUID REFERENCES Users (user_id) ON DELETE CASCADE,
    isbn VARCHAR(17) REFERENCES Books (isbn) ON DELETE CASCADE,
    loan_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR(50) NOT NULL
  );

```

## SQL Queries
1. Insert a new book into the library with a quantity of 5.

[Query 1](queries/1_output.sql)
```sql
INSERT INTO Books (title, author, isbn, genre, published_year, quantity_available) 
VALUES ('Fear Nothing', 'Dean Koontz', '9780553479003', 'thriller', 1997, 5)
RETURNING *;
```
![Output of query 1](queries/1_output.png)

2. Add a new user to the system.

[Query 2](queries/2_output.sql)
```sql
INSERT INTO Users (full_name, email, membership_date) 
VALUES ('Shishh', 'wooaah@gmail.com', CURRENT_DATE)
RETURNING *;
```
![Output of query 2](queries/2_output.png)

3. Record a book loan for a user.

[Query 3](queries/3_output.sql)
```sql
INSERT INTO Book_Loans (user_id, isbn, loan_date, status) 
VALUES ('17796446-e394-48d1-9f5d-b5f011dbbe3e', '9780553479003', CURRENT_DATE, 'borrowed')
RETURNING *;
```
![Output of query 3](queries/3_output.png)

4. Find all books borrowed by a specific user.

[Query 4](queries/4_output.sql)
```sql
SELECT b.title, bl.loan_date, bl.status
FROM Books b 
JOIN Book_Loans bl ON b.ISBN = bl.ISBN 
WHERE bl.User_ID = '17796446-e394-48d1-9f5d-b5f011dbbe3e';
```
![Output of query 4](queries/4_output.png)

5. Add a new user to the system.

[Query 5](queries/5_output.sql)
```sql
SELECT *
FROM Book_Loans
WHERE status = 'overdue';
```
![Output of query 5](queries/5_output.png)

## Data Integrity and Optimization



## Reflection



