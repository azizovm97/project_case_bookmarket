-- информация о книгах с жанрами
create or replace view v_books_with_genres as
select 
    b.book_id
    , b.title
    , b.author
    , g.genre_name
    , b.year_published
from books_list b
left join genre g on b.genre_id = g.genre_id;

-- количество выданных книг по жанрам
create or replace view v_issuance_by_genre as
select
    g.genre_name
    , count(*) as total_issued
from book_issuance i
join books_list b on i.book_id = b.book_id
join genre g on b.genre_id = g.genre_id
group by g.genre_name;

-- рейтинг книг
create or replace view  v_book_ratings as
select 
    b.book_id
    , b.title
    , avg(r.rating) as avg_rating
    , count(r.review_id) as total_reviews
from books_list b
left join book_reviews r on b.book_id = r.book_id
group by b.book_id, b.title;

-- активность читателей
create or replace view  v_reader_activity as
select
    r.reader_id
    , r.name
    , count(distinct i.book_id) as books_borrowed
    , count(distinct rv.review_id) as reviews_written
from readers r
left join book_issuance i on r.reader_id = i.reader_id
left join book_reviews rv on r.reader_id = rv.reader_id
group by r.reader_id, r.name;