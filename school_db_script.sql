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
    student_id int not null,
    start_date date not null,
    exam_time time not null,
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
	name varchar(30) not null,
	grade_year year not null,
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
	status boolean not null,
    primary key(classroom_id)
    );
    
create table classroom_student(
	cla0ssroom_id int not null,
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
    
       
show tables;
