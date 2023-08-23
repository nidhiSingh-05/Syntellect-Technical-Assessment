show databases;
##     create data base
create database dataModel;
use dataModel;
## create author table

create table author (
id int primary key,
name varchar(100));

desc author;
## inset value in author table

INSERT INTO author VALUES(1,'James Bond');
INSERT INTO author VALUES(2,'Nidhi Singh');

select * from author;

## create user table

create table user (
id int primary key,
name varchar(100));

desc user;
## insert values in user table

INSERT INTO user VALUES(1,'Gilcrist');
INSERT INTO user VALUES(2,'Sachin');
INSERT INTO user VALUES(3,'Devilers');

SELECT * FROM user;

## create post table
CREATE TABLE post( id INT PRIMARY KEY NOT NULL, NAME VARCHAR(100), authorid INT , 
createdts DATETIME ,FOREIGN KEY (authorid)REFERENCES  author(id)) ;

desc post;

INSERT INTO post VALUES(1,'Indian batting Order collepsed',1,'2023-08-04 13:05:18');
INSERT INTO post VALUES(2,'India will come back',2,'2023-07-04 13:08:18');
INSERT INTO post VALUES(3,'kohli have to play a good inning',1,'2023-06-04 13:10:18');
INSERT INTO post VALUES(4,'India have to play with one Extra batsman',1,'2023-08-04 13:12:34');
INSERT INTO post VALUES(5,'Team looks fine and balanced',2,'2023-02-04 13:18:15');
INSERT INTO post VALUES(6,'England are faviorate now',1,'2023-05-04 13:31:25');
INSERT INTO post VALUES(7,'Bumrah me will take over on england',2,'2023-04-04 13:35:08');

SELECT * FROM post;

## create comment table
CREATE TABLE comment ( id INT PRIMARY KEY NOT NULL, content VARCHAR(1000), postid INT ,
createdts DATETIME ,userid INT ,  FOREIGN KEY(userid) REFERENCES  user(id) ,
FOREIGN KEY(postid) REFERENCES post(id) );

desc comment;
## values insert into comment table

INSERT INTO COMMENT VALUES(1,'You Are Right',1,'2023-08-04 14:08:47',1);
INSERT INTO COMMENT VALUES(2,'Yadav is furios',2,'2023-08-04 14:08:51',2);
INSERT INTO COMMENT VALUES(3,'grate compitition',1,'2023-08-04 14:09:25',3);
INSERT INTO COMMENT VALUES(4,'will going to win',1,'2023-08-04 14:11:28',1);

INSERT INTO COMMENT VALUES(5,'You Are Right',1,'2023-08-04 14:08:25',1);
INSERT INTO COMMENT VALUES(6,'Yadav is furios',2,'2023-08-04 14:011:51',2);
INSERT INTO COMMENT VALUES(7,'grate compitition',1,'2023-08-04 14:07:25',3);
INSERT INTO COMMENT VALUES(8,'will going to win',1,'2023-08-04 14:18:28',1);

INSERT INTO COMMENT VALUES(9,'You Are Right',1,'2023-09-08 14:08:31',1);
INSERT INTO COMMENT VALUES(10,'Yadav is furios',2,'2023-08-04 14:08:17',2);
INSERT INTO COMMENT VALUES(13,'grate compitition',1,'2023-08-04 14:09:55',3);
INSERT INTO COMMENT VALUES(40,'will going to win',1,'2023-08-04 14:11:42',1);

INSERT INTO COMMENT VALUES(21,'You Are Right',1,'2023-08-04 14:08:47',1);
INSERT INTO COMMENT VALUES(22,'Yadav is furios',2,'2023-08-04 14:48:51',2);
INSERT INTO COMMENT VALUES(23,'grate compitition',1,'2023-08-04 14:59:25',3);
INSERT INTO COMMENT VALUES(24,'will going to win',1,'2023-08-04 14:11:58',1);

INSERT INTO COMMENT VALUES(31,'You Are Right',1,'2023-08-04 14:48:27',1);
INSERT INTO COMMENT VALUES(32,'Yadav is furios',2,'2023-08-04 14:08:51',2);
INSERT INTO COMMENT VALUES(33,'grate compitition',1,'2023-08-04 15:09:25',3);
INSERT INTO COMMENT VALUES(34,'will going to win',1,'2023-08-04 14:31:58',1);

INSERT INTO COMMENT VALUES(41,'You Are Right',1,'2023-08-04 14:58:46',1);
INSERT INTO COMMENT VALUES(42,'Yadav is furios',2,'2023-08-04 14:08:51',2);
INSERT INTO COMMENT VALUES(43,'grate compitition',1,'2023-08-04 14:04:25',3);
INSERT INTO COMMENT VALUES(44,'will going to win',1,'2023-08-04 14:01:28',1);

INSERT INTO COMMENT VALUES(51,'You Are Right',1,'2023-08-04 14:38:47',1);
INSERT INTO COMMENT VALUES(52,'Yadav is furios',2,'2023-08-04 14:15:51',2);
INSERT INTO COMMENT VALUES(53,'grate compitition',1,'2023-08-04 14:35:25',3);
INSERT INTO COMMENT VALUES(54,'will going to win',1,'2023-08-04 16:11:28',1);

INSERT INTO COMMENT VALUES(61,'You Are Right',1,'2023-08-04 14:08:47',1);
INSERT INTO COMMENT VALUES(62,'Yadav is furios',2,'2023-08-04 14:08:38',2);
INSERT INTO COMMENT VALUES(63,'grate compitition',1,'2023-08-04 14:09:25',3);
INSERT INTO COMMENT VALUES(64,'will going to win',1,'2023-08-04 14:33:28',1);

SELECT * FROM comment;
SELECT id,createdts FROM comment;

## Query: Get list of Posts with latest 10 comments of each post authored by 'James Bond'

SELECT a.name,p.name AS post,c.content,c.createdts,c.id AS cid
FROM author a
INNER JOIN post p ON a.id = p.authorid
INNER JOIN comment c ON c.postid=p.authorid 
WHERE a.name = 'James Bond' ORDER BY c.createdts DESC LIMIT 10;







