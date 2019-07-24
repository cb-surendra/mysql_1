show databases;
use training_sample;
/*List the students who didn’t appear for any exams.
Format: name*/
SELECT students.name
FROM (marks INNER JOIN students ON marks.student_id = students.id) where marks.quarterly is null and marks.half_yearly is null and marks.annual is null;

/*Find the total marks scored by each students in the annual exams. If the student hasn’t appeared for any annual exam, he should still be listed with total marks scored as “0”.
Format: name, marks, year*/
SELECT students.name, marks.subject_id, (marks.quarterly+marks.half_yearly+marks.annual) as total, marks.year
FROM (marks INNER JOIN students ON marks.student_id = students.id) where marks.quarterly is not null and marks.half_yearly is not null and
 marks.annual is not null;

/*List the students with the total marks scored in quarterly from all the subjects they had appeared during the year 2003.
Format: name, total, grade*/
select * from marks;
select student_id, count(subject_id), sum(quarterly) from marks group by student_id;
SELECT students.name as name, count(marks.subject_id) as Totalubject, sum(marks.quarterly) as Total, avg(marks.grade) as grade
FROM (marks INNER JOIN students ON marks.student_id = students.id) where marks.year = 2003 group by marks.student_id;

/*List the 9th and 10th grade students who received more than 3 medals.
Format: name, grade, no_of_medals*/
show tables;
desc Students;
desc medals;
select * from medals;
select student_id, count(medal_won) from medals group by student_id;
select students.name, count(medals.medal_won) from medals 
	inner join students on students.id = medals.student_id
    where medals.grade = 7 or medals.grade = 6 
    group by medals.student_id
    having count(medals.medal_won) > 3;
/*List the students who got less than 2 medals. This should also include the students who has not won any medals.
Format: name, grade, no_of_medals*/
select * from medals;
select * from students;
select students.name, count(medals.medal_won) from students left join medals 
	on students.id = medals.student_id
    left join marks on students.id = marks.student_id
    group by students.id having count(medals.medal_won) < 2;
  
/*List the students who has not yet received any medals but scored more than 90 marks in all the subjects in the annual exam for that year.
Format: name, year*/
select count(*) from marks;
select count(*) from students;
select count(*) from medals;
desc marks;
select students.name, count(medals.medal_won) from students left join medals 
	on students.id = medals.student_id
    left join marks on students.id = marks.student_id
    where marks.annual > 90
    group by students.id 
    having count(medals.medal_won) < 1;

List the records from the medals table for the students who had won more than 3 medals.
Format: name, game_id, medal_won, year, grade

List the number of medals and percentage of marks(based on total for the 5 subjects) scored in each year.
Format: name, medals, quarterly_per, half_yearly_per, annual_per, year, grade

Lets assign some rating for the total marks scored - S(450-500), A(400-449), B(350-399), C(300-349), D(250,299), E(200-249), F(below 200). List the students with the grade obtained in each year for each exam(quarterly, half-yearly and annual)
Format: name, quarterly_rating, half_yearly_rating, annual_rating, year, grade



