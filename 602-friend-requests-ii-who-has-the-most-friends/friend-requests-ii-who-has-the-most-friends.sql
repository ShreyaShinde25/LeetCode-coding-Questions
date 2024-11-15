# Write your MySQL query statement below
WITH count_accepted AS (
    SELECT requester_id AS id, COUNT(accepter_id) AS cnt
    FROM RequestAccepted
    GROUP BY 1
),

count_requested AS (
    SELECT accepter_id AS id, COUNT(requester_id) AS cnt
    FROM RequestAccepted
    GROUP BY 1
),

total_friends AS (
SELECT * FROM count_accepted
UNION ALL
SELECT * FROM count_requested
)

SELECT id, sum(cnt) AS num
FROM total_friends
GROUP BY 1
ORDER BY num desc
LIMIT 1

  

