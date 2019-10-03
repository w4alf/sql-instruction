
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