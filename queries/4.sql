SELECT b.title, bl.loan_date, bl.status
FROM Books b 
JOIN Book_Loans bl ON b.ISBN = bl.ISBN 
WHERE bl.User_ID = '17796446-e394-48d1-9f5d-b5f011dbbe3e';