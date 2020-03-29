# 1.Query the existence of 1 course
select* from student_course where courseId =1 
# 2.Query the presence of both 1 and 2 courses
select* from student_course where courseid = 1 or courseid = 2
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select student.id, student.name, avg(score) from student inner join student_course 
where student.id=student_course.studentid group by student.id having avg(score)>=60
# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where id not in (select studentid from student_course)
# 5.Query all SQL with grades
select student.id,student.name,student.age, student.sex, student_course.courseId,
course.name, student_course.score, teacher.name from student inner join student_course, course, teacher
 where student.id=student_course.studentId and course.id=student_course.courseId
 and teacher.id = course.teacherId
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select * from student inner join student_course where student.id = student_course.studentId
and student.id=1 and courseid=2
# 7.Retrieve 1 student score with less than 60 scores in descending order
select * from student inner join student_course
where student.id = student_course.studentId and student_course.score < 60 
order by student_course.score desc limit 1
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT student_course.courseid, course.name, avg (score) 
FROM student_course inner join course
where student_course.courseid = course.id
group by student_course.courseId 
order by avg(score) desc, student_course.courseid asc
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select student.id, student.name, student_course.score, course.name
from student inner join student_course, course
where student.id = student_course.studentId and course.id = student_course.courseId
having score < 60 and course.name = "Math"
