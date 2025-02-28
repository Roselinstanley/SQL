-- 1. List all users subscribed to the Premium plan:

select user_id,user_name,plan from users where plan='Premium';

-- 2. Retrieve all movies in the Drama genre with a rating higher than 8.5:

select * from movies where genre='Drama' and rating > 8.5;

-- 3. Find the average rating of all movies released after 2015:

select avg(rating) from movies where release_year > 2015;

-- 4. List the names of users who have watched the movie Stranger Things along with their completion percentage:

select users.user_id,users.user_name,watch_history.movie_id,movies.title,watch_history.completion_percentage from watch_history 
join movies on watch_history.movie_id=movies.movie_id 
join users on watch_history.user_id=users.user_id
where movies.title='Stranger Things';

-- 5. Find the name of the user(s) who rated a movie the highest among all reviews:

select reviews.movie_id,reviews.user_id,users.user_name,reviews.rating from reviews
join users on reviews.user_id=users.user_id
where reviews.rating=(select max(rating) from reviews);

-- 6. Calculate the number of movies watched by each user and sort by the highest count:

select user_id,count(movie_id) as total_count from watch_history group by user_id order by total_count desc;

-- 7.List all movies watched by John Doe, including their genre, rating, and his completion percentage:

select users.user_id,users.user_name,watch_history.movie_id,movies.genre,reviews.rating,watch_history.completion_percentage from users join 
watch_history on users.user_id=watch_history.user_id 
join movies on movies.movie_id=watch_history.movie_id
join reviews on reviews.user_id=watch_history.user_id 
where users.user_name='John Doe';  -- here john doe has rated only one movie for movie_id 1 so it has giving same rating for movie_id 5

-- 8.Update the movie's rating for Stranger Things:

set sql_safe_updates=0;
update movies set rating=3.2 where title='Stranger Things';
select * from movies;

-- 9.Remove all reviews for movies with a rating below 4.0:

delete from reviews where rating < 4.0;
select * from reviews;

-- 10. Fetch all users who have reviewed a movie but have not watched it completely (completion percentage < 100):

select watch_history.user_id,users.user_name,watch_history.movie_id,watch_history.completion_percentage from watch_history 
left join users on watch_history.user_id=users.user_id
where watch_history.completion_percentage < 100 order by watch_history.user_id; 

-- 11. List all movies watched by John Doe along with their genre and his completion percentage:

select users.user_id,users.user_name,watch_history.movie_id,watch_history.completion_percentage from watch_history
join users on users.user_id=watch_history.user_id
join movies on movies.movie_id=watch_history.movie_id
where users.user_name='John Doe';

-- 12.Retrieve all users who have reviewed the movie Stranger Things, including their review text and rating:

select reviews.user_id,users.user_name,reviews.movie_id,movies.title,reviews.review_text,reviews.rating from reviews 
left join movies on reviews.movie_id = movies.movie_id
join users on users.user_id=reviews.user_id
where movies.title='Stranger Things';

-- 13. Fetch the watch history of all users, including their name, email, movie title, genre, watched date, and completion 

select users.user_id,users.user_name,users.email,watch_history.movie_id,movies.title,movies.genre,watch_history.watched_date,watch_history.completion_percentage from
users left join watch_history on watch_history.user_id=users.user_id
join movies on movies.movie_id=watch_history.movie_id;

-- 14.List all movies along with the total number of reviews and average rating for each movie, including only movies with at least two reviews:

select movie_id,count(movie_id) as total_count,avg(rating) as average_rating from reviews group by movie_id having total_count>=2;


