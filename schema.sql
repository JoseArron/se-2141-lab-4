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
    quantity_available INT NOT NULL
  );
  
CREATE TABLE Book_Loans (
    user_id UUID REFERENCES Users (user_id) ON DELETE CASCADE,
    isbn VARCHAR(17) REFERENCES Books (isbn) ON DELETE CASCADE,
    loan_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR(50) NOT NULL
  );