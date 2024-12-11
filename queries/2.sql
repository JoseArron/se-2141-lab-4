INSERT INTO users (full_name, email, membership_date) 
VALUES ('Shishh', 'wooaah@gmail.com', CURRENT_DATE)
RETURNING *;