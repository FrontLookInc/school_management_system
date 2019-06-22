/*RETURNING SUBJECT NAME INDIVIDUALLY*/
/*
SELECT students.students_reg_id, students.name, marksheet.term, marksheet.subject_name, (marksheet.full_marks_written+marksheet.full_marks_oral+marksheet.full_marks_practical) AS FULL_MARKS, SUM(marksheet.marks_obtained_written) FROM students INNER JOIN marksheet ON students.students_reg_id=marksheet.students_reg_id GROUP BY marksheet.term, students.students_reg_id, students.name,marksheet.term, marksheet.subject_name,marksheet.full_marks_written,marksheet.full_marks_oral,marksheet.full_marks_practical ORDER BY students.students_reg_id
*/
/**/
/**/

/*
SELECT 
students.name, marksheet.class_name, marksheet.subject_name,
SUM(marksheet.full_marks_written+marksheet.full_marks_oral+marksheet.full_marks_practical) as 'FULL_MARKS',
SUM(marksheet.marks_obtained_written+marksheet.marks_obtained_oral+marksheet.marks_obtained_practical) as 'MARKS_OBTAINED'

FROM

students

INNER JOIN

marksheet

ON

students.students_reg_id=marksheet.students_reg_id

GROUP BY

marksheet.subject_name,marksheet.session,marksheet.students_reg_id,students.name,marksheet.class_name,
marksheet.full_marks_written,marksheet.full_marks_oral,marksheet.full_marks_practical,
marksheet.marks_obtained_written,marksheet.marks_obtained_oral,marksheet.marks_obtained_practical
*/

/*SELECT * FROM (SELECT * FROM STUDENTS) x WHERE x.name='Arka';*/

/*
SELECT b.* FROM (SELECT * FROM (SELECT * FROM students WHERE (contact_no1=7044476408 OR contact_no1 IS NULL OR contact_no1=7003564171 OR contact_no2=7003564171 OR contact_no2=7044476408 OR contact_no2 IS NULL OR father_name='Aswini Chakraborty' OR mother_name='Nirja Chakraborty'
 OR guardian_name='Akash' OR guardian_name='Aswini Chakraborty' or guardian_name='nita')) a WHERE (a.contact_no1=7044476408 OR a.contact_no1=7003564171 OR a.contact_no1 IS NULL OR a.contact_no2=7003564171 OR a.contact_no2=7044476408 OR a.contact_no2 IS NULL)) b WHERE 
                b.name='Raj Chakraborty';
*/

SELECT a.* FROM (SELECT * FROM students WHERE (contact_no1='7044476408' OR contact_no1 IS NULL OR contact_no1='7003564171' OR contact_no2='7003564171' OR contact_no2='7044476408' OR contact_no2 IS NULL OR father_name='Aswini Chakraborty' OR mother_name='Nirja Chakraborty'
 OR guardian_name='Akash' OR guardian_name='Aswini Chakraborty' or guardian_name='nita')) a WHERE 
                a.name='Raj Chakraborty'

/*SELECT * FROM students WHERE name='Raj Chakraborty' AND (contact_no1=7044476408 OR contact_no1=7003564171 OR contact_no2=7003564171 OR contact_no2=7044476408 OR father_name='Aswini Chakraborty' OR mother_name='Nirja Chakraborty'
 OR guardian_name='Akash' OR guardian_name='Aswini Chakraborty' or guardian_name='nita')
*/

/*
SELECT students_reg_id, session, subject_name, SUM(marksheet.marks_obtained_written+marksheet.marks_obtained_oral+marksheet.marks_obtained_practical)
FROM
marksheet
GROUP BY subject_name,students_reg_id,session
ORDER BY
students_reg_id
*/

