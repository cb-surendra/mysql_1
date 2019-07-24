show databases;
show tables;
select * from `marks`;
desc marks;
show tables;
select * from marks;
/*Week 3 day 2 and 3.*/
/* Question number 2.1 Select all the students */
SELECT marks.id, students.name, marks.subject_id, marks.quarterly, marks.half_yearly, marks.annual, marks.year, marks.grade
FROM (marks INNER JOIN students ON marks.student_id = students.id);   
/*Question number 2.2  Select all the students whose names starts with “H”*/
SELECT marks.id, students.name, marks.subject_id, marks.quarterly, marks.half_yearly, marks.annual, marks.year, marks.grade
FROM (marks INNER JOIN students ON marks.student_id = students.id) where students.name like "H%";   

/*Question number 2.3  Select all the students whose name has the alphabet “a”*/

SELECT marks.id, students.name, marks.subject_id, marks.quarterly, marks.half_yearly, marks.annual, marks.year, marks.grade
FROM (marks INNER JOIN students ON marks.student_id = students.id) where students.name like "%a%";   

/*Question number 2.4  Select all the students and list the results sorted in alphabetical order(a-z).*/
SELECT marks.id, students.name, marks.subject_id, marks.quarterly, marks.half_yearly, marks.annual, marks.year, marks.grade
FROM (marks INNER JOIN students ON marks.student_id = students.id) order by students.name;   

/*Question number 2.5 List the first “2” students with the results sorted in the alphabetical order(a-z).*/
SELECT marks.id, students.name, marks.subject_id, marks.quarterly, marks.half_yearly, marks.annual, marks.year, marks.grade
FROM (marks INNER JOIN students ON marks.student_id = students.id) order by students.name limit 2;
/*Question number 2.6 List the next “2” students(3rd and 4th) when they are sorted in the alphabetical order.*/
 select * from( SELECT marks.id as id, students.name as Name, marks.subject_id as sub_id, marks.quarterly as qua_,marks, 
 marks.half_yearly as half_marks, marks.annual as annual_marks, marks.year as yr, marks.grade as result
FROM (marks INNER JOIN students ON marks.student_id = students.id) order by students.name limit 4) order by Name desc limit 2;

/*Question number 2.7 Select the students who has not appeared in the annual exams.
Format: All columns of the “marks” table.*/
SELECT marks.id, students.name, marks.subject_id, marks.quarterly, marks.half_yearly, marks.annual, marks.year, marks.grade
FROM (marks INNER JOIN students ON marks.student_id = students.id) where marks.annual is null; 

/*Question number 2.8 Select the students who has not appeared in the annual exams during the year “2005”.
Format: student_id, subject_id, year*/
SELECT marks.id, students.name, marks.subject_id, marks.quarterly, marks.half_yearly, marks.annual, marks.year, marks.grade
FROM (marks INNER JOIN students ON marks.student_id = students.id) where marks.annual is NULL and marks.year = 2005;

/*Question number 2.9 Select the students who has appeared in one of the exams - quarterly, half_yearly or annual.
Format: student_id, subject_id, year*/
SELECT marks.id, students.name, marks.subject_id, marks.quarterly, marks.half_yearly, marks.annual, marks.year, marks.grade
FROM (marks INNER JOIN students ON marks.student_id = students.id) where marks.annual is NOT NULL or marks.half_yearly is NOT NULL 
or marks.quarterly is NOT NULL;

/*Question number 2.10 Select the students who has scored more than 90 in all the exams - quarterly, half_yearly and annual.
Format: student_id, subject_id, year, quarterly, half_yearly, annual*/
SELECT marks.id, students.name, marks.subject_id, marks.quarterly, marks.half_yearly, marks.annual, marks.year, marks.grade
FROM (marks INNER JOIN students ON marks.student_id = students.id) where marks.annual > 90 and marks.half_yearly > 90 and marks.quarterly > 90;

/*Question number 2.11 List the average marks(in quarterly, half_yearly & annual) for each subject scored for the year.
Format: student_id, subject_id, average, year*/
SELECT students.name, marks.subject_id, (marks.quarterly+marks.half_yearly+marks.annual)/3
FROM (marks INNER JOIN students ON marks.student_id = students.id);

/*Question number 2.12 List the average marks(in quarterly, half_yearly & annual) for each subject scored for the years 2003 & 2004
Format: student_id, subject_id, average, year*/
select * from( SELECT students.name, marks.subject_id, (marks.quarterly+marks.half_yearly+marks.annual)/3 as average, marks.year as yr
FROM (marks INNER JOIN students ON marks.student_id = students.id) ) as tb where tb.yr in (2004, 2005);
