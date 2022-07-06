TRUNCATE TABLE posts RESTART IDENTITY CASCADE;
TRUNCATE TABLE comments RESTART IDENTITY;

INSERT INTO posts (title, content) VALUES ('My first blog!', 'This is the contents of my first blog.');
INSERT INTO posts (title, content) VALUES ('I love to travel!', 'I went to Spain and it was great!');

INSERT INTO comments (content, author_name, post_id) VALUES ('good luck', 'Steve', 1);
INSERT INTO comments (content, author_name, post_id) VALUES ('Hope it goes well!', 'Anna', 1);
INSERT INTO comments (content, author_name, post_id) VALUES ('I love Spain too!', 'Alex', 2);


