select * from subjects;
select * from student_info;
select * from student_result;
select * from student_subject;
-- Result by Term and Subject Offered
select (first_ca+second_ca+third_ca+fourth_ca) as ca_total,
exam_score, result_term,subject_offered_id from
 student_result where r_student_id='STID/ALF20/005' AND result_term = 'Third';
 
 -- Get all Subject Offered by a Student;
 show tables;
 select * from student_subject;
 select subject_id from student_subject where student_id = 'STID/ALF20/005';
 
 -- Getting the Result of all Subject and Subject name with respect to term 
desc student_info;
desc student_result;
desc student_subject;
desc subjects;
use student_reportbook;

SELECT SUB.subject_name, 
STURES.first_ca, STURES.second_ca, STURES.third_ca, STURES.fourth_ca,
STURES.exam_score
FROM subjects SUB JOIN student_subject STUSUB 
ON SUB.subject_id = STUSUB.subject_id JOIN student_result STURES 
ON STURES.subject_offered_id = SUB.subject_id AND STURES.r_student_id = STUSUB.student_id
WHERE STURES.r_student_id = 'STID/ALF20/001' AND STURES.result_term = 'Second';

SELECT SUB.subject_name, 
(STURES.first_ca + STURES.second_ca + STURES.third_ca + STURES.fourth_ca) AS ca_total,
STURES.exam_score
FROM subjects SUB JOIN student_subject STUSUB 
ON SUB.subject_id = STUSUB.subject_id JOIN student_result STURES 
ON STURES.subject_offered_id = SUB.subject_id AND STURES.r_student_id = STUSUB.student_id
WHERE STURES.r_student_id = 'STID/ALF20/001' AND STURES.result_term = 'Second';

-- Query for ... Comparison Bar Chart
SELECT SUB.subject_name,
(STURES.first_ca + STURES.second_ca + STURES.third_ca + STURES.fourth_ca + STURES.exam_score)
AS per_total
FROM subjects SUB JOIN student_subject STUSUB 
ON SUB.subject_id = STUSUB.subject_id JOIN student_result STURES 
ON STURES.subject_offered_id = SUB.subject_id AND STURES.r_student_id = STUSUB.student_id
WHERE STURES.r_student_id = 'STID/ALF20/001' AND STURES.result_term = 'Second';

-- Query for ... Comparison Bar Chart Level 2 for all Subject accorss Terms
SELECT SUB.subject_name,
(STURES.first_ca + STURES.second_ca + STURES.third_ca + STURES.fourth_ca + STURES.exam_score)
AS per_total, STURES.result_term
FROM subjects SUB JOIN student_subject STUSUB 
ON SUB.subject_id = STUSUB.subject_id JOIN student_result STURES 
ON STURES.subject_offered_id = SUB.subject_id AND STURES.r_student_id = STUSUB.student_id
WHERE STURES.r_student_id = 'STID/ALF20/001';
---

-- Distinct Term for a Student
SELECT DISTINCT result_term from student_result WHERE r_student_id = 'STID/ALF20/001';
SELECT student_name FROM student_info WHERE student_id = 'STID/ALF20/001';
-- Select all result for the Term of a Student
SELECT SUB.subject_name,
STURES.first_ca, STURES.second_ca, STURES.third_ca, STURES.fourth_ca, STURES.exam_score
FROM subjects SUB JOIN student_subject STUSUB 
ON SUB.subject_id = STUSUB.subject_id JOIN student_result STURES 
ON STURES.subject_offered_id = SUB.subject_id AND STURES.r_student_id = STUSUB.student_id
WHERE STURES.r_student_id = 'STID/ALF20/001' AND STURES.result_term = 'Third';

-- Shows the cumulative for Each Subject Across Term
SELECT SUB.subject_name,
(STURES.first_ca+ STURES.second_ca+ STURES.third_ca+ STURES.fourth_ca+ STURES.exam_score)
as total
FROM subjects SUB JOIN student_subject STUSUB 
ON SUB.subject_id = STUSUB.subject_id JOIN student_result STURES 
ON STURES.subject_offered_id = SUB.subject_id AND STURES.r_student_id = STUSUB.student_id
WHERE STURES.r_student_id = 'STID/ALF20/001' AND STURES.result_term = 'Third';

--

use student_reportbook;