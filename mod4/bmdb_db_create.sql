drop database if exists bmdb;
create database bmdb;
use bmdb;
create table movie (
	id 				int 			not null primary key auto_increment,
	title 			varchar(100) 	not null unique,
	rating 			varchar(5) 		not null,
	year 			int 			not null,
	director 		varchar(50) 	not null 

);
create table actor (
	id 				int 			not null primary key auto_increment,
	firstName 		varchar(25) 	not null,
	lastName		varchar(25)		not null,
	gender 			varchar(6)		not null,
    birthday		date			not null,
    
    CONSTRAINT unq_actor unique (firstName, lastName, birthday)
);


create table credit (
	id 				int 			not null primary key auto_increment,
	movieID			int				not null,
    actorID 		int 			not null,
	role			varchar(25)		not null,
	
    FOREIGN KEY (movieID) REFERENCES movie(id),
    FOREIGN KEY (actorID) REFERENCES actor(id),
    -- combo of actor and movie must be unique
    CONSTRAINT act_mov unique (actorID, movieID)
);




Insert into movie (id, title, rating, year, director)
values 	(1,'The Terminator', '5', '1984','James Cameron'),
		(2,'Star Wars', '5', '1977','George Lucas'),
		(3,'IT', '5', '1990', 'Stephen King');

Insert into actor (id, firstName, lastName, gender, birthday)
values 	(1,'Linda', 'Hamilton','female', '1960-12-01'),
		(2, 'Arnold', 'Schwarzenegger','male', '1959-12-01'),
        (3, 'Michael', 'Biehn','male', '1972-12-01'),
        (4, 'Mark', 'Hamill','male', '1954-12-01'),
		(5, 'Harrison', 'Ford','male', '1945-12-01'),
        (6, 'carrie', 'fisher','female','1945-12-01'),
		(7, 'Tim', 'Curry','male','1947-12-01'),
		(8, 'John', 'Ritter','male','1948-12-01'),
        (9, 'Richard', 'Thomas','male','1949-12-01');
        
Insert into credit (movieID, actorID, role)
values 	(1,1, 'Sarah Connor'),
		(1,2, 'Terminator'),
        (1,3, 'Kyle Reese'),
        (2,4, 'Luke Skywalker'),
		(2,5, 'Han Solo'),
        (2,6, 'Princess Lea'),
		(3,7, 'Pennywise'),
		(3,8, 'Ben Hanscom'),
        (3,9, 'Bill Denbrough');    

-- create a user and grant privileges to that user
-- CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame'; -- sesame is the password so IDENTIFIED BY is pswd
-- GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;
DROP USER bmdb_user@localhost;
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;
       
 /*SELECT t1.col, t3.col FROM table1 join table2 ON table1.primarykey = table2.foreignkey
                                  join table3 ON table2.primarykey = table3.foreignkey */

-- Read more: https://javarevisited.blogspot.com/2012/11/how-to-join-three-tables-in-sql-query-mysql-sqlserver.html#ixzz61IHHSuaZ       


