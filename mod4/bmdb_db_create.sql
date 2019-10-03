drop database if exists bmdb_db_create;
create database bmdb_db_create;
use bmdb_db_create;
create table movie (
	id 				int 			not null primary key auto_increment,
	title 			varchar(100) 	not null,
	rating 			varchar(5) 		not null,
	year 			int 			not null,
	director 		varchar(50) 	not null 

);
create table actor (
	id 				int 			not null primary key auto_increment,
	movieID			int				not null,
    firstName 		varchar(25) 	not null,
	lastName		varchar(25)		not null,
	gender 			varchar(6)		not null,
    birthday		date			not null,
    FOREIGN KEY (movieID) REFERENCES movie(id)
);


create table credit (
	id 				int 			not null primary key auto_increment,
	movieID			int				not null,
    actorID 		int 			not null,
	role			varchar(25)		not null,
	
    FOREIGN KEY (movieID) REFERENCES movie(id),
    FOREIGN KEY (actorID) REFERENCES actor(id)
);




Insert into movie (id, title, rating, year, director)
values 	(1,'The Terminator', '5', '1984','James Cameron'),
		(2,'Star Wars', '5', '1977','George Lucas'),
		(3,'IT', '5', '1990', 'Stephen King');

Insert into actor (id, movieID, firstName, lastName, gender, birthday)
values 	(1,1, 'Linda', 'Hamilton','female', '1960-12-01'),
		(2,1, 'Arnold', 'Schwarzenegger','male', '1959-12-01'),
        (3,1, 'Michael', 'Biehn','male', '1972-12-01'),
        (4,2, 'Mark', 'Hamill','male', '1954-12-01'),
		(5,2, 'Harrison', 'Ford','male', '1945-12-01'),
        (6,2, 'carrie', 'fisher','female','1945-12-01'),
		(7,3, 'Tim', 'Curry','male','1947-12-01'),
		(8,3, 'John', 'Ritter','male','1948-12-01'),
        (9,3, 'Richard', 'Thomas','male','1949-12-01');
        
Insert into credit (id, movieID, actorID, role)
values 	(1,1,1, 'Sarah Connor'),
		(2,1,2, 'Terminator'),
        (3,1,3, 'Kyle Reese'),
        (4,2,2, 'Luke Skywalker'),
		(5,2,2, 'Han Solo'),
        (6,2,2, 'Princess Lea'),
		(7,3,3, 'Pennywise'),
		(8,3,3, 'Ben Hanscom'),
        (9,3,3, 'Bill Denbrough');    
        
 /*SELECT t1.col, t3.col FROM table1 join table2 ON table1.primarykey = table2.foreignkey
                                  join table3 ON table2.primarykey = table3.foreignkey */

-- Read more: https://javarevisited.blogspot.com/2012/11/how-to-join-three-tables-in-sql-query-mysql-sqlserver.html#ixzz61IHHSuaZ       

SELECT firstName, lastName FROM actor;

SELECT title FROM movie;


-- three way join
SELECT m.title, a.firstName, a.LastName, c.role 
FROM credit c JOIN movie as m ON m.id = c.movieID JOIN actor a on a.id = c.actorID GROUP BY c.id;
 
 -- query for actor younger than me
SELECT CONCAT(firstName,' ', lastName) Actor, birthday FROM Actor where birthday > '1971-10-23' ; 
  
-- query for actor older than me
SELECT CONCAT(firstName,' ', lastName) Actor, birthday FROM Actor where birthday < '1971-10-23';   
  
        
        
        
        
        
        
