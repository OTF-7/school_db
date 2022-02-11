create database school_db;
use school_db;
create table student(
	student_id int not null auto_increment,
    first_name varchar(25) not null,
    mid_name varchar(25) not null,
    last_name varchar(25) not null,
    address varchar(35) not null,
    religion varchar(35) not null,
    nationality varchar(35) not null,
    username varchar(50),
    email varchar(50),
    s_password varchar(30),
    birth_date date not null,
    phone varchar(20),
    s_status boolean not null,
    date_of_join date not null,
    hoppies varchar(50),
    last_login_date datetime,
    last_login_ip varchar(50),
    primary key(student_id)
    );

create table guardian(
	guardian_id int not null auto_increment,
    first_name varchar(25) not null,
    mid_name varchar(25) not null,
    last_name varchar(25) not null,
    address varchar(35) not null,
    religion varchar(35) not null,
    nationality varchar(35) not null,
    username varchar(50) not null,
    email varchar(50) not null,
    g_password varchar(30) not null,
    birth_date date,
    phone varchar(20) not null,
    g_status boolean not null,
    date_of_join date not null,
    last_login_date datetime,
    last_login_ip varchar(50),
    primary key(guardian_id)
    );

create table teacher(
	teacher_id int not null auto_increment,
    first_name varchar(25) not null,
    mid_name varchar(25) not null,
    last_name varchar(25) not null,
    address varchar(35) not null,
    religion varchar(35) not null,
    nationality varchar(35) not null,
    username varchar(50) not null,
    email varchar(50) not null,
    t_password varchar(30) not null,
    birth_date date not null,
    phone varchar(20) not null,
    t_status boolean not null,
    date_of_join date not null,
    last_login_date datetime,
    last_login_ip varchar(50),
    primary key(teacher_id)
    );
    
create table exam(
	exam_id int not null auto_increment,
    subject_id int not null,
    start_date_time datetime not null,
    perioud time not null,
    primary key(exam_id)
    );
    
create table exam_result(
	result_id int not null auto_increment,
	exam_id int not null,
    student_id int not null,
    marks int not null,
    primary key(result_id)
    );
    
create table subject(
	subject_id int not null auto_increment,
	grade_id int not null,
    subject_name varchar(35) not null,
    description text not null,
    primary key(subject_id)
    );
    
create table teacher_subject(
	teacher_id int not null,
	subject_id int not null,
    primary key(teacher_id, subject_id)
    );
    
create table guardian_student(
	guardian_id int not null,
	student_id int not null,
	guardian_student_relation varchar(30) not null,
    primary key(guardian_id, student_id)
    );
    
create table grade(
	grade_id int not null auto_increment,
	level int not null,
	term int not null,
    primary key(grade_id)
    );
    
create table class(
	class_id int not null auto_increment,
	grade_id int not null,
	subject_id int not null,
	teacher_id int not null,
	classroom_id int not null,
	perioud time not null,
	start_time time not null,
    primary key(class_id)
    );
        
create table classroom(
	classroom_id int not null auto_increment,
    grade_id int not null,
    room int not null,
	status boolean not null,
    primary key(classroom_id)
    );
    
create table classroom_student(
	classroom_id int not null,
	student_id int not null,
	status boolean not null,
    primary key(student_id, classroom_id)
    );
    
create table attendance(
	attendance_id int not null auto_increment,
	student_id int not null,
	a_date date not null,
	marks int not null,
	status int not null,
    primary key(attendance_id)
    );
  
ALTER TABLE attendance ADD CONSTRAINT FK_attendance_student FOREIGN KEY (student_id) 
REFERENCES student (student_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE guardian_student ADD CONSTRAINT FK_guardian_student_s_id FOREIGN KEY (student_id) 
REFERENCES student (student_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE guardian_student ADD CONSTRAINT FK_guardian_student_g_id FOREIGN KEY (guardian_id) 
REFERENCES guardian (guardian_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE classroom_student ADD CONSTRAINT FK_classroom_student_s_id FOREIGN KEY (student_id) 
REFERENCES student (student_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE classroom_student ADD CONSTRAINT FK_classroom_student_c_id FOREIGN KEY (classroom_id) 
REFERENCES classroom (classroom_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE classroom ADD CONSTRAINT FK_classroom_grade FOREIGN KEY (grade_id) 
REFERENCES grade (grade_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE class ADD CONSTRAINT FK_class_classroom FOREIGN KEY (classroom_id) 
REFERENCES classroom (classroom_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE class ADD CONSTRAINT FK_class_grade FOREIGN KEY (grade_id) 
REFERENCES grade (grade_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE class ADD CONSTRAINT FK_class_subject_id FOREIGN KEY (subject_id) 
REFERENCES subject (subject_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE class ADD CONSTRAINT FK_class_teacher FOREIGN KEY (teacher_id) 
REFERENCES teacher (teacher_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE teacher_subject ADD CONSTRAINT FK_teacher_subject_t_id FOREIGN KEY (teacher_id) 
REFERENCES teacher (teacher_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE teacher_subject ADD CONSTRAINT FK_teacher_subject_s_id FOREIGN KEY (subject_id) 
REFERENCES subject (subject_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE subject ADD CONSTRAINT FK_subject_grade FOREIGN KEY (grade_id) 
REFERENCES grade (grade_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE exam_result ADD CONSTRAINT FK_exam_result_student FOREIGN KEY (student_id) 
REFERENCES student (student_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE exam_result ADD CONSTRAINT FK_exam_result_exam FOREIGN KEY (exam_id) 
REFERENCES exam (exam_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE exam ADD CONSTRAINT FK_exam_subject FOREIGN KEY (subject_id) 
REFERENCES subject (subject_id) ON DELETE CASCADE ON UPDATE CASCADE;

insert into student (first_name, mid_name, last_name, address, religion, nationality, username, email, 
s_password, birth_date, phone, s_status, date_of_join, hoppies, last_login_date, last_login_ip)
values("Omar", "Taha", "Alfaqeer", "Almadena", "Islam", "Yemeni", "omar_taha", "omartaha.tech7@gmail.com", "123",
"1999-08-26", "733630142", True, "2022-02-11", "football, watching anime", "2022-02-11", "127.1.1.7"),
("Mohammed", "Salim", "Alqershi", "Almadena", "Islam", "Yemeni", "moh", "moh.@gmail.com", "22",
"2004-08-26", "774588564", True, "2022-02-11", "playstation, hacking", "2022-02-11", "127.1.1.17"),
("Abubaker", "Omar", "Alduba'e", "Aldaery", "Jewish", "Jewish", "Abu", "abu@gmail.com", "156498456",
"1998-01-01", "778844686", True, "2021-02-11", "reading", "2022-01-11", "17.1.1.27"),
("Ala'a", "Abudlsalam", "Alqadasy", "Sawan", "Islam", "Yemeni", "Ala'a", "ala@gmail.com", "121",
"1998-02-23", "774865459", True, "2022-02-11", "watching movies", "2022-01-01", "12.12.1.7"),
("Mohammed", "Abudlsalam", "Alqadasy", "Sawan", "Islam", "Yemeni", "mohammed", "moh@gmail.com", "245",
"1997-02-23", "735688585", True, "2022-01-01", "writing novels", "2022-02-01", "1.142.1.17");

insert into attendance (student_id, a_date, marks, status)
values(1, "2022-02-5", 20, True), 
(2, "2022-02-5", 20, True), 
(3, "2022-02-5", 20, True), 
(4, "2022-02-5", 15, True), 
(5, "2022-02-5", 15, True), 
(1, "2022-02-6", 20, True), 
(2, "2022-02-6", 20, True), 
(3, "2022-02-6", 10, True), 
(4, "2022-02-6", 20, True), 
(5, "2022-02-6", 15, True);

insert into guardian (first_name, mid_name, last_name, address, religion, nationality, username, email,
g_password, birth_date, phone, g_status, date_of_join, last_login_date, last_login_ip)
values("Taha", "Mohammed", "Alfaqeer", "Almadena", "Islam", "Yemeni", "taha_alfaqeer", "tah@gmail.com", "444",
"1969-01-01", "737185991", True, "2022-01-01", "2022-02-1", "25.1.545.4"),
("Salim", "Mohammed", "Alqershi", "Almadena", "Islam", "Yemeni", "salim", "sal@gmail.com", "425",
"1975-01-01", "735682564", True, "2022-01-05", "2022-01-11", "235.1.75.4"),
("Abdulsalam", "Mohammed", "Alqadasy", "sawan", "Islam", "Yemeni", "abdulsalam", "abd@gmail.com", "321",
"1972-01-01", "735845657", True, "2021-01-01", "2022-01-1", "25.1.545645.4"),
("Omar", "Mohammed", "Alduba'e", "Aldaery", "Islam", "Yemeni", "Omar", "omar@gmail.com", "475",
"1974-01-01", "771546858", True, "2021-01-01", "2022-02-7", "25.1.785.46");

insert into guardian_student (guardian_id, student_id, guardian_student_relation)
values(1, 1, "father"),(2, 2, "father"),(3, 3, "father"),(3, 4, "father");

insert into teacher (first_name, mid_name, last_name, address, religion, nationality, username, email,
t_password, birth_date, phone, t_status, date_of_join, last_login_date, last_login_ip)
values("Maher", "Mohammed", "Almosly", "Alsabeen", "Islam", "Yemeni", "maher", "maher@gmail.com", "333",
"1980-01-01", "774586545", True, "2020-07-05", "2022-02-1", "25.1.85.49"),
("Haithem", "ahmed", "Almaktary", "Almesbahi", "Islam", "Yemeni", "haithem", "h@gmail.com", "789",
"1982-01-01", "774586491", True, "2020-01-04", "2022-02-04", "25.1.5.64"),
("Ali", "Ahmed", "Alsarory", "Aldaery", "Islam", "Yemeni", "ali", "ali@gmail.com", "456",
"1973-01-01", "735684985", True, "2018-01-01", "2022-02-9", "25.1.0.12");

insert into grade (level, term)
values(1, 1),(2, 1),(3, 1),(4, 1),(5, 1),(6, 1),(7, 1),(8, 1),(9, 1),(10, 1),(11, 1),(12, 1),
(1, 2),(2, 2),(3, 2),(4, 2),(5, 2),(6, 2),(7, 2),(8, 2),(9, 2),(10, 2),(11, 2),(12, 2);

insert into subject (grade_id, subject_name, description)
values(1, "Qura'an", "Qura'an for first grade in first term"),
(6, "Science", "Science for first grade in first term"), 
(13, "Arabic", "Arabic for first grade in second term");

insert into teacher_subject (teacher_id, subject_id)
values(1, 1),(2, 2),(2, 1),(3, 3);

insert into classroom (grade_id, room, status)
values(1, 1, True),(1, 2, True),(7, 1, False),(6, 1, True),(6, 2, True);

insert into classroom_student (classroom_id, student_id, status)
values(1, 1, True),(2, 1, True),(3, 1, False),(4, 2, True),(5, 2, True);

insert into exam (subject_id, start_date_time, perioud)
values(1, "2022-02-18 8:30:00 ", "3:30"),(1, "2022-03-20 8:30:00 ", "2:00"),(2, "2022-01-15 10:30:00 ", "3:30");

insert into exam_result (exam_id, student_id, marks)
values(1, 1, 20), 
(1, 2, 15), 
(1, 3, 12), 
(1, 4, 18), 
(1, 5, 15), 
(2, 1, 17), 
(2, 2, 0), 
(2, 3, 15), 
(2, 4, 20), 
(2, 5, 15), 
(3, 1, 20), 
(3, 2, 14), 
(3, 3, 1), 
(3, 4, 7), 
(3, 5, 3);

insert into class (grade_id, subject_id, teacher_id, classroom_id, perioud, start_time)
values(1, 1, 1, 1, "3:30", "8:00"),
(6, 2, 3, 2, "1:30", "11:00"),
(13, 3, 2, 2, "2:30", "9:30"),
(6, 3, 3, 1, "3:00", "10:00"),
(1, 1, 1, 3, "1:00", "8:00"),
(13, 2, 2, 3, "0:45", "9:00");

show tables;
