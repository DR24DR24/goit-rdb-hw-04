-- 1. Створюємо схему
CREATE DATABASE IF NOT EXISTS LibraryManagement ;
USE LibraryManagement;


SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS borrowed_books;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS genres;

SET FOREIGN_KEY_CHECKS = 1;

-- 2. Таблиця authors
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

-- 3. Таблиця genres
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);

-- 4. Таблиця books
authorsCREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year INT,
    author_id INT,
    genre_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE SET NULL,
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id) ON DELETE SET NULL
);

-- 5. Таблиця users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- 6. Таблиця borrowed_books
CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

USE LibraryManagement;

-- 1. Таблиця authors
INSERT INTO authors (author_name) VALUES
('Тарас Шевченко'),
('Лев Толстой');

-- 2. Таблиця genres
INSERT INTO genres (genre_name) VALUES
('Поезія'),
('Роман');

-- 3. Таблиця books
INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
('Кобзар', 1840, 1, 1),
('Війна і мир', 1869, 2, 2);

-- 4. Таблиця users
INSERT INTO users (username, email) VALUES
('ivan_petrov', 'ivan@example.com'),
('olena_krivko', 'olena@example.com');

-- 5. Таблиця borrowed_books
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
(1, 1, '2025-10-01', '2025-10-15'),
(2, 2, '2025-10-05', '2025-10-20');


