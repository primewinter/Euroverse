


DROP TABLE users;
DROP TABLE point;
DROP TABLE trip_survey;
DROP TABLE offer;
DROP TABLE report;

DROP SEQUENCE seq_point_point_id;
DROP SEQUENCE seq_trip_survey_survey_id;
DROP SEQUENCE seq_offer_offer_id;
DROP SEQUENCE seq_report_report_id;

CREATE SEQUENCE seq_point_point_id	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_trip_survey_survey_id		INCREMENT BY 1 START WITH 10000;	
CREATE SEQUENCE seq_offer_offer_id		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_report_report_id	INCREMENT BY 1 START WITH 10000;


CREATE TABLE users(
	user_id				VARCHAR2(30)		NOT NULL,  
	pwd					VARCHAR2(20)		NOT NULL,
	email				VARCHAR2(50)		NOT NULL,
	role				CHAR(1)				DEFAULT 'g',
	nickname			VARCHAR2(20)		NOT NULL,
	user_name			VARCHAR2(20)		NOT NULL UNIQUE,
	birth				VARCHAR2(10),		
	phone				VARCHAR2(20),
	sex					CHAR(1),
	user_img			VARCHAR2(200),
	slot				NUMBER,
	reg_date			TIMESTAMP,
	unreg_date			TIMESTAMP,
	push_agree			CHAR(1),
	total_point			NUMBER,
	PRIMARY KEY(user_id)
);


////////////////////////////////////////////////////////////////////////////////
CREATE TABLE point(
	user_id				VARCHAR2(30)		REFERENCES users(user_id),
	point_id			VARCHAR2(10)		NOT NULL,
	ref_id				VARCHAR2(10)		REFERENCES order(order_id),
	used_type			CHAR(1),
	used_point			NUMBER,
	used_date			TIMESTAMP,
	PRIMARY KEY(point_id)
);


CREATE TABLE trip_survey(
	user_id				VARCHAR2(30)		REFERENCES users(user_id),
	survey_id			VARCHAR2(20)		NOT NULL,
	survey_type			CHAR(1),
	survey_choice		VARCHAR2(50),
	PRIMARY KEY(survey_id)
);


CREATE TABLE offer(
	offer_id			VARCHAR2(10)		NOT NULL,
	offer_type			CHAR(1),
	ref_id				VARCHAR2(10),
	offer_msg			VARCHAR2(200),
	offer_status		CHAR(1),
	from_user_id		VARCHAR2(30)		REFERENCES users(user_id),
	to_user_id			VARCHAR2(30)		REFERENCES users(user_id),
	offer_date			TIMESTAMP,
	PRIMARY KEY(offer_id)
);




CREATE TABLE report(
	report_id			VARCHAR2(10)		NOT NULL,
	report_target		CHAR(1),
	ref_id				VARCHAR2(10),
	report_reason 		CHAR(1),
	report_content		VARCHAR2(300),
	report_date			TIMESTAMP,
	report_user_id		VARCHAR2(30)		REFERENCES users(user_id),
	PRIMARY KEY(report_id)
);


INSERT INTO USERS
( user_id , user_name , nickname , pwd , role , email , phone , user_img , sex , birth , slot , total_point , push_agree , reg_date) 
VALUES('admin' , '°ü¸®ÀÚ' , '¾È³ç¾È³ç' , '000000' , 'A' , 'te@te.com' , '010-1234-4577' , '' , 'F' , '1999-09-09' , 3 , 500, 'T' , systimestamp);


INSERT INTO USERS
( user_id , user_name , nickname , pwd , role , email , phone , user_img , sex , birth , slot , total_point , push_agree , reg_date) 
VALUES('user01' , 'À¯Àú01' , '¾È³ç¾È³ç' , '000000' , 'G' , 'te@te.com' , '010-1234-4577' , '' , 'F' , '1999-09-09' , 3 , 500, 'T' , systimestamp);

INSERT INTO USERS
( user_id , user_name , nickname , pwd , role , email , phone , user_img , sex , birth , slot , total_point , push_agree , reg_date) 
VALUES('user02' , 'À¯Àú02' , '¾È³ç¾È³ç' , '000000' , 'G' , 'te@te.com' , '010-1234-4577' , '' , 'F' , '1999-09-09' , 3 , 500, 'T' , systimestamp);

INSERT INTO USERS
( user_id , user_name , nickname , pwd , role , email , phone , user_img , sex , birth , slot , total_point , push_agree , reg_date) 
VALUES('user03' , 'À¯Àú03' , '¾È³ç¾È³ç' , '000000' , 'G' , 'te@te.com' , '010-1234-4577' , '' , 'F' , '1999-09-09' , 3 , 500, 'T' , systimestamp);

INSERT INTO USERS
( user_id , user_name , nickname , pwd , role , email , phone , user_img , sex , birth , slot , total_point , push_agree , reg_date) 
VALUES('user04' , 'À¯Àú04' , '¾È³ç¾È³ç' , '000000' , 'G' , 'te@te.com' , '010-1234-4577' , '' , 'F' , '1999-09-09' , 3 , 500, 'T' , systimestamp);

INSERT INTO USERS
( user_id , user_name , nickname , pwd , role , email , phone , user_img , sex , birth , slot , total_point , push_agree , reg_date) 
VALUES('user05' , 'À¯Àú05' , '¾È³ç¾È³ç' , '000000' , 'G' , 'te@te.com' , '010-1234-4577' , '' , 'F' , '1999-09-09' , 3 , 500, 'T' , systimestamp);








