SELECT b.title, bl.loan_date, bl.status
FROM books b 
JOIN book_loans bl ON b.isbn = bl.isbn 
WHERE bl.user_id = 'caf349f9-e451-462f-a67a-2a5c80ffaf75';