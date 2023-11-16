create table student(
	studentNum int not null,
	name varchar(20) not null,
	primary key (studentNum)
);

create table info(
	name varchar(50) not null,
	adr varchar(50),
	school varchar(50),
	major varchar(50),
	primary key (name)
);

select * from student;
select * from info;

insert into student(studentNum, name)
select IFNULL(max(studentNum)+1,1),'홍길동' from student;
insert into student(studentNum, name)
select IFNULL(max(studentNum)+1,1),'이재용' from student;
insert into student(studentNum, name)
select IFNULL(max(studentNum)+1,1),'고길동' from student;

insert into info(name, adr, school, major)
values ('홍길동', '서울시', '서울대', '컴공과');
insert into info(name, adr, school, major)
values ('이재용', '서울시', '서울대', '경영과');
insert into info(name, adr, school, major)
values ('고길동', '서울시', '서울대', '의예과');

delete from info where name='이재용1234';

commit;