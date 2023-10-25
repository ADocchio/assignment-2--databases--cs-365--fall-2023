DROP DATABASE IF EXISTS passwords;
CREATE DATABASE passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('helloworld', 512));
SET @init_vector = RANDOM_BYTES(16);

USE passwords;

CREATE TABLE web_sites (
    id INT AUTO_INCREMENT,
    site_name VARCHAR(255) NOT NULL,
    site_url VARCHAR(255) NOT NULL ,
    first_name VARCHAR(100) NOT NULL ,
    last_name VARCHAR(100) NOT NULL ,
    username VARCHAR(100) NOT NULL ,
    email VARCHAR(255) NOT NULL ,
    password BLOB NOT NULL,
    comment TEXT,
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

INSERT INTO web_sites (site_name, site_url, first_name, last_name, username, email, password, comment) VALUES
    ('Facebook', 'http://www.facebook.com', 'Aden', 'Docchio', 'adocchio', 'john@comcast.net', AES_ENCRYPT('pR4$w3jL8mOc', @key_str, @init_vector), 'This is a sample comment'),
    ('Youtube', 'https://www.youtube.com', 'Aden', 'Docchio', 'adocchio', 'jane@gmail.com', AES_ENCRYPT('yE6&uX2!tV1zG', @key_str, @init_vector), 'This is another sample comment'),
    ('UHart', 'http://www.hartford.edu', 'Aden', 'Docchio', 'adocchio', 'alice@yahoo.com', AES_ENCRYPT('qQ!9bL0#fJ3dR', @key_str, @init_vector), NULL),
    ('Spotify', 'https://www.spotify.com', 'Aden', 'Docchio', 'adocchio', 'bob@gmail.com', AES_ENCRYPT('hW*5aS8^eK7iP', @key_str, @init_vector), 'Yet another comment'),
    ('Zoom', 'http://www.zoom.us', 'Aden', 'Docchio', 'adocchio', 'charlie@gmail.com', AES_ENCRYPT('oZ+4lY6%gT0bV', @key_str, @init_vector), NULL),
    ('Amazon', 'http://www.amazon.com', 'Aden', 'Docchio', 'adocchio', 'eve@gmail.com', AES_ENCRYPT('kI&3nO1$wQ5xZ', @key_str, @init_vector), 'One more comment'),
    ('Linkedin', 'http://www.linkedin.com', 'Aden', 'Docchio', 'adocchio', 'david@gmail.com', AES_ENCRYPT('uF^2cH8@aN9mL', @key_str, @init_vector), 'A different comment'),
    ('Google', 'http://www.google.com', 'Aden', 'Docchio', 'adocchio', 'emily@yahoo.com', AES_ENCRYPT('iD!0pG7#bU4yT', @key_str, @init_vector), NULL),
    ('Walmart', 'http://www.walmart.com', 'Aden', 'Docchio', 'adocchio', 'frank@comcast.net', AES_ENCRYPT('sJ*6eR5^vK2oW', @key_str, @init_vector), 'Comment for frank'),
    ('Slack','http://www.slack.com/', 'Aden', 'Docchio', 'adocchio', 'grace@gmail.com', AES_ENCRYPT('aB+1lX9%fM3cN', @key_str, @init_vector), 'Last sample comment');