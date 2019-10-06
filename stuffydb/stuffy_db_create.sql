-- Drop and Create the Database, DDL

drop database if exists stuffy_db;
create database stuffy_db;
use stuffy_db;

-- DDL - Create Tables
create table stuffy (
	id 			int 			primary key auto_increment,
	type		varchar(255),
	color 		varchar(20),
	size 		varchar(2),
	limbs 		int 	
	);

insert into stuffy (type,color, size, limbs) 
	values 
		('Mothra','red','m',0),
		('Godzilla','green','l',4),
		('King Caeser','tan','l',4),
		('Mechagodzilla','silver','l',4),
        ('Godzilla Junior','green','s',4),
        ('Baragon','black','m',4),
        ('Anguirus','grey','m',2),
        ('Orga','black','m',4),
        ('Gigan','green','l',4),
        ('Titanosaurus','black','xl',4),
		('King Ghidorah','yellow','xl',7),
        ('Rodan','red','l',4);

DROP USER stuffy_db_user@localhost;
CREATE USER stuffy_db_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON stuffy_db.* TO stuffy_db_user@localhost;