
				##########           MINI Project on STUDENT MANAGEMENT SYSTEM (SQL)          ##########

CREATE DATABASE student_management;

USE student_management;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    gender CHAR(1),
    age INT,
    department VARCHAR(30)
);

CREATE TABLE courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(50),
    instructor VARCHAR(50),
    credits INT
);

CREATE TABLE enrollment (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id VARCHAR(10),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


###############################         Insert Sample Data          ###############################


INSERT INTO students VALUES
(1, 'Shreyal Ikhar', 'F', 24, 'Computer Science'),
(2, 'Tejal Ikhar', 'M', 27, 'Mechanical'),
(3, 'Tejashri Darokar', 'F', 27, 'Physics'),
(4, 'Samiksha Darokar', 'F', 24, 'IT'),
(5, 'Purvesh Ambadkar', 'M', 29, 'Electronics');

INSERT INTO courses VALUES
('C101', 'Database Systems', 'Dr. Deshpande', 3),
('C102', 'Python Programming', 'Ms. Sharma', 4),
('C103', 'Data Structures', 'Mr. Wadnare', 3),
('C104', 'Machine Learning', 'Dr. Gupta', 4);

INSERT INTO enrollment VALUES
(1, 1, 'C101', 85),
(2, 1, 'C102', 91),
(3, 2, 'C101', 78),
(4, 2, 'C103', 82),
(5, 3, 'C102', 69),
(6, 3, 'C104', 88),
(7, 4, 'C103', 55),
(8, 5, 'C101', 92),
(9, 5, 'C104', 95);


########################################################################################################################

# View all students
Select * from students;

Select * from enrollment;

# List all courses
Select * from courses;

#######################################################################################################################

# Show which students are enrolled in which courses

SELECT s.name, c.course_name, e.marks
FROM enrollment e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

# Average marks per course

SELECT c.course_name, AVG(e.marks) AS avg_marks
FROM enrollment e
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_name;

# Find top-performing student (highest average marks)

SELECT s.name, ROUND(AVG(e.marks),2) AS average_marks
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
GROUP BY s.name
ORDER BY average_marks DESC
LIMIT 3;

# List all students who failed (marks < 60)

SELECT s.name, c.course_name, e.marks
FROM enrollment e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.marks < 60;

# Count students per department

SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department;

# Find students enrolled in “Python Programming

SELECT s.name FROM students s
JOIN enrollment e ON s.student_id = e.student_id
WHERE e.course_id = 'C102';


# Total marks earned by each student

SELECT s.name, SUM(e.marks) AS total_marks
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
GROUP BY s.name;


# Courses taught by Dr. Deshpande

SELECT * FROM courses
WHERE instructor = 'Dr. Deshpande';



























