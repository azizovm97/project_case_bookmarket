-- Топ-5 самых популярных книг по количеству выдач
select 
    b.title
    , count(*) as total_issued
from book_issuance i
join books_list b on i.book_id = b.book_id
group by b.title
order by total_issued desc
limit 5;

-- Средний рейтинг по жанрам
select 
    g.genre_name
    , round(avg(r.rating), 2) as avg_rating
from book_reviews r
join books_list b on r.book_id = b.book_id
join genre g on b.genre_id = g.genre_id
group by g.genre_name
order by avg_rating desc;

-- Топ-5 самых активных читателей по количеству выданных книг
select 
    r.name
    , count(*) as books_issued
from book_issuance i
join readers r on i.reader_id = r.reader_id
group by r.name
order by books_issued desc
limit 5;

-- Среднее время возврата книг (в днях)
select 
    round(avg(julianday(return_date) - julianday(issue_date)), 1) as avg_return_days
from book_issuance
where return_date is not null;

-- Количество книг, изданных по годам
select 
    year_published
    , count(*) as total_books
from books_list
group by year_published
order by year_published;