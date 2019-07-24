show databases;
use training_sample;
show tables;

/* add the two column created_at and updated_at in all three tables marks, medals, students*/
alter table marks add created_at date, add update_at date;
alter table medals add created_at date, add update_at date;
alter table students add created_at date, add update_at date;

desc marks;
desc medals;
desc students;

/*Replace the null values in quarterly, half_yearly and annual columns with 0 and make those columns as not nullable.*/
select * from marks;
SET SQL_SAFE_UPDATES = 0;
select id, student_id, subject_id, ifnull(quarterly, 0), ifnull(half_yearly, 0), ifnull(annual, 0), year, grade, created_at, update_at from marks;
update marks set
	quarterly = if(quarterly is not null, quarterly, 0),
	half_yearly = if(half_yearly is not null, half_yearly, 0),
	annual = if(annual is not null, annual, 0);

/*Inserting the data values into the newly added column of each tables*/
insert into marks(created_at , update_at) values ( date(now()), date(now()) );
insert into medals(created_at , update_at) values ( date(now()), date(now()) );
insert into students(created_at , update_at) values ( date(now()), date(now()) );

/*updating the data values into the newly added column of each tables*/
update marks set created_at = date(now()), update_at = date(now());
update medals set created_at = date(now()), update_at = date(now());
update students set created_at = date(now()), update_at = date(now());

/*showing all information in all the three tables*/
select * from marks;
select * from medals;
select * from students;

/*drop the column of tables */
alter table marks drop column created_at, drop column update_at;
alter table medals drop column created_at, drop column update_at;
alter table students drop column created_at, drop column update_at;

/*Day 4 exercise*/
/*Using the table training_sample, do the following create a table students_summary with the below columns
student_id, student_name, year, percentage (got in annual exams), no_of_medals_received */
create table students_summary
(	
	student_id bigint(19) NOT NULL, 
    student_name varchar(100) DEFAULT NULL, 
    year int(11) DEFAULT NULL, 
    percentage float default 0.0,/*(got in annual exams),*/ 
    no_of_medals_received int(11) DEFAULT 0,
    FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
);
drop table students_summary;
desc students_summary;
/*Derive the values from the tables(students, marks and medals) and insert into the above table
Use insert with select statement
*/
insert into students_summary(student_id, student_name, percentage, no_of_medals_received) 
select students.id, students.name, (sum(marks.annual))/(count(marks.annual)*100)*100,  count(medals.medal_won) from marks 
inner join students on students.id = marks.student_id
inner join medals on medals.student_id = marks.student_id
group by marks.student_id;

select * from students_summary;

select student_id, count(medal_won) from medals group by (student_id);
select student_id, (sum(annual))/(count(annual)*100)*100 from marks group by student_id;
select students.id, students.name, (sum(marks.annual))/(count(marks.annual)*100)*100 from marks inner join students on students.id = marks.student_id group by marks.student_id;
