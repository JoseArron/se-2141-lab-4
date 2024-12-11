CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(128) UNIQUE NOT NULL,
    membership_date DATE NOT NULL
  );
 
CREATE TABLE books (
	isbn VARCHAR(17) PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(50),
    published_year INT,
    quantity_available INT NOT NULL
  );

CREATE TYPE STATUS AS ENUM('borrowed', 'returned', 'overdue');
CREATE TABLE book_loans (
    user_id UUID REFERENCES users (user_id) ON DELETE CASCADE NOT NULL,
    isbn VARCHAR(17) REFERENCES books (isbn) ON DELETE CASCADE NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    status STATUS NOT NULL
  );

CREATE INDEX idx_overdue_loans ON book_loans (status, loan_date); 