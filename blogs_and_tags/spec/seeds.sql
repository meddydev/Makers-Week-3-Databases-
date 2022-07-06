TRUNCATE TABLE posts RESTART IDENTITY CASCADE;
TRUNCATE TABLE tags RESTART IDENTITY CASCADE;
TRUNCATE TABLE posts_tags RESTART IDENTITY;

INSERT INTO posts ("id", "title") VALUES
(1, 'How to use Git'),
(2, 'Ruby classes'),
(3, 'Using IRB'),
(4, 'My weekend in Edinburgh'),
(5, 'The best chocolate cake EVER'),
(6, 'A foodie week in Spain'),
(7, 'SQL basics');

INSERT INTO tags VALUES
(1, 'coding'),
(2, 'travel'),
(3, 'cooking'),
(4, 'ruby');

INSERT INTO posts_tags VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 3),
(6, 2),
(7, 1),
(6, 3),
(2, 4),
(3, 4);