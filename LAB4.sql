SET AUTOCOMMIT ON;

QUESTION 1

/* MOVIES (movieid:int, title:varchar(35), 
year:int, director:int,score:decimal(3,2))*/

CREATE TABLE MOVIES (
id int primary key,
title varchar(35) not null,
year int not null,
Director int not null,
score decimal(3,2)
);

/* ACTORS (actorid:int, name:varchar(20), lastname:varchar(30))*/

CREATE TABLE ACTORS(
id int primary key,
firstName varchar(20) not null,
lastName varchar(30) not  null
);

/* CASTINGS (movieid:int, actorid:int)*/

CREATE TABLE CASTINGS(
movieid int,
actorid int,
primary key (movieid,actorid),
 CONSTRAINT MOVIE_CASTING_FK FOREIGN KEY (movieid) REFERENCES MOVIES(id),
 CONSTRAINT MOVIE_ACTOR_FK FOREIGN KEY (actorid) REFERENCES ACTORS(id)
 );
 
 /* DIRECTORS(id:int, name:varchar(20), lastname:varchar(30))*/
 
 CREATE TABLE DIRECTORS(
id int primary key,
name varchar(20) not null,
Lastname varchar(30) not null
);


QUESTION 2

ALTER TABLE MOVIES
	ADD CONSTRAINT MOVIE_DIRECTOR_FK FOREIGN KEY (director) REFERENCES DIRECTORS(id);
    
QUESTION 3

ALTER TABLE MOVIES
	ADD CONSTRAINT TITLE_UNIQUE unique(title);
    
QUESTION 4



INSERT INTO DIRECTORS 
(id, name, Lastname)
VALUE
 (1010, 'Rob', 'Minkoff'),
 (1020, 'Bill', 'Condon'),
 (1050, 'Josh', 'Cooley'),
 (2010, 'Brad', 'Bird'),
 (3020, 'Lake', 'Bell');
 
 
 INSERT INTO MOVIES
 (id , title, year, director, score)
VALUE 
(100, 'The Lion King', 2019, 3020, 3.50),
 (200, 'Beauty and the Beast', 2017, 1050, 4.20),
 (300, 'Toy Story 4', 2019, 1020, 4.50),
 (400, 'Mission Impossible', 2018, 2010, 5.00),
 (500, 'The Secret Life of Pets', 2016, 1010, 3.90);
 
QUESTION 5

DROP TABLE  CASTINGS, MOVIES, DIRECTORS, ACTORS ;
/* Yes , the order of tables matters when deleting the tables because we need to delete the tables with the foreign 
keys first, so that no errors will happen. */	


QUESTION 6

CREATE TABLE employee2(
employeeNumber int primary key,
lastName varchar(50) not null,
firstName varchar(50) not null,
extension varchar(10) not null,
email varchar(100) not null,
officeCode varchar(10) not null,
reportsTo int(11) default null,
jobTitle varchar(50) not null,
CONSTRAINT EMPLLOYEE_OFFICECODE_FK FOREIGN KEY (officeCode) REFERENCES offices(officeCode),
CONSTRAINT EMPLLOYEE_REPORT_FK FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber)
);


QUESTION 7

 ALTER TABLE employee2
ADD COLUMN username  varchar(50) ;

QUESTION 8

DELETE FROM employee2

QUESTION 9

INSERT INTO employee2 (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
SELECT * 
FROM employees; 


QUESTION 10

UPDATE employee2 SET 
firstName = 'Albert',
lastName = 'Canicosa'
WHERE employeeNumber = 7090;

QUESTION 11

UPDATE employee2 SET username = lower(CONCAT(lEFT(firstName,1),lastName))
WHERE firstName is not null 
AND lastName is not null;

QUESTION 12

DELETE FROM employee2
WHERE officeCode = 4;

QUESTION 13

	DROP TABLE employee2;

