These involve GROUP BY and ORDER. Use JOINs to solve these, do not use Ruby iteration methods.

QuestionLike::most_liked_questions(n)
Question::most_liked(n)
Fetches n most liked questions.
User#average_karma
Avg number of likes for a User''s questions.

Average Karma is pretty tough. Here are some hints:

First, write a single query that returns two things: the number of questions asked by a user and the number of likes on those questions.

I used a LEFT OUTER JOIN to combine the questions and question_likes table.
You need questions so you can filter by the author, and you need question_likes so you can count the number of likes.
I used a COUNT(DISTINCT(...)) to count the number of questions.
Note that a question that is liked multiple times will be repeated in the joined table.
I used a COUNT(column) to count the number of non-NULL entries in a column.
Note that a question that is never liked will take up one row in the joined table. How do we use COUNT(column) to not count this toward the total number of likes?
Next, divide the number of likes by the number of questions. Because COUNT returns two integers, and because integer division rounds down (3 / 2 == 1), we need to CAST one of the numbers to FLOAT. We can do this like so: CAST(value AS FLOAT).

-- Gets number of likes for a user across all questions
SELECT COUNT(*) FROM questions LEFT OUTER JOIN question_likes ON question_likes.question_id = questions.id WHERE questions.user_id = 1 AND question_likes.id NOT NULL GROUP BY questions.user_id


SELECT COUNT(DISTINCT(questions.id)) FROM questions LEFT OUTER JOIN question_likes ON question_likes.question_id = questions.id WHERE questions.user_id = 1 GROUP BY questions.user_id

SELECT
  CAST (COUNT(DISTINCT(question_likes.id)) AS FLOAT)/
  COUNT(DISTINCT(questions.id))
FROM questions
LEFT OUTER JOIN question_likes ON question_likes.question_id = questions.id
WHERE questions.user_id = 3
GROUP BY questions.user_id
