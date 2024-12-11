INSERT INTO Book_Loans (user_id, isbn, loan_date, status) 
VALUES ('17796446-e394-48d1-9f5d-b5f011dbbe3e', '9780553479003', CURRENT_DATE, 'borrowed')
RETURNING *;