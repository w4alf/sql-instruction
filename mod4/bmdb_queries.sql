
SELECT firstName, lastName FROM actor;

SELECT title FROM movie;


-- three way join
SELECT m.title, a.firstName, a.LastName, c.role 
FROM credit c JOIN movie as m ON m.id = c.movieID JOIN actor a on a.id = c.actorID;
 
 -- different way to do the 3 way join
SELECT  m.title, CONCAT(a.firstName, ' ', a.LastName) as Actor 
FROM movie as m 
JOIN credit c on m.id = c.movieID
JOIN actor a on a.ID = c.actorID;
  
 -- query for actor younger than me
SELECT CONCAT(firstName,' ', lastName) Actor, birthday FROM Actor where birthday > '1971-10-23' ; 
  
-- query for actor older than me
SELECT CONCAT(firstName,' ', lastName) Actor, birthday FROM Actor where birthday < '1971-10-23';   
  
-- return actors from a movie using a subquery
SELECT * from actor a join credit c on c.actorID = a.ID
where c.movieID=(select id from  movie where title = 'The Terminator');
  
-- select a movie by name
select id from  movie where title = 'The Terminator';
 
-- example of unique constraint violation
-- INSERT INTO movie (title, rating, year, director)
-- VALUES ('The Terminator', '5', '1984','James Cameron');

-- example of fk violation
insert into credit (movieid,actorid, role)
values (99,99,'test');

Insert into movie (id, title, rating, year, director)
values 	
		-- (1,'The Terminator', '5', '1984','James Cameron'),
		-- (2,'Star Wars', '5', '1977','George Lucas'),
		-- (3,'IT', '5', '1990', 'Stephen King'),-- already insert
			(4,'Alien', '5', '1979','Ridley Scott'),
            (5,'The Godfather', '5', '1972','Ford Coppola'),
            (6,'Pulp Fiction', '5', '1994','Quentin Tarantino'),
            (7,'The Matrix', '5', '1999','The Wachowskis'),
            (8,'Indiana Jones and the Raiders of the lost ark', '5', '1981','George Lucas'),
            (9,'Back to the future', '5', '1985','Robert Zemeckis'),
            (10,'Jaws', '5', '1975','Steven Spielberg');
            
Insert into actor (id, firstName, lastName, gender, birthday)
values 	
/*      (1,'Linda', 'Hamilton','female', '1960-12-01'),
		(2, 'Arnold', 'Schwarzenegger','male', '1959-12-01'),
        (3, 'Michael', 'Biehn','male', '1972-12-01'),
        (4, 'Mark', 'Hamill','male', '1954-12-01'),
		(5, 'Harrison', 'Ford','male', '1945-12-01'),
        (6, 'carrie', 'fisher','female','1945-12-01'),
		(7, 'Tim', 'Curry','male','1947-12-01'),
		(8, 'John', 'Ritter','male','1948-12-01'),
        (9, 'Richard', 'Thomas','male','1949-12-01'),
        */-- marker
        (10, 'Sigourney', 'weaver','female','1958-12-01'),
        (11, 'Al', 'Pacino','male','1943-12-01'),
        (12, 'John', 'Travolta','male','1949-03-01'),
        (13, 'Keanu', 'Reeves','male','1971-07-01'),
        (14, 'Harrson', 'Ford','male','1945-11-01'),
        (15, 'Michael', 'Fox','male','1967-12-01'),
        (16, 'Roy', 'Scheider','male','1945-10-01')
       ;
        
Insert into credit (movieID, actorID, role)
values 
/*	(1,1, 'Sarah Connor'),
		(1,2, 'Terminator'),
        (1,3, 'Kyle Reese'),
        (2,4, 'Luke Skywalker'),
		(2,5, 'Han Solo'),
        (2,6, 'Princess Lea'),
		(3,7, 'Pennywise'),
		(3,8, 'Ben Hanscom'),
        (3,9, 'Bill Denbrough'), -- marker
*/        
        (4,10, 'Ripley'),
        (5,11, 'Michael Carmine'),
        (6,12, 'Vincent Vega'),
        (7,13, 'Neo'),
        (8,14, 'Marion'),
        (9,15, 'Marty McFly'),
        (10,16, 'Martin Brody')
        ;   
credit

