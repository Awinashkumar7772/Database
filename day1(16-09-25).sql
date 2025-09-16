use mydac;
create table users(
id int auto_increment primary key,
name varchar(50) ,
email varchar(50),
gender enum('Male', 'female','Other'),
date_of_birth date,
created_at timestamp default current_timestamp
);
insert into users(id,name,email,gender,date_of_birth,created_at)
 values
 (2,'rakesh','rakesh10@gmail.com','Male','2004-02-15' ,'2025-09-16 22:00:50'),
 (3,'ravi','ravi16@gmail.com','Male','2000-04-16' ,'2025-09-16 22:01:50'),
 (4,'salman','salman23@gmail.com','Male','2007-09-16' ,'2025-09-16 22:02:05'),
 (5,'kishan','kishan45@gmail.com','Male','2000-02-16' ,'2025-09-16 22:03:50'),
 (6,'misty','misty98@gmail.com','Female','2005-12-16' ,'2025-09-16 22:04:09'),
 (7,'trinity','trinity45@gmail.com','other','2002-02-16' ,'2025-09-16 21:52:50');
 
 
 alter table users
 add mark int;
 
 alter table users
 add basicpay int; 
 ALTER TABLE users
MODIFY name VARCHAR(255) NULL,
MODIFY email VARCHAR(255) NULL,
MODIFY gender VARCHAR(10) NULL,
MODIFY date_of_birth DATE NULL,
MODIFY created_at DATETIME NULL;
 
 insert into users(id,mark,basicpay)
 values
 (90,2000),
 (90,3000),
 (60,20900),
 (50,4873),
 (69,38383),
 (87,64737);
 select name,gender from users where date_of_birth = '2002-02-16';
 select *from users;
