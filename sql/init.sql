use mysql;
drop user if EXISTS 'tianmh'@'localhost';
FLUSH PRIVILEGES;
create user if not EXISTS 'tianmh'@'localhost' IDENTIFIED by 'root';
grant all privileges on *.* to 'tianmh'@'localhost';
FLUSH PRIVILEGES;