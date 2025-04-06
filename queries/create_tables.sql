
create table is not exists books_list (
    book_id serial
    , title varchar
    , author varchar
    , genre_id integer
    , year_published integer
    , primary key(book_id)
    , foreign key (genre_id)
);

create table is not exists genre (
    genre_id serial
    , genre_name varchar
    , primary key (genre_id)
);

create table is not exists readers (
    reader_id serial
    , name varchar,
    , email Varchar,
    , registered_date DATE
    , primary key (reader_id)
);

create table is not exists book_issuance (
    issuance_id serial
    , book_id integer
    , reader_id integer
    , issue_date date
    , return_date date
    , primary key(issuance_id_id)
    , foreign key (book_id)
    , foreign key (reader_id)
);

create table is not exists book_reviews (
    review_id serial
    , book_id integer
    , reader_id integer
    , rating integer
    , book_id integer
    , reader_id integer
    , primary key(issuance_id_id)
    , foreign key (book_id)
    , foreign key (reader_id)
);
