

DROP TABLE todo;
DROP TABLE city_route;
DROP TABLE daily;
DROP TABLE stuff;
DROP TABLE memo;
DROP TABLE plan;

DROP SEQUENCE seq_plan_plan_id;
DROP SEQUENCE seq_todo_todo_id;
DROP SEQUENCE seq_city_route_city_id;
DROP SEQUENCE seq_daily_daily_id;
DROP SEQUENCE seq_stuff_stuff_id;
DROP SEQUENCE seq_memo_memo_id;

CREATE SEQUENCE seq_plan_plan_id	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_todo_todo_id	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_city_route_city_id	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_daily_daily_id		INCREMENT BY 1 START WITH 10000;	
CREATE SEQUENCE seq_stuff_stuff_id		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_memo_memo_id		INCREMENT BY 1 START WITH 10000;


CREATE TABLE plan (
	plan_id			VARCHAR2(10)	NOT NULL,
	plan_master_id	VARCHAR2(10)	NOT NULL,	
	plan_title		VARCHAR2(50)	NOT NULL,
	plan_img		VARCHAR2(100),
	plan_type		CHAR(1),
	plan_reg_date	TIMESTAMP,
	plan_status		CHAR(1),
	deleted			CHAR(1),
	PRIMARY KEY(plan_id)
);

CREATE TABLE todo (
	plan_id			VARCHAR2(10)	NOT NULL	REFERENCES plan(plan_id),
	todo_id			VARCHAR2(10)	NOT NULL,
	todo_name		VARCHAR2(50)	NOT NULL,
	todo_check		CHAR(1),
	PRIMARY KEY(todo_id)
);

CREATE TABLE city_route (
	plan_id			VARCHAR2(10)	NOT NULL	REFERENCES plan(plan_id),
	city_id			VARCHAR2(10)	NOT NULL,
	city_name		VARCHAR2(20)	NOT NULL,
	visit_order		NUMBER,
	city_duration	NUMBER,
	tran_type		CHAR(1),
	PRIMARY KEY(city_id)
);

CREATE TABLE daily (
	plan_id			VARCHAR2(10)	NOT NULL	REFERENCES plan(plan_id),
	daily_id		VARCHAR2(10)	NOT NULL,
	daily_cate		CHAR(1),
	daily_detail	VARCHAR2(100),
	day_no			VARCHAR2(10),
	day_time		VARCHAR2(10),
	budget_amount	NUMBER,
	budget_currency	CHAR(1),
	PRIMARY KEY(daily_id)
);

CREATE TABLE stuff (
	plan_id			VARCHAR2(10)	NOT NULL	REFERENCES plan(plan_id),
	stuff_id		VARCHAR2(10)	NOT NULL,
	stuff_name		VARCHAR2(50),
	stuff_check		CHAR(1),
	PRIMARY KEY(stuff_id)
);

CREATE TABLE memo (
	plan_id			VARCHAR2(10)	NOT NULL	REFERENCES plan(plan_id),
	memo_id			VARCHAR2(10)	NOT NULL,
	memo_detail		VARCHAR2(1000),
	memo_reg_date	TIMESTAMP,
	memo_reg_user	VARCHAR2(10),
	PRIMARY KEY(memo_id)
);





//연습용 쿼리

INSERT INTO plan ( plan_id, plan_master_id, plan_title, plan_img, plan_type, plan_reg_date, plan_status, deleted )
VALUES ( TO_CHAR(seq_plan_plan_id.nextval), 'admin', '첫번째 플랜', NULL, 'A', sysdate, 'R', 'F' );

INSERT INTO plan ( plan_id, plan_master_id, plan_title, plan_img, plan_type, plan_reg_date, plan_status, deleted )
VALUES ( TO_CHAR(seq_plan_plan_id.nextval), 'admin', '플랜제목없음', NULL, 'B', sysdate, 'R', 'F' );

commit;

SELECT * FROM plan;


INSERT INTO memo ( plan_id, memo_id, memo_detail, memo_reg_date, memo_reg_user )
VALUES ('10000', TO_CHAR(seq_memo_memo_id.nextval), '첫번째 플랜의 첫번째 메모입니다 메모메모메모메모메모메모', sysdate, 'admin');

INSERT INTO memo ( plan_id, memo_id, memo_detail, memo_reg_date, memo_reg_user )
VALUES ('10001', TO_CHAR(seq_memo_memo_id.nextval), '두번째 플랜 첫번째 메모메메모', sysdate, 'admin');

commit;

SELECT * FROM memo;

