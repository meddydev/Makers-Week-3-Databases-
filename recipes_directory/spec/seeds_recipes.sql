TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, average_cooking_time, rating) VALUES('Feta Pasta', 45, 4);
INSERT INTO recipes (name, average_cooking_time, rating) VALUES('Stuffed Peppers', 80, 3);
INSERT INTO recipes (name, average_cooking_time, rating) VALUES('Honey Glazed Salmon', 20, 5);