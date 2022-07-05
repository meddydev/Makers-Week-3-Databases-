TRUNCATE TABLE cohorts RESTART IDENTITY CASCADE; -- replace with your own table name.
TRUNCATE TABLE students RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO cohorts (starting_date, name) VALUES ('2022-05-01', 'May 2022');
INSERT INTO cohorts (starting_date, name) VALUES ('2022-06-01', 'June 2022');

INSERT INTO students (name, cohort_id) VALUES ('David', 2);
INSERT INTO students (name, cohort_id) VALUES ('Anna', 2);