
DROP SEQUENCE book_seq;

DROP TABLE books;

CREATE SEQUENCE book_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE books (
    book_id NUMBER(4) NOT NULL,
    title VARCHAR(50) NOT NULL,
    publisher VARCHAR(30),
    year VARCHAR(10),
    price NUMBER(6)
);

ALTER TABLE books ADD CONSTRAINT book_pk PRIMARY KEY (book_id);

ALTER TABLE books ADD CONSTRAINT book_uk UNIQUE (title);

INSERT INTO books (book_id, title, publisher, year, price)
VALUES (book_seq.nextval, 'java1', '삼양출판사', '2023', 30000);

INSERT INTO books (book_id, title, publisher, year, price)
VALUES (book_seq.nextval, 'java2', '삼양출판사', '2023', 30000);

INSERT INTO books (book_id, title, publisher, year, price)
VALUES (book_seq.nextval, 'java3', '삼양출판사', '2023', 30000);

INSERT INTO books (book_id, title, publisher, year, price)
VALUES (book_seq.nextval, 'java4', '삼양출판사', '2023', 30000);

INSERT INTO books (book_id, title, publisher, year, price)
VALUES (book_seq.nextval, 'java5', '삼양출판사', '2023', 30000);

COMMIT;

SELECT * FROM books;

UPDATE books SET title = 'java1' WHERE book_id = 1;

COMMIT;

SELECT * FROM BOOKS WHERE title = 'java1';

UPDATE books set title='html', publisher = '오앙출판사' , year='2022', price = '2302' where title =  'java2';

delete from books where title='java5';
Commit;

