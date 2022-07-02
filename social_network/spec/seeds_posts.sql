TRUNCATE TABLE user_accounts RESTART IDENTITY CASCADE;

INSERT INTO user_accounts (email_address, username) VALUES ('abc123@makers.org', 'Abbie123');
INSERT INTO user_accounts (email_address, username) VALUES ('jimmyo@yahoo.com', 'BigJim');
INSERT INTO user_accounts (email_address, username) VALUES ('ahmed@gmail.com', 'AwesomeAhmed');

INSERT INTO posts (title, content, views, user_account_id) VALUES ('My first post', 'Hi my name is Abbie!', 8, 1);
INSERT INTO posts (title, content, views, user_account_id) VALUES ('My second post', 'My name is  still Abbie!', 80, 1);
INSERT INTO posts (title, content, views, user_account_id) VALUES ('Cars', 'I am Jim and I love cars', 1000, 2);