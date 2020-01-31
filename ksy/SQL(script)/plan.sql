
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

CREATE SEQUENCE seq_plan_plan_id		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_todo_todo_id		INCREMENT BY 1 START WITH 10000;
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
	start_date		TIMESTAMP,
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


//연습용 PARTY 테이블 생성
DROP TABLE party;
DROP SEQUENCE seq_party_party_id;
CREATE SEQUENCE seq_party_party_id	INCREMENT BY 1 START WITH 10000;

CREATE TABLE party (
	party_id		VARCHAR2(10)	NOT NULL,
	party_user_id	VARCHAR2(10)	NOT NULL,
	party_type		CHAR(1),
	ref_id			VARCHAR2(10),
	party_role		CHAR(1),
	PRIMARY KEY(party_id)
);





//연습용 쿼리

INSERT INTO plan ( plan_id, plan_master_id, plan_title, plan_img, plan_type, plan_reg_date, start_date, plan_status, deleted )
VALUES ( TO_CHAR(seq_plan_plan_id.nextval), 'admin', '첫번째 플랜', NULL, 'A', sysdate, '2020-03-05','R', 'F' );

INSERT INTO plan ( plan_id, plan_master_id, plan_title, plan_img, plan_type, plan_reg_date, start_date, plan_status, deleted )
VALUES ( TO_CHAR(seq_plan_plan_id.nextval), 'admin', '플랜제목없음', NULL, 'B', sysdate, '2020-02-02', 'R', 'F' );

INSERT INTO plan ( plan_id, plan_master_id, plan_title, plan_img, plan_type, plan_reg_date, start_date, plan_status, deleted )
VALUES ( TO_CHAR(seq_plan_plan_id.nextval), 'userrrr', '플랜333', NULL, 'B', sysdate, '2020-10-10', 'R', 'F' );

INSERT INTO plan ( plan_id, plan_master_id, plan_title, plan_img, plan_type, plan_reg_date, start_date, plan_status, deleted )
VALUES ( TO_CHAR(seq_plan_plan_id.nextval), 'sysy', '타임스탬프 플래너', 'no.jpg', 'C', sysdate, '2020-04-10', 'R', 'F' );

commit;

SELECT * FROM plan;


INSERT INTO memo ( plan_id, memo_id, memo_detail, memo_reg_date, memo_reg_user )
VALUES ('10000', TO_CHAR(seq_memo_memo_id.nextval), '첫번째 플랜의 첫번째 메모입니다 메모메모메모메모메모메모', sysdate, 'admin');

INSERT INTO memo ( plan_id, memo_id, memo_detail, memo_reg_date, memo_reg_user )
VALUES ('10001', TO_CHAR(seq_memo_memo_id.nextval), '두번째 플랜 첫번째 메모메메모', sysdate, 'admin');

INSERT INTO memo ( plan_id, memo_id, memo_detail, memo_reg_date, memo_reg_user )
VALUES ('10000', TO_CHAR(seq_memo_memo_id.nextval), '첫번째 플랜 두번째 메모~~~', sysdate, 'user01');

commit;

SELECT * FROM memo;



INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10000', '런던', 1, 3, 'F' );
INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10000', '파리', 2, 2, 'P' );
INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10000', '피렌체', 3, 3, 'E' );

commit;

INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10001', '인터라켄', 1, 3, 'E' );
INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10001', '베니스', 2, 4, 'P' );

commit;


INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10002', '밀라노', 1, 2, 'F' );
INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10002', '취리히', 2, 4, 'F' );

commit;


INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10000', TO_CHAR(seq_todo_todo_id.nextval), '항공권 예약하기', 'T');
INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10000', TO_CHAR(seq_todo_todo_id.nextval), '숙소 예약하기', 'F');
INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10000', TO_CHAR(seq_todo_todo_id.nextval), '맛집 검색해보기', 'F');

INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10001', TO_CHAR(seq_todo_todo_id.nextval), '항공권 예약하기', 'F');
INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10001', TO_CHAR(seq_todo_todo_id.nextval), '숙소 예약하기', 'F');
INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10001', TO_CHAR(seq_todo_todo_id.nextval), '맛집 검색해보기', 'T');

INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10002', TO_CHAR(seq_todo_todo_id.nextval), '항공권 예약하기', 'F');
INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10002', TO_CHAR(seq_todo_todo_id.nextval), '숙소 예약하기', 'T');
INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10002', TO_CHAR(seq_todo_todo_id.nextval), '맛집 검색해보기', 'T');

commit;


INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10000', TO_CHAR(seq_stuff_stuff_id.nextval), '항공권 바우처', 'T' );
INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10000', TO_CHAR(seq_stuff_stuff_id.nextval), '세면도구', 'F' );
INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10000', TO_CHAR(seq_stuff_stuff_id.nextval), '잠옷', 'F' );

INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10001', TO_CHAR(seq_stuff_stuff_id.nextval), '항공권 바우처', 'F' );
INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10001', TO_CHAR(seq_stuff_stuff_id.nextval), '세면도구', 'T' );
INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10001', TO_CHAR(seq_stuff_stuff_id.nextval), '잠옷', 'T' );

INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10002', TO_CHAR(seq_stuff_stuff_id.nextval), '항공권 바우처', 'F' );
INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10002', TO_CHAR(seq_stuff_stuff_id.nextval), '세면도구', 'T' );
INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10002', TO_CHAR(seq_stuff_stuff_id.nextval), '잠옷', 'F' );

commit;



INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10000', TO_CHAR(seq_daily_daily_id.nextval), 'S', '쇼핑인가 뭔가 긴가민가', '1', '10', 100, 'G' );
INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10000', TO_CHAR(seq_daily_daily_id.nextval), 'D', '트라팔가 광장~', '1', '14', 0, 'E' );

INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10001', TO_CHAR(seq_daily_daily_id.nextval), 'F', '맛있는 버거', '1', '13', 50, 'E' );
INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10001', TO_CHAR(seq_daily_daily_id.nextval), 'D', '아무것도 하고싶지 않다', '2', '10', 0, 'E' );
INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10001', TO_CHAR(seq_daily_daily_id.nextval), 'V', '야경 투어', '2', '19', 10, 'E' );
INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10001', TO_CHAR(seq_daily_daily_id.nextval), 'F', '예산등록 안함', '1', '11', NULL, NULL );
INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10001', TO_CHAR(seq_daily_daily_id.nextval), 'E', '기타 일정', '3', '15', 350, 'K' );

commit;



INSERT INTO party ( party_id, party_user_id, party_type, ref_id, party_role )
VALUES ( TO_CHAR(seq_party_party_id.nextval), 'admin', 'P', '10000', 'K' );
INSERT INTO party ( party_id, party_user_id, party_type, ref_id, party_role )
VALUES ( TO_CHAR(seq_party_party_id.nextval), 'user01', 'P', '10000', 'M' );
INSERT INTO party ( party_id, party_user_id, party_type, ref_id, party_role )
VALUES ( TO_CHAR(seq_party_party_id.nextval), 'jisung', 'P', '10000', 'M' );

INSERT INTO party ( party_id, party_user_id, party_type, ref_id, party_role )
VALUES ( TO_CHAR(seq_party_party_id.nextval), 'admin', 'P', '10001', 'K' );

INSERT INTO party ( party_id, party_user_id, party_type, ref_id, party_role )
VALUES ( TO_CHAR(seq_party_party_id.nextval), 'userrrr', 'P', '10002', 'K' );

INSERT INTO party ( party_id, party_user_id, party_type, ref_id, party_role )
VALUES ( TO_CHAR(seq_party_party_id.nextval), 'admin', 'P', '10002', 'M' );

INSERT INTO party ( party_id, party_user_id, party_type, ref_id, party_role )
VALUES ( TO_CHAR(seq_party_party_id.nextval), 'sysy', 'P', '10020', 'K' );
commit;




//테스트용 users 테이블

DROP TABLE userss;

CREATE TABLE userss(
	user_id				VARCHAR2(30)		NOT NULL,  
	pwd					VARCHAR2(20)		NOT NULL,
	email				VARCHAR2(50)		NOT NULL,
	role				CHAR(1)				DEFAULT 'G',
	nickname			VARCHAR2(20)		NOT NULL,
	user_name			VARCHAR2(20)		NOT NULL,
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


INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'admin', '1234', 'admin@a.a', 'A', '관리자', '김서영', '1995-02-10', '010-1111-2222','F', NULL, 3, sysdate, NULL, 'T', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'user01', '1234', 'user01@a.a', 'G', '회원임', '박지성', '1996-02-10', '010-1111-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'jisung', '1234', 'jisung@a.a', 'G', '지성지성', '박지성', '1996-03-10', '010-1333-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'testMember', '1234', 'test@a.a', 'G', '테스트', '테스트멤', '1996-03-10', '010-1333-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'testUser', '1234', 'test@a.a', 'G', '테스트', '테스트멤', '1996-03-10', '010-1333-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'sysy', '1234', 'test@a.a', 'G', '김서영', '김김서영', '1996-03-10', '010-1333-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'userrrr', '1234', 'test@a.a', 'G', '김서영', '김김서영', '1996-03-10', '010-1333-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'test2222', '1234', 'test@a.a', 'G', '테스트', '테스트멤', '1996-03-10', '010-1333-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

commit;


//업데이트 실험용
//UPDATE plan SET plan_title = '타이틀바꾸기', plan_img = 'noImg.jpg', plan_type = 'A', start_date = '2020-04-11' WHERE plan_id = '10000';


//테스트용 Offer 테이블 생성
DROP TABLE offer;

DROP SEQUENCE seq_offer_offer_id;

CREATE SEQUENCE seq_offer_offer_id	INCREMENT BY 1 START WITH 10000;

CREATE TABLE offer(
	offer_id			VARCHAR2(10)		NOT NULL,
	offer_type			CHAR(1),
	ref_id				VARCHAR2(10),
	offer_msg			VARCHAR2(200),
	offer_status		CHAR(1),
	from_user_id		VARCHAR2(30),
	to_user_id			VARCHAR2(30),
	offer_date			TIMESTAMP,
	PRIMARY KEY(offer_id)
);

//실험용
//INSERT INTO offer ( offer_id, offer_type, ref_id, offer_msg, offer_status, from_user_id, to_user_id, offer_date )
//VALUES ( TO_CHAR(seq_offer_offer_id.nextval), 'P', '10001', '두번째 플래너의 킹이 보내는 초대메시지입니다', 'S', 'admin', 'jisung', sysdate );

commit;


//실험용
//INSERT INTO party ( party_id, party_user_id, party_type, ref_id, party_role )
//VALUES ( TO_CHAR(seq_party_party_id.nextval), 'testMember', 'P', '10000', 'M' );
