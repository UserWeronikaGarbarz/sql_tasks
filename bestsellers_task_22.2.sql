DROP PROCEDURE IF EXISTS UpdateBestsellers;
ALTER TABLE books
DROP COLUMN bestseller;

DELIMITER $$

ALTER TABLE books 
ADD bestseller BOOLEAN;

CREATE PROCEDURE UpdateBestsellers()

BEGIN

DECLARE booksRented, days, bookId INT;
DECLARE rentedPerMonth DECIMAL(5,2);
DECLARE finished INT DEFAULT 0;
DECLARE all_books CURSOR FOR SELECT book_id FROM books;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
OPEN all_books;
WHILE (finished = 0) DO
FETCH all_books INTO bookId;
IF (finished  = 0) THEN
SELECT COUNT(*) FROM rents
WHERE book_id = bookId
INTO booksRented;
SELECT DATEDIFF(MAX(RENT_DATE), MIN(RETURN_DATE)) +1 FROM rents
WHERE book_id = bookId
INTO days;
SET rentedPerMonth = booksRented / days * 30;
IF (rentedPerMonth > 2) THEN
UPDATE books SET bestseller = TRUE
WHERE book_id = bookId;
ELSE 
UPDATE books SET bestseller = FALSE
WHERE book_id = bookId;
END IF;
COMMIT;
END IF;
END WHILE;
CLOSE all_books;
END $$
DELIMITER ;

CALL UpdateBestsellers();
