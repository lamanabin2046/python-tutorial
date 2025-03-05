create table student(
	id int primary key,
	name varchar not null,
	address varchar not null,
	college varchar not null,
	age int not null,
	gender varchar(1) not null,
	faculty varchar not null
);

INSERT into student
('id', 'name', 'address', 'college', 'age', 'gender', 'faculty')
values
(1, 'ram', 'kathmandu', 'ncit', 18, 'm', 'IT'),
(2, 'shyam', 'lalitpur', 'islington', 20, 'm', 'CSIT'),
(3, 'gita', 'pokhara', 'ncit', 21, 'f', 'SE'),
(4, 'sita', 'kathmandu', 'ioe pulchowk', 24, 'f','CE');

-- query

SELECT * from student;

SELECT name, address from student;

SELECT * FROM student where address = 'lalitpur';

SELECT * FROM student where age > 18;

ALTER table student add university not null default 'tu';

UPDATE student set university = 'pu' where id = 3;

UPDATE student set university = 'ku' where id = 1;

DELETE from student where id = 3;

INSERT into student 
('id', 'name', 'address', 'college', 'age', 'gender', 'faculty', 'university')
values
(3, 'gita', 'pokhara', 'ncit', 21, 'f', 'SE', 'pu'),
(5, 'hari', 'kathmandu', 'ioe pulchowk', 24, 'm','CIVIL', 'ku'),
(6, 'madan', 'pokhara', 'ncit', 21, 'f', 'SE', 'tu'),
(7, 'maya', 'kathmandu', 'isglington', 24, 'f','BIT', 'tu');

UPDATE student set gender  = 'm' where id = 6;

SELECT * from student where age > 20 and age < 25;

SELECT * from student where age >= 20 and age <= 25;

SELECT * from student where age BETWEEN 20 and 25;

SELECT * from student where age BETWEEN 20 and 25 ORDER BY age;

SELECT * from student where age BETWEEN 20 and 25 ORDER BY age ASC;

SELECT * from student where age BETWEEN 20 and 25 ORDER BY age DESC;

SELECT * from student where age BETWEEN 20 and 25 ORDER BY age DESC, name ASC;

SELECT * from student where age BETWEEN 20 and 25 and gender ='f' ORDER BY age DESC, name ASC;

SELECT * FROM student where address ='kathmandu' and college = 'ncit';

SELECT * FROM student where 
(address ='kathmandu' and college = 'ncit')
OR 
(address='pokhara' and college='ncit');

SELECT * FROM student where 
(address ='kathmandu' and college = 'ncit' and gender='f')
OR 
(address='pokhara' and college='ncit' and gender='f');

SELECT * FROM student where 
(
(address ='kathmandu' and college = 'ncit')
OR 
(address='pokhara' and college='ncit')
)
and (gender='f');

SELECT * from student WHERE address = 'pokhara';

SELECT * from student WHERE address = 'Pokhara';

SELECT * from student WHERE address like 'Pokhara';

SELECT * from student WHERE name like 'g%';

SELECT * from student WHERE name like '%a';

SELECT * from student WHERE name like '%a%';

SELECT * from student WHERE name like '_a%';

SELECT * from student WHERE name like '%a_';


--aggregation
SELECT COUNT(*) from student; 

SELECT COUNT(*) as no_of_student from student; 

SELECT AVG(age) avg_age from student;

SELECT MIN(age) min_age from student;

SELECT MAX(age) max_age from student;

SELECT MAX(age) max_age, MIN(age) min_age, AVG(age) avg_age from student;

SELECT SUM(age) total_age from student;

SELECT address from student;

SELECT DISTINCT address from student;





