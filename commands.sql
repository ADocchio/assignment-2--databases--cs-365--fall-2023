-- Create new entry into database
INSERT INTO web_sites (site_name, site_url, first_name, last_name, username, email, password, comment) VALUES
    ('Microsoft', 'https://www.microsoft.com/', 'Hannah', 'Green', 'hannahg', 'hannah@gmail.com', AES_ENCRYPT('G4t!pV2^zL7wOx', 'key'), 'A new entry');

-- Get password from a specific URL
SELECT AES_DECRYPT(password, 'key') AS decrypted_password FROM web_sites WHERE site_url = 'https://www.youtube.com';

-- Get all the password-related data, including the password, associated with URLs that have `https` in two of your 10 entries
SELECT *, CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) AS decrypted_password FROM web_sites WHERE site_url LIKE 'https://%';

-- Change a URL associated with one of the passwords in your 10 entries
UPDATE web_sites SET web_url = '' WHERE web_url '';

-- Change any password
UPDATE web_sites SET password = AES_ENCRYPT('updatedpassword', @key_str, @init_vector) WHERE site_url = 'https://www.spotify.com';

-- Remove a URL
DELETE FROM web_sites WHERE site_url = 'https://www.spotify.com';

-- Remove a password
DELETE FROM web_sites WHERE password = AES_ENCRYPT('kI&3nO1$wQ5xZ', @key_str, @init_vector);

