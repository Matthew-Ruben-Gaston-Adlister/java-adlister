USE adlister_db;

SET FOREIGN_KEY_CHECKS=0; -- to disable them

DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS price;
DROP TABLE IF EXISTS ads_categories;

CREATE TABLE users
(
    id  INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email    VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id     INT UNSIGNED NOT NULL,
    title       VARCHAR(240) NOT NULL,
    description TEXT         NOT NULL,
    price       VARCHAR(240) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE categories
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name        VARCHAR(64),
    PRIMARY KEY (id)
);

CREATE TABLE ads_categories
(
    ad_id       INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (ad_id, category_id)
);