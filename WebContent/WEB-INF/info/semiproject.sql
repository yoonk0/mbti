drop table member_c;
  
create table member_c(
	id varchar(10) primary key,
	password varchar(10) not null,
	gender varchar(1) not null,
	age TINYINT not null, 
	location varchar(100) not null, 
	job varchar(50) not null, 
	height TINYINT not null, 
	hobby varchar(50) not null, 
	admin TINYINT default 0, 
	picture varchar(100) not null, 
	mbti varchar(4) not null, 
	kakao varchar(50) not null 
)
delete member_c where id = 'java';
delete poke_c where se_Id = 'java';
insert into member_c values('yoonjung','1234','F','25','1','학생',1,'영화',1,'iu.jpg','intp','kilene');
insert into member_c values('java','1234','M','25','제주','학생',1,'영화',1,'iu.jpg','intp','kilene');
insert into member_c values('jing','1234','F','27',1,'학생',1,'영화',1,'iu.jpg','esfp','jinyong');
insert into member_c values('servlet','1234','F','27','서울','학생',1,'영화',0,'iu.jpg','esfp','jinyong');
select * from member_c; 
select count(*) from board_c;
select id from member_c where id != 'java';
drop table board_c; 
select b.post_no,b.title,b.content,b.time_posted,m.id from member_c m, board_c b where m.id=b.id and b.post_no !=8;

create table board_c(
	post_no SMALLINT AUTO_INCREMENT primary key, 
	title varchar(100) not null, 
	content TEXT not null, 
	time_posted date not null,
	id varchar(10) not null, 
	constraint fk_boardId foreign key(id) references member_c(id)
)

select * from board_c;
drop sequence board_c_seq; 
create sequence board_c_seq; 

drop table poke_c; 

create table poke_c(
	poke_no SMALLINT AUTO_INCREMENT primary key,
	se_Id varchar(10) not null,
	re_Id varchar(10) not null, 
	confirm varchar(1) not null, 
	constraint fk_seId foreign key(se_Id) references member_c(id),
	constraint fk_reId foreign key(re_Id) references member_c(id)
)

insert into poke_c values(poke_seq.nextval,'java','jsp',0);
select * from POKE_C; 

--내가 보낸 쪽지
select m.id, p.re_Id, p.confirm
from member_c m, POKE_C p
where m.id = p.se_Id; 

--내가 받은 쪽지 
select m.id, p.se_Id, p.confirm
from member_c m, poke_c p
where m.id = p.re_Id; 

select b.post_no,b.title,b.content,b.time_posted,m.id from member_c m, board_c b where m.id=b.id and b.post_no =12;
drop sequence poke_seq; 
create sequence poke_seq; 
병우

select *from member_c;


select b.post_no,m.id,b.title,b.time_posted,b.page from (select post_no,id,title,time_posted,ceil(rownum/5) as page from(select post_no,id,title,to_char(time_posted,'YYYY.MM.DD') as time_posted from board_c order by post_no desc)) b, member_c m where b.id = m.id and page=1;