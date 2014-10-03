DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id BIGINT NOT NULL AUTO_INCREMENT,
    activation_code VARCHAR(255),
    activation_date DATETIME,
    create_date DATETIME NOT NULL,
    email VARCHAR(255),
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL,
    salt VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,

    PRIMARY KEY (id)
) ENGINE=InnoDB CHARSET=utf8;