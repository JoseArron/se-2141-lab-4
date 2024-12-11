DO $$
DECLARE
    p_user_id UUID = 'caf349f9-e451-462f-a67a-2a5c80ffaf75';
    p_isbn VARCHAR(17) = '9780553479003';
    available_count INT;
BEGIN
    SELECT quantity_available INTO available_count 
    FROM books 
    WHERE isbn = p_isbn;

    --check for possible errors
    IF available_count IS NULL THEN
        RAISE EXCEPTION 'Book not found.';
    ELSIF available_count <= 0 THEN
        RAISE EXCEPTION 'Sorry. There are no copies left for this book.';
    END IF;

   --insert to book loans table
    INSERT INTO book_loans (user_id, isbn, loan_date, status) 
    VALUES (p_user_id, p_isbn, CURRENT_DATE, 'borrowed');

    --update qty
    UPDATE books 
    SET quantity_available = quantity_available - 1 
    WHERE isbn = p_isbn;

END $$;