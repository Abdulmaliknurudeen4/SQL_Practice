show tables;
desc student_info;
desc student_result;
desc student_subject;
desc subjects;

insert into student_info values
('STID/ALF20/001', 'Nurudeen AbdulMalik', 'SS3', '2000-01-28'),
('STID/ALF20/002', 'Shuaib Nailah', 'JSS3', '2000-01-28'),
('STID/ALF20/003', 'Miqdaad Hussein', 'SS1', '2000-01-28'),
('STID/ALF20/004', 'Nurudeen Usamah', 'SS2', '2000-01-28'),
('STID/ALF20/005', 'AbdulGaniy AbdulHammed', 'JSS2', '2000-01-28');
select * from student_info;
-- subject offered in the school
insert into subjects values
('SBID/ALF/MAT101', 'Mathematics'),
('SBID/ALF/FMAT101', 'Futher Mathematics'),
('SBID/ALF/PHY112', 'Physics'),
('SBID/ALF/CHEM107', 'Chemistry'),
('SBID/ALF/BIO118', 'Biology'),
('SBID/ALF/COM134', 'Commerce'),
('SBID/ALF/GOV191', 'Government'),
('SBID/ALF/AGR122', 'Agricultural Science'),
('SBID/ALF/DBP304', 'Database Processing'),
('SBID/ALF/BSEN402', 'Basic Eletronics'),
('SBID/ALF/BSEL304', 'Basic Electricity'),
('SBID/ALF/TCD409', 'Techinical Drawing'),
('SBID/ALF/ECONS204', 'Economics'),
('SBID/ALF/ACC204', 'Accounting');

select * from subjects;
-- subject offered by each student
desc student_subject;
insert into student_subject values
('STID/ALF20/001','SBID/ALF/MAT101'),('STID/ALF20/001','SBID/ALF/FMAT101'),('STID/ALF20/001','SBID/ALF/PHY112'),('STID/ALF20/001','SBID/ALF/CHEM107'),
('STID/ALF20/001','SBID/ALF/BIO118'),('STID/ALF20/001','SBID/ALF/DBP304'),('STID/ALF20/001','SBID/ALF/BSEN402'),('STID/ALF20/001','SBID/ALF/TCD409');
insert into student_subject values
('STID/ALF20/002','SBID/ALF/MAT101'),('STID/ALF20/002','SBID/ALF/ECONS204'),('STID/ALF20/002','SBID/ALF/ACC204'),('STID/ALF20/002','SBID/ALF/DBP304'),
('STID/ALF20/002','SBID/ALF/AGR122'),('STID/ALF20/002','SBID/ALF/COM134'),('STID/ALF20/002','SBID/ALF/BIO118'),('STID/ALF20/002','SBID/ALF/CHEM107');
insert into student_subject values
('STID/ALF20/003','SBID/ALF/MAT101'),('STID/ALF20/003','SBID/ALF/FMAT101'),('STID/ALF20/003','SBID/ALF/PHY112'),('STID/ALF20/003','SBID/ALF/CHEM107'),
('STID/ALF20/003','SBID/ALF/BIO118'),('STID/ALF20/003','SBID/ALF/DBP304'),('STID/ALF20/003','SBID/ALF/BSEN402'),('STID/ALF20/003','SBID/ALF/TCD409');
insert into student_subject values
('STID/ALF20/004','SBID/ALF/MAT101'),('STID/ALF20/004','SBID/ALF/ECONS204'),('STID/ALF20/004','SBID/ALF/ACC204'),('STID/ALF20/004','SBID/ALF/DBP304'),
('STID/ALF20/004','SBID/ALF/AGR122'),('STID/ALF20/004','SBID/ALF/COM134'),('STID/ALF20/004','SBID/ALF/BIO118'),('STID/ALF20/004','SBID/ALF/CHEM107');
insert into student_subject values
('STID/ALF20/005','SBID/ALF/MAT101'),('STID/ALF20/005','SBID/ALF/ECONS204'),('STID/ALF20/005','SBID/ALF/ACC204'),('STID/ALF20/005','SBID/ALF/GOV191'),
('STID/ALF20/005','SBID/ALF/AGR122'),('STID/ALF20/005','SBID/ALF/COM134'),('STID/ALF20/005','SBID/ALF/BIO118'),('STID/ALF20/005','SBID/ALF/CHEM107');

select * from student_subject;

-- inserting the result of each student with respect to performance in each term
-- Result for STID/ALF20/001
insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8.6, 9.0, 10, 10, 59.5, 'First', 'SBID/ALF/MAT101', 'STID/ALF20/001'),
(7.0, 5.0, 9.0, 10, 40, 'Second', 'SBID/ALF/MAT101', 'STID/ALF20/001'),
(9.0, 9.0, 10, 10, 44.8, 'Third', 'SBID/ALF/MAT101', 'STID/ALF20/001');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8, 9.0, 8, 4, 35, 'First', 'SBID/ALF/FMAT101', 'STID/ALF20/001'),
(7, 5.0, 9.0, 7, 39, 'Second', 'SBID/ALF/FMAT101', 'STID/ALF20/001'),
(5, 2, 10, 5, 28, 'Third', 'SBID/ALF/FMAT101', 'STID/ALF20/001');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8, 9, 6, 8, 45.5, 'First', 'SBID/ALF/PHY112', 'STID/ALF20/001'),
(5, 7, 1, 6, 38.9, 'Second', 'SBID/ALF/PHY112', 'STID/ALF20/001'),
(7, 8, 5, 3, 33.9, 'Third', 'SBID/ALF/PHY112', 'STID/ALF20/001');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(4, 6, 3, 9, 48.8, 'First', 'SBID/ALF/CHEM107', 'STID/ALF20/001'),
(5, 7, 4, 7, 28.8, 'Second', 'SBID/ALF/CHEM107', 'STID/ALF20/001'),
(6, 6, 3, 10, 50.9, 'Third', 'SBID/ALF/CHEM107', 'STID/ALF20/001');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8.6, 9.0, 10, 7, 59.5, 'First', 'SBID/ALF/BIO118', 'STID/ALF20/001'),
(7.0, 5.0, 9.0, 5, 40, 'Second', 'SBID/ALF/BIO118', 'STID/ALF20/001'),
(9.0, 9.0, 9.3, 8, 44.8, 'Third', 'SBID/ALF/BIO118', 'STID/ALF20/001');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(9, 6, 7.8, 6, 38.8, 'First', 'SBID/ALF/DBP304', 'STID/ALF20/001'),
(6, 5, 9.8, 8, 48.5, 'Second', 'SBID/ALF/DBP304', 'STID/ALF20/001'),
(5, 7, 5.7, 3, 50.9, 'Third', 'SBID/ALF/DBP304', 'STID/ALF20/001');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(6, 9, 10, 9, 39, 'First', 'SBID/ALF/BSEN402', 'STID/ALF20/001'),
(7, 5, 7, 3, 49, 'Second', 'SBID/ALF/BSEN402', 'STID/ALF20/001'),
(6, 4, 8, 8, 53, 'Third', 'SBID/ALF/BSEN402', 'STID/ALF20/001');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(6, 2, 9, 4, 40, 'First', 'SBID/ALF/TCD409', 'STID/ALF20/001'),
(4, 3, 6, 3, 28, 'Second', 'SBID/ALF/TCD409', 'STID/ALF20/001'),
(5, 7, 2, 7, 43.8, 'Third', 'SBID/ALF/TCD409', 'STID/ALF20/001');
-- Ending of Insertion of result for Std001

-- Insertion for result of std002
insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8.6, 9.0, 10, 10, 59.5, 'First', 'SBID/ALF/MAT101', 'STID/ALF20/002'),
(7.0, 5.0, 9.0, 10, 40, 'Second', 'SBID/ALF/MAT101', 'STID/ALF20/002'),
(9.0, 9.0, 10, 10, 44.8, 'Third', 'SBID/ALF/MAT101', 'STID/ALF20/002');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8, 9.0, 8, 4, 35, 'First', 'SBID/ALF/ECONS204', 'STID/ALF20/002'),
(7, 5.0, 9.0, 7, 39, 'Second', 'SBID/ALF/ECONS204', 'STID/ALF20/002'),
(5, 2, 10, 5, 28, 'Third', 'SBID/ALF/ECONS204', 'STID/ALF20/002');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8, 9, 6, 8, 45.5, 'First', 'SBID/ALF/ACC204', 'STID/ALF20/002'),
(5, 7, 1, 6, 38.9, 'Second', 'SBID/ALF/ACC204', 'STID/ALF20/002'),
(7, 8, 5, 3, 33.9, 'Third', 'SBID/ALF/ACC204', 'STID/ALF20/002');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(4, 6, 3, 9, 48.8, 'First', 'SBID/ALF/DBP304', 'STID/ALF20/002'),
(5, 7, 4, 7, 28.8, 'Second', 'SBID/ALF/DBP304', 'STID/ALF20/002'),
(6, 6, 3, 10, 50.9, 'Third', 'SBID/ALF/DBP304', 'STID/ALF20/002');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8.6, 9.0, 10, 7, 59.5, 'First', 'SBID/ALF/AGR122', 'STID/ALF20/002'),
(7.0, 5.0, 9.0, 5, 40, 'Second', 'SBID/ALF/AGR122', 'STID/ALF20/002'),
(9.0, 9.0, 9.3, 8, 44.8, 'Third', 'SBID/ALF/AGR122', 'STID/ALF20/002');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(9, 6, 7.8, 6, 38.8, 'First', 'SBID/ALF/COM134', 'STID/ALF20/002'),
(6, 5, 9.8, 8, 48.5, 'Second', 'SBID/ALF/COM134', 'STID/ALF20/002'),
(5, 7, 5.7, 3, 50.9, 'Third', 'SBID/ALF/COM134', 'STID/ALF20/002');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(6, 9, 10, 9, 39, 'First', 'SBID/ALF/BIO118', 'STID/ALF20/002'),
(7, 5, 7, 3, 49, 'Second', 'SBID/ALF/BIO118', 'STID/ALF20/002'),
(6, 4, 8, 8, 53, 'Third', 'SBID/ALF/BIO118', 'STID/ALF20/002');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(6, 2, 9, 4, 40, 'First', 'SBID/ALF/CHEM107', 'STID/ALF20/002'),
(4, 3, 6, 3, 28, 'Second', 'SBID/ALF/CHEM107', 'STID/ALF20/002'),
(5, 7, 2, 7, 43.8, 'Third', 'SBID/ALF/CHEM107', 'STID/ALF20/002');
-- Ending of Insertion of result for Std002

-- Starting of Insertion of result for std003

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8.6, 9.0, 10, 10, 59.5, 'First', 'SBID/ALF/MAT101', 'STID/ALF20/003'),
(7.0, 5.0, 9.0, 10, 40, 'Second', 'SBID/ALF/MAT101', 'STID/ALF20/003'),
(9.0, 9.0, 10, 10, 44.8, 'Third', 'SBID/ALF/MAT101', 'STID/ALF20/003');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8, 9.0, 8, 4, 35, 'First', 'SBID/ALF/FMAT101', 'STID/ALF20/003'),
(7, 5.0, 9.0, 7, 39, 'Second', 'SBID/ALF/FMAT101', 'STID/ALF20/003'),
(5, 2, 10, 5, 28, 'Third', 'SBID/ALF/FMAT101', 'STID/ALF20/003');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8, 9, 6, 8, 45.5, 'First', 'SBID/ALF/PHY112', 'STID/ALF20/003'),
(5, 7, 1, 6, 38.9, 'Second', 'SBID/ALF/PHY112', 'STID/ALF20/003'),
(7, 8, 5, 3, 33.9, 'Third', 'SBID/ALF/PHY112', 'STID/ALF20/003');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(4, 6, 3, 9, 48.8, 'First', 'SBID/ALF/CHEM107', 'STID/ALF20/003'),
(5, 7, 4, 7, 28.8, 'Second', 'SBID/ALF/CHEM107', 'STID/ALF20/003'),
(6, 6, 3, 10, 50.9, 'Third', 'SBID/ALF/CHEM107', 'STID/ALF20/003');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8.6, 9.0, 10, 7, 59.5, 'First', 'SBID/ALF/BIO118', 'STID/ALF20/003'),
(7.0, 5.0, 9.0, 5, 40, 'Second', 'SBID/ALF/BIO118', 'STID/ALF20/003'),
(9.0, 9.0, 9.3, 8, 44.8, 'Third', 'SBID/ALF/BIO118', 'STID/ALF20/003');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(9, 6, 7.8, 6, 38.8, 'First', 'SBID/ALF/DBP304', 'STID/ALF20/003'),
(6, 5, 9.8, 8, 48.5, 'Second', 'SBID/ALF/DBP304', 'STID/ALF20/003'),
(5, 7, 5.7, 3, 50.9, 'Third', 'SBID/ALF/DBP304', 'STID/ALF20/003');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(6, 9, 10, 9, 39, 'First', 'SBID/ALF/BSEN402', 'STID/ALF20/003'),
(7, 5, 7, 3, 49, 'Second', 'SBID/ALF/BSEN402', 'STID/ALF20/003'),
(6, 4, 8, 8, 53, 'Third', 'SBID/ALF/BSEN402', 'STID/ALF20/003');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(6, 2, 9, 4, 40, 'First', 'SBID/ALF/TCD409', 'STID/ALF20/003'),
(4, 3, 6, 3, 28, 'Second', 'SBID/ALF/TCD409', 'STID/ALF20/003'),
(5, 7, 2, 7, 43.8, 'Third', 'SBID/ALF/TCD409', 'STID/ALF20/003');

-- Ending of Insertion of result for std003

-- Starting of Insertion of result for std004

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8.6, 9.0, 10, 10, 59.5, 'First', 'SBID/ALF/MAT101', 'STID/ALF20/004'),
(7.0, 5.0, 9.0, 10, 40, 'Second', 'SBID/ALF/MAT101', 'STID/ALF20/004'),
(9.0, 9.0, 10, 10, 44.8, 'Third', 'SBID/ALF/MAT101', 'STID/ALF20/004');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8, 9.0, 8, 4, 35, 'First', 'SBID/ALF/ECONS204', 'STID/ALF20/004'),
(7, 5.0, 9.0, 7, 39, 'Second', 'SBID/ALF/ECONS204', 'STID/ALF20/004'),
(5, 2, 10, 5, 28, 'Third', 'SBID/ALF/ECONS204', 'STID/ALF20/004');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8, 9, 6, 8, 45.5, 'First', 'SBID/ALF/ACC204', 'STID/ALF20/004'),
(5, 7, 1, 6, 38.9, 'Second', 'SBID/ALF/ACC204', 'STID/ALF20/004'),
(7, 8, 5, 3, 33.9, 'Third', 'SBID/ALF/ACC204', 'STID/ALF20/004');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(4, 6, 3, 9, 48.8, 'First', 'SBID/ALF/DBP304', 'STID/ALF20/004'),
(5, 7, 4, 7, 28.8, 'Second', 'SBID/ALF/DBP304', 'STID/ALF20/004'),
(6, 6, 3, 10, 50.9, 'Third', 'SBID/ALF/DBP304', 'STID/ALF20/004');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8.6, 9.0, 10, 7, 59.5, 'First', 'SBID/ALF/AGR122', 'STID/ALF20/004'),
(7.0, 5.0, 9.0, 5, 40, 'Second', 'SBID/ALF/AGR122', 'STID/ALF20/004'),
(9.0, 9.0, 9.3, 8, 44.8, 'Third', 'SBID/ALF/AGR122', 'STID/ALF20/004');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(9, 6, 7.8, 6, 38.8, 'First', 'SBID/ALF/COM134', 'STID/ALF20/004'),
(6, 5, 9.8, 8, 48.5, 'Second', 'SBID/ALF/COM134', 'STID/ALF20/004'),
(5, 7, 5.7, 3, 50.9, 'Third', 'SBID/ALF/COM134', 'STID/ALF20/004');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(6, 9, 10, 9, 39, 'First', 'SBID/ALF/BIO118', 'STID/ALF20/004'),
(7, 5, 7, 3, 49, 'Second', 'SBID/ALF/BIO118', 'STID/ALF20/004'),
(6, 4, 8, 8, 53, 'Third', 'SBID/ALF/BIO118', 'STID/ALF20/004');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(6, 2, 9, 4, 40, 'First', 'SBID/ALF/CHEM107', 'STID/ALF20/004'),
(4, 3, 6, 3, 28, 'Second', 'SBID/ALF/CHEM107', 'STID/ALF20/004'),
(5, 7, 2, 7, 43.8, 'Third', 'SBID/ALF/CHEM107', 'STID/ALF20/004');

-- Ending of Insertion of result for std004

-- Starting of Insertion of result for std005

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8.6, 9.0, 10, 10, 59.5, 'First', 'SBID/ALF/MAT101', 'STID/ALF20/005'),
(7.0, 5.0, 9.0, 10, 40, 'Second', 'SBID/ALF/MAT101', 'STID/ALF20/005'),
(9.0, 9.0, 10, 10, 44.8, 'Third', 'SBID/ALF/MAT101', 'STID/ALF20/005');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8, 9.0, 8, 4, 35, 'First', 'SBID/ALF/ECONS204', 'STID/ALF20/005'),
(7, 5.0, 9.0, 7, 39, 'Second', 'SBID/ALF/ECONS204', 'STID/ALF20/005'),
(5, 2, 10, 5, 28, 'Third', 'SBID/ALF/ECONS204', 'STID/ALF20/005');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8, 9, 6, 8, 45.5, 'First', 'SBID/ALF/ACC204', 'STID/ALF20/005'),
(5, 7, 1, 6, 38.9, 'Second', 'SBID/ALF/ACC204', 'STID/ALF20/005'),
(7, 8, 5, 3, 33.9, 'Third', 'SBID/ALF/ACC204', 'STID/ALF20/005');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(4, 6, 3, 9, 48.8, 'First', 'SBID/ALF/GOV191', 'STID/ALF20/005'),
(5, 7, 4, 7, 28.8, 'Second', 'SBID/ALF/GOV191', 'STID/ALF20/005'),
(6, 6, 3, 10, 50.9, 'Third', 'SBID/ALF/GOV191', 'STID/ALF20/005');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(8.6, 9.0, 10, 7, 59.5, 'First', 'SBID/ALF/AGR122', 'STID/ALF20/005'),
(7.0, 5.0, 9.0, 5, 40, 'Second', 'SBID/ALF/AGR122', 'STID/ALF20/005'),
(9.0, 9.0, 9.3, 8, 44.8, 'Third', 'SBID/ALF/AGR122', 'STID/ALF20/005');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(9, 6, 7.8, 6, 38.8, 'First', 'SBID/ALF/COM134', 'STID/ALF20/005'),
(6, 5, 9.8, 8, 48.5, 'Second', 'SBID/ALF/COM134', 'STID/ALF20/005'),
(5, 7, 5.7, 3, 50.9, 'Third', 'SBID/ALF/COM134', 'STID/ALF20/005');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(6, 9, 10, 9, 39, 'First', 'SBID/ALF/BIO118', 'STID/ALF20/005'),
(7, 5, 7, 3, 49, 'Second', 'SBID/ALF/BIO118', 'STID/ALF20/005'),
(6, 4, 8, 8, 53, 'Third', 'SBID/ALF/BIO118', 'STID/ALF20/005');

insert into 
student_result(first_ca, second_ca, third_ca, fourth_ca, exam_score, result_term,
 subject_offered_id, r_student_id) values
(6, 2, 9, 4, 40, 'First', 'SBID/ALF/CHEM107', 'STID/ALF20/005'),
(4, 3, 6, 3, 28, 'Second', 'SBID/ALF/CHEM107', 'STID/ALF20/005'),
(5, 7, 2, 7, 43.8, 'Third', 'SBID/ALF/CHEM107', 'STID/ALF20/005');

-- Ending of Insertion of result for std005

-- create view that shows the total of terms(maybe)


use student_reportbook;
desc student_result;
select * from student_result;