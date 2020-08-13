DROP TABLE triangle;

CREATE TABLE triangle (
side_1 INTEGER,
side_2 INTEGER,
side_3 INTEGER,
build_triangle BOOLEAN
);

INSERT INTO triangle (side_1, side_2, side_3) VALUES (1, 1, 1), (3, 2, 2), (10, 11, 10), (5, 1, 2);


SELECT side_1, side_2, side_3,
	CASE
			WHEN (side_2 + side_3) > side_1 && (side_1 + side_3) > side_2 && (side_2 + side_3) > side_3 THEN TRUE
            ELSE FALSE
	END
FROM triangle;