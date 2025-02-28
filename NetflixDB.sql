create database Netflix;
use Netflix;
create table users(user_id int auto_increment primary key,
                  user_name varchar(50) not null,
                  email varchar(100) unique not null,
                  registration_date date not null,
                  plan enum('Basic','Standard','Premium') default 'Basic');
create table movies(movie_id INT PRIMARY KEY AUTO_INCREMENT,
				    title VARCHAR(200) NOT NULL,
				    genre VARCHAR(100) NOT NULL,
			        release_year YEAR NOT NULL,
                    rating decimal(3,1) not null);
create table watch_history(watch_id int primary key auto_increment,
						   user_id int,
						   movie_id int,
						   watched_date date not null,
						   completion_percentage int check(completion_percentage >=0 and completion_percentage <=100),
						   foreign key (user_id) references users(user_id),
						   foreign key (movie_id) references movies(movie_id));
create table reviews(review_id INT PRIMARY KEY AUTO_INCREMENT,
				     movie_id INT,
					 user_id INT,
					 review_text TEXT,
                     rating decimal(2,1) check(rating >=0 and rating <=5),
                     review_date DATE NOT NULL,
					 FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
					 FOREIGN KEY (user_id) REFERENCES users(user_id));
insert into users(user_name,email,registration_date,plan) values
				 ('John Doe', 'john.doe@example.com', '2024-01-10', 'Premium'),
		         ('Jane Smith', 'jane.smith@example.com', '2024-01-15', 'Standard'),
				 ('Alice Johnson', 'alice.johnson@example.com', '2024-02-01', 'Basic'),
				 ('Bob Brown', 'bob.brown@example.com', '2024-02-20', 'Premium');
insert into movies(title,genre,release_year,rating) values
				  ('Stranger Things','Drama',2016,8.7),
                  ('Breaking Bad','Crime',2008,9.5),
                  ('The Crown','History',2016,8.6),
                  ('The Witcher','Fantasy',2019,8.2),
                  ('Black Mirror','Sci-Fi',2011,8.8);
insert into watch_history(user_id,movie_id,watched_date,completion_percentage) values
						 (1, 1, '2024-02-05', 100),
						 (2, 2, '2024-02-06', 80),
					     (3, 3, '2024-02-10', 50),
						 (4, 4, '2024-02-15', 100),
						 (1, 5, '2024-02-18', 90);
insert into reviews(movie_id,user_id,review_text,rating,review_date) values
				   (1, 1, 'Amazing storyline and great characters!', 4.5, '2024-02-07'),
                   (2, 2, 'Intense and thrilling!', 5.0, '2024-02-08'),
                   (3, 3, 'Good show, but slow at times.', 3.5, '2024-02-12'),
                   (4, 4, 'Fantastic visuals and acting.', 4.8, '2024-02-16');

                   
	