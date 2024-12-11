INSERT INTO Books (title, author, isbn, genre, published_year, quantity_available) 
VALUES ('Fear Nothing', 'Dean Koontz', '9780553479003', 'thriller', 1997, 5)
RETURNING *;