# Write your MySQL query statement below

WITH high_count AS (
    SELECT Users.user_id, name, count(*) as num_reviews
    FROM MovieRating JOIN Users
    ON MovieRating.user_id=Users.user_id
    GROUP BY 1,2
    ORDER BY num_reviews DESC, name ASC
    LIMIT 1
),
high_rating AS (
    SELECT Movies.movie_id, title, AVG(rating) AS average, created_at
    FROM MovieRating JOIN Movies ON Movies.movie_id= MovieRating.movie_id
    WHERE MONTH(created_at)= 02 AND YEAR(created_at)=2020
    GROUP BY 1,2
    ORDER BY average DESC, title ASC
    LIMIT 1
)

SELECT name AS results FROM high_count
UNION ALL
SELECT title AS results FROM high_rating;