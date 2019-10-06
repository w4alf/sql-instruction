/*
select all students
student without middle names
who is youngest student and oldest student
how many students in OH?

select all courses
how many social studies courses
how many math courses

do an inner join of all three

*/
select * from student;
Select * from student where middleInitial is Null;

-- youngest student
select birthday, firstName, lastName from student where birthday = (select max(birthday)  from student);



-- oldest student
select birthday, firstName, lastName from student where birthday = (select min(birthday)  from student);

-- age of oldest student
select (year(curdate()) - year(birthday)) as age, firstName, lastName 
from student where birthday = (select min(birthday)  from student);



-- group by states and count
select state, count(state) from student GROUP BY state order by state;

select firstName, lastName from student where state='OH';

select count(id) from course where subject='math';
select count(id) from course where subject='socialstudies';
select count(id) from student;

select s.firstName, s.lastName, c.subject from student s
JOIN enrolled e ON s.id = e.studentID
JOIN course c ON e.courseID = c.id;

-- list all subjects starting with the letter m
select count(id) count, subject from course where subject like 'm%th';

select s.firstName, s.lastName, c.name, e.grade as enrolled FROM student s
 LEFT JOIN  enrolled e ON e.studentid = s.id
 left join  course c
	on e.courseID = c.id;