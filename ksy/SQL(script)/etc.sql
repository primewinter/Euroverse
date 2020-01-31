

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
	PRIMARY KEY(user_id,nickname,user_name)
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
/////////////////////////////////////////////////////////////////////////////////오더가 없어서 레퍼런스에 뺏음 밑에꺼로 일단 만들기

CREATE TABLE point(
	user_id				VARCHAR2(30)		REFERENCES users(user_id),
	point_id			VARCHAR2(10)		NOT NULL,
	ref_id				VARCHAR2(10),
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
	reprot_date			TIMESTAMP,
	report_user_id		VARCHAR2(30)		REFERENCES users(user_id),
	PRIMARY KEY(report_id)
);









