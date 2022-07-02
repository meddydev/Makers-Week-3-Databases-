TRUNCATE TABLE user_accounts RESTART IDENTITY CASCADE;

INSERT INTO user_accounts (email_address, username) VALUES ('abc123@makers.org', 'Abbie123');
INSERT INTO user_accounts (email_address, username) VALUES ('jimmyo@yahoo.com', 'BigJim');
INSERT INTO user_accounts (email_address, username) VALUES ('ahmed@gmail.com', 'AwesomeAhmed');