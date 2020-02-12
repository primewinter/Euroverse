
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


//������ PARTY ���̺� ����
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





//������ ����

INSERT INTO plan ( plan_id, plan_master_id, plan_title, plan_img, plan_type, plan_reg_date, start_date, plan_status, deleted )
VALUES ( TO_CHAR(seq_plan_plan_id.nextval), 'admin', 'ù��° �÷�', NULL, 'A', sysdate, '2020-03-05','R', 'F' );

INSERT INTO plan ( plan_id, plan_master_id, plan_title, plan_img, plan_type, plan_reg_date, start_date, plan_status, deleted )
VALUES ( TO_CHAR(seq_plan_plan_id.nextval), 'admin', '�÷��������', NULL, 'B', sysdate, '2020-02-02', 'R', 'F' );

INSERT INTO plan ( plan_id, plan_master_id, plan_title, plan_img, plan_type, plan_reg_date, start_date, plan_status, deleted )
VALUES ( TO_CHAR(seq_plan_plan_id.nextval), 'userrrr', '�÷�333', NULL, 'B', sysdate, '2020-10-10', 'R', 'F' );

INSERT INTO plan ( plan_id, plan_master_id, plan_title, plan_img, plan_type, plan_reg_date, start_date, plan_status, deleted )
VALUES ( TO_CHAR(seq_plan_plan_id.nextval), 'sysy', 'Ÿ�ӽ����� �÷���', 'no.jpg', 'C', sysdate, '2020-04-10', 'R', 'F' );

commit;

SELECT * FROM plan;


INSERT INTO memo ( plan_id, memo_id, memo_detail, memo_reg_date, memo_reg_user )
VALUES ('10000', TO_CHAR(seq_memo_memo_id.nextval), 'ù��° �÷��� ù��° �޸��Դϴ� �޸�޸�޸�޸�޸�޸�', sysdate, 'admin');

INSERT INTO memo ( plan_id, memo_id, memo_detail, memo_reg_date, memo_reg_user )
VALUES ('10001', TO_CHAR(seq_memo_memo_id.nextval), '�ι�° �÷� ù��° �޸�޸޸�', sysdate, 'admin');

INSERT INTO memo ( plan_id, memo_id, memo_detail, memo_reg_date, memo_reg_user )
VALUES ('10000', TO_CHAR(seq_memo_memo_id.nextval), 'ù��° �÷� �ι�° �޸�~~~', sysdate, 'user01');

commit;

SELECT * FROM memo;



INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10000', '����', 1, 3, 'F' );
INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10000', '�ĸ�', 2, 2, 'P' );
INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10000', '�Ƿ�ü', 3, 3, 'E' );

commit;

INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10001', '���Ͷ���', 1, 3, 'E' );
INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10001', '���Ͻ�', 2, 4, 'P' );

commit;


INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10002', '�ж��', 1, 2, 'F' );
INSERT INTO city_route ( city_id, plan_id, city_name, visit_order, city_duration, tran_type )
VALUES ( TO_CHAR(seq_city_route_city_id.nextval), '10002', '�븮��', 2, 4, 'F' );

commit;


INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10000', TO_CHAR(seq_todo_todo_id.nextval), '�װ��� �����ϱ�', 'T');
INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10000', TO_CHAR(seq_todo_todo_id.nextval), '���� �����ϱ�', 'F');
INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10000', TO_CHAR(seq_todo_todo_id.nextval), '���� �˻��غ���', 'F');

INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10001', TO_CHAR(seq_todo_todo_id.nextval), '�װ��� �����ϱ�', 'F');
INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10001', TO_CHAR(seq_todo_todo_id.nextval), '���� �����ϱ�', 'F');
INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10001', TO_CHAR(seq_todo_todo_id.nextval), '���� �˻��غ���', 'T');

INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10002', TO_CHAR(seq_todo_todo_id.nextval), '�װ��� �����ϱ�', 'F');
INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10002', TO_CHAR(seq_todo_todo_id.nextval), '���� �����ϱ�', 'T');
INSERT INTO todo ( plan_id, todo_id, todo_name, todo_check )
VALUES ( '10002', TO_CHAR(seq_todo_todo_id.nextval), '���� �˻��غ���', 'T');

commit;


INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10000', TO_CHAR(seq_stuff_stuff_id.nextval), '�װ��� �ٿ�ó', 'T' );
INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10000', TO_CHAR(seq_stuff_stuff_id.nextval), '���鵵��', 'F' );
INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10000', TO_CHAR(seq_stuff_stuff_id.nextval), '���', 'F' );

INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10001', TO_CHAR(seq_stuff_stuff_id.nextval), '�װ��� �ٿ�ó', 'F' );
INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10001', TO_CHAR(seq_stuff_stuff_id.nextval), '���鵵��', 'T' );
INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10001', TO_CHAR(seq_stuff_stuff_id.nextval), '���', 'T' );

INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10002', TO_CHAR(seq_stuff_stuff_id.nextval), '�װ��� �ٿ�ó', 'F' );
INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10002', TO_CHAR(seq_stuff_stuff_id.nextval), '���鵵��', 'T' );
INSERT INTO stuff ( plan_id, stuff_id, stuff_name, stuff_check )
VALUES ( '10002', TO_CHAR(seq_stuff_stuff_id.nextval), '���', 'F' );

commit;



INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10000', TO_CHAR(seq_daily_daily_id.nextval), 'S', '�����ΰ� ���� �䰡�ΰ�', '1', '10', 100, 'G' );
INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10000', TO_CHAR(seq_daily_daily_id.nextval), 'D', 'Ʈ���Ȱ� ����~', '1', '14', 0, 'E' );

INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10001', TO_CHAR(seq_daily_daily_id.nextval), 'F', '���ִ� ����', '1', '13', 50, 'E' );
INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10001', TO_CHAR(seq_daily_daily_id.nextval), 'D', '�ƹ��͵� �ϰ���� �ʴ�', '2', '10', 0, 'E' );
INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10001', TO_CHAR(seq_daily_daily_id.nextval), 'V', '�߰� ����', '2', '19', 10, 'E' );
INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10001', TO_CHAR(seq_daily_daily_id.nextval), 'F', '������ ����', '1', '11', NULL, NULL );
INSERT INTO daily ( plan_id, daily_id, daily_cate, daily_detail, day_no, day_time, budget_amount, budget_currency )
VALUES ( '10001', TO_CHAR(seq_daily_daily_id.nextval), 'E', '��Ÿ ����', '3', '15', 350, 'K' );

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




//�׽�Ʈ�� users ���̺�

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
VALUES ( 'admin', '1234', 'admin@a.a', 'A', '������', '�輭��', '1995-02-10', '010-1111-2222','F', NULL, 3, sysdate, NULL, 'T', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'user01', '1234', 'user01@a.a', 'G', 'ȸ����', '������', '1996-02-10', '010-1111-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'jisung', '1234', 'jisung@a.a', 'G', '��������', '������', '1996-03-10', '010-1333-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'testMember', '1234', 'test@a.a', 'G', '�׽�Ʈ', '�׽�Ʈ��', '1996-03-10', '010-1333-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'testUser', '1234', 'test@a.a', 'G', '�׽�Ʈ', '�׽�Ʈ��', '1996-03-10', '010-1333-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'sysy', '1234', 'test@a.a', 'G', '�輭��', '��輭��', '1996-03-10', '010-1333-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'userrrr', '1234', 'test@a.a', 'G', '�輭��', '��輭��', '1996-03-10', '010-1333-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

INSERT INTO userss ( user_id, pwd, email, role, nickname, user_name, birth, phone, sex, user_img, slot, reg_date, unreg_date, push_agree, total_point )
VALUES ( 'test2222', '1234', 'test@a.a', 'G', '�׽�Ʈ', '�׽�Ʈ��', '1996-03-10', '010-1333-0000','M', NULL, 3, sysdate, NULL, 'F', 0 );

commit;


//������Ʈ �����
//UPDATE plan SET plan_title = 'Ÿ��Ʋ�ٲٱ�', plan_img = 'noImg.jpg', plan_type = 'A', start_date = '2020-04-11' WHERE plan_id = '10000';


//�׽�Ʈ�� Offer ���̺� ����
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

//�����
//INSERT INTO offer ( offer_id, offer_type, ref_id, offer_msg, offer_status, from_user_id, to_user_id, offer_date )
//VALUES ( TO_CHAR(seq_offer_offer_id.nextval), 'P', '10001', '�ι�° �÷����� ŷ�� ������ �ʴ�޽����Դϴ�', 'S', 'admin', 'jisung', sysdate );

commit;


//�����
//INSERT INTO party ( party_id, party_user_id, party_type, ref_id, party_role )
//VALUES ( TO_CHAR(seq_party_party_id.nextval), 'testMember', 'P', '10000', 'M' );










INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�ڱ׷���', 'ũ�ξ�Ƽ��', '��������', 'city_img.jpg', 45.8403496,15.8242479, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '������', 'ü��', '������ ��������~~~', 'city_img.jpg', 50.0598058,14.3255408, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�Ͻ��׸���', '�״�����', '�Ͻ��׸����� �״������� �������� �ִ� �����̴�.', 'city_img.jpg', 52.3547031,4.8339208, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '���', '���⿡', '���⿡ ���� ��� ����(�ϡ)(Region de Bruxelles-Capitale / Brussels Hoofdstedelijk Gewest)�� 19���� ��(�)�� �պ��Ͽ� �̷���� ������ ���� ����� �Ϲ������� ���� ��ü�� ���Ѵ�.', 'brussels.jpg', 50.846624, 4.351143, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '���׳�', '�׸���', ' ���׳׵�������', 'athene.jpg', 37.9908997, 23.7033199, 1  );



INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '����Ȧ��', '������', '����Ȧ���� �������� �������� ��ĭ�𳪺�� �ݵ� �ִ� �����̴�.', 'city_img.jpg', 59.326242,17.8419708, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '������', '�븣����', '�����δ� �븣������ ���� �ؾȿ� �ִ� �����̸�, �� ������ �����̴�.', 'city_img.jpg', 59.8939529,10.6450349, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '���Ű', '�ɶ���', '���Ű�� �ɶ����� �����̴�. �ɶ��� ���� �ɶ��� �� ���ȿ� ��ġ�� �ִ�.', 'city_img.jpg', 60.11021,24.7385061, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '����ļ��ũ', '���̽�����', '����ļ��ũ�� ���̽������� �������� ȸ�ߵ庸�����������̵��� ���� �߽����� �����̴�.', 'city_img.jpg', 64.1452236,-21.9390972, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�����Ͻ�Ÿ��', '���̽�����', '�����Ͻ���Ÿ�𸣴� ���̽����� ���ο� ��ġ�� ���÷�, �α��� 2,257���̴�.', 'city_img.jpg', 65.2623726,-14.4148883, 1  );


INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '��ũ', '�׸�����', '��ũ �Ǵ� ��Ʈȣ���� �׸������� �������� �ִ뵵���̸�, 1979�⿡ ������ �׸������� ��ġ ���ΰ� ��ġ�� �ִ� ���̴�.', 'city_img.jpg', 64.3517529,-45.5152857, 1  );



INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�Ƿ�ü', '��Ż����', '�Ƿ�ü ��������~~~', 'city_img.jpg', 43.7800607,11.170928, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '���Ͻ�', '��Ż����', '���Ͻ� ��������~~~', 'city_img.jpg', 45.4046987,12.2416589, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�θ�', '��Ż����', '�θ� ��������~~~', 'city_img.jpg', 41.9102415,12.3959137, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�ж��', '��Ż����', '�ж�� ��������', 'city_img.jpg', 45.4628329,9.1076924, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '������', '��Ż����', '������ ��������', 'city_img.jpg', 40.8540421,14.1765624, 1  );




INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '���Ͷ���', '������', '���Ͷ����� ������ �����ֿ� ��ġ�� ���÷�, ������ 4.3km��, ���̴� 568m, �α��� 5,429��, �α� �е��� 1,234��/km���̴�. ���� �̸��� ���Ͼ�� "ȣ�� ����"�� ���Ѵ�.', 'city_img.jpg', 46.6845281,7.8403204, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '����', '������', '������ �������� ������̸� ��ǻ� �����̴�. �븮��, ���׹�, ������ �̾� ���������� �� ��°�� ū �����̱⵵ �ϴ�.', 'city_img.jpg', 46.9547658,7.3248302, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�븮��', '������', '�븮���� ���������� ���� ū �������� �븮������ �ֵ��̸�, �������� �߰� ������ �븮�� ȣ�� ���� ���� ��ġ�� �ִ�.', 'city_img.jpg', 47.3775499,8.4666752, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '��ü��', '������', '��������', 'city_img.jpg', 47.0548081,8.2472856, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�׸�����Ʈ', '������', '�׸�����Ʈ�� ������ �����ֿ� ��ġ�� ���÷� ������ 171.08km��, ���̴� 1,034m, �α��� 3,740��, �α� �е��� 22��/km���̴�.', 'city_img.jpg', 46.6197715,7.9707351, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '����ͺ���', '������', '����ͺ��ٴ� ������ �����ֿ� ��ġ�� ���÷�, ������ 164.56km��, ���̴� 795m, �α��� 2,558��, �α� �е��� 16��/km���̴�. ������ ħ������ ���� ������ ���ϰ�� ���� ������ 70�� ���� �Ѵ� ��¥��� ������ ������ �����̴�.', 'city_img.jpg', 46.5533016,7.8367102, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), 'ü����Ʈ', '������', 'ü����Ʈ�� ������ �߷��ֿ� ��ġ�� ���÷� ������ 242.69km��, ���̴� 1,608m, �α��� 5,720��, �α� �е��� 24��/km���̴�.', 'city_img.jpg', 45.9906828,7.6719051, 1  );




INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�����θ�ũ', '����Ʈ����', '��������', 'city_img.jpg', 47.802904,12.9863902, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�ҽ�ŸƮ', '����Ʈ����', '��������', 'city_img.jpg', 47.5345646,13.5405902, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�񿣳�', '����Ʈ����', '��������', 'city_img.jpg', 48.2208286,16.2399766, 1  );



INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�ĸ�', '������', '�������� ��ġ�����������롤�м�����ȭ�� �߽����� �Ӹ� �ƴ϶� ������ ��ȭ �߽�����, ������ ���á���� �Ҹ��� ������ ������� ������ ������ ���á���� �θ���.', 'paris.jpg', 48.856667, 2.350833, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '����', '������', '������ �������� ���÷� ���ֿ� �о��� ������ �߽ɵ����̸�, ���� �ӽþ� ������ ���ι潺 �������� �߽�������.', 'city_img.jpg', 45.7580539,4.7650811, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '��������', '������', '���������� ���������� �� ��°�� ū �����̴�. ���ι潺������Ʈ���㸣 �����˰� �ν��ڷ����� �߽����̱⵵ �ϴ�.', 'city_img.jpg', 43.280555,5.2404125, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�Ͻ�', '������', '�Ͻ��� ������ ������ �׸� ���÷� �������� ������ ���ȿ� ��ġ�� �ִ�. ���������� ����� ���̿� ��ġ�� ������, ���ñ� �α��� �뷫 100�����̴�.', 'city_img.jpg', 43.7032932,7.1827771, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '������', '������', '�������� ������ �����ο� �ִ� �ױ� �����̴�. �������� ��Ű�� �������� �ֵ�����, ���յ����� �ֵ��̴�.', 'city_img.jpg', 44.8638282,-0.6561809, 1  );




INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '���帮��', '������', '���帮��� �������� ������, ������ �߾Ӻο� �ִ�. �α��� �� 300�� �� �̴�.', 'city_img.jpg', 40.4381311,-3.819621, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�����', '������', '����ߴ� �������� �����ο� �ִ� ���÷�, �ȴ޷�þ� ������ ����, ��ȭ, ������ �߽� �����̸� ����� ���� �ֵ��̴�.', 'city_img.jpg', 37.3754865,-6.0250983, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�׶󳪴�', '������', '�׶󳪴ٴ� ������ �ȴ޷�þ� ���濡 ��ġ�� �׶󳪴� ���� �ֵ��̴�.', 'city_img.jpg', 37.1810095,-3.6262912, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�ٸ����γ�', '������', '�ٸ����γ��� �����ο��� �� ��°�� ū ���÷�, ������ ���� ������ ���� �������� ������ ���� �Ƿ��� ��ư� ���������� �ƿ츣�� īŻ��� ������ �߽� �����̴�.', 'city_img.jpg', 41.3948976,2.0787279, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�߷��þ�', '������', '�߷��þƴ� ������ �߷��þ� ���� �ֵ��̴�.', 'city_img.jpg', 39.4079665,-0.5015958, 1  );



INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '����', '����', '������ ��ġ����������ȭ �׸��� ������ �߽����� �Ӹ� �ƴ϶�, ���������� ��ǻ��� �߽ɵ��ô�.', 'london.jpg', 51.507351, -0.127758, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '����Ǯ', '����', '����Ǯ�� �ױ۷��� �ϼ����� ���÷� 2015�� �������� �α��� 478,580 ���̴�. ���� �� ����� ���ʿ� �ڸ���� �ִ�.', 'city_img.jpg', 53.4123001,-3.0561414, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '��ü����', '����', '��ü���ʹ� ������ �����̴�. ����Ǯ ������ �� 50 km, ���� ���� ������ ���� ���� ��ũ ���� �շ����� ��ġ�� �ִ�.', 'city_img.jpg', 53.4723272,-2.2935024, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '���Ӻ긮��', '����', '���Ӻ긮���� ���� �������� ���ʿ� �ִ� ���Ӻ긮�������� �߽� �����̴�.', 'city_img.jpg', 52.1988895,0.0849678, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�����۵�', '����', '�����۵�� �ױ۷��� �����۵�� ���� �߽� �����̴�.', 'city_img.jpg', 51.7505018,-1.3176275, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�������', '����', '��������� ���� �ױ۷��� ������ �̽�Ʈ���Ľ��� ���ܿ� ��ġ�� ������ ������Ͼص�ȣ���� �Ϻ��̴�.', 'city_img.jpg', 50.8374669,-0.1412091, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '����', '����', '������ ���� �ױ۷��� ��Ʈ���� �ױ� �����̴�.', 'city_img.jpg', 51.126333,1.2659699, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�ٽ�', '����', '�ٽ� �Ǵ� �轺�� ���� �ױ۷����� ������ ���ӽ��ֿ� ��ġ�� ���÷�, �������� �������� 156 ų�ι��Ϳ� �긮��Ʋ���� ���������� 21 ų�ι��� ������ ���� �ִ�.', 'city_img.jpg', 51.3801748,-2.3995494, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), 'ī����', '����', 'ī������ ���Ͻ��� �������� ���Ͻ����� ���� ���� �α��� ��� ���÷�, �������� 9��°�� �α��� ���� �����̴�.', 'city_img.jpg', 51.5023268,-3.2750897, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�������', '����', '��������� ����Ʋ������ �����̸�, �۷����� �������� ū ���ô�.', 'city_img.jpg', 55.9412846,-3.2753782, 1  );



INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '����', '����', '������ ���� ���̿������� �ִ� �������� �ֵ����̴�. �� ���ô� ������ �Ϻ��� ���ڸ� ������ ��ġ�Ѵ�.', 'city_img.jpg', 48.1550547,11.4017524, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '����ũǪ��Ʈ', '����', '����ũǪ��Ʈ�ϸ����� ���� �߼��� �켾�ֿ� �ִ� ���÷�, ������ �ٿ��� ����ũǪ��Ʈ��� �Ҹ��⵵ �Ѵ�.', 'city_img.jpg', 50.1213479,8.4964807, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '������', '����', '�������� ������ �����̴�. 2014�� 12�� ���� �α� 3,562,166������, ���� �� ���� �Ը�δ� �ִ��� �����̰� ���� ������ �ִ� �����̱⵵ �ϴ�.', 'city_img.jpg', 52.5069312,13.1445526, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�巹����', '����', '�巹������ ���� ���ο� ��ġ�� �ۼ����� �ֵ��� ���� ������ ��ġ�� �ִ�.', 'city_img.jpg', 51.0769658,13.6325027, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '�븥', '����', '�븥�� ���� �븣Ʈ���κ���Ʈ�ȷ����� ���ô�. ������, �Ժθ�ũ, ��� �̾� ���Ͽ��� ���� ū ���÷� �� �����̼������� ������ �������� ��2�� ���ÿ���.', 'city_img.jpg', 50.9578353,6.8272394, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '����Ʈ��Ʈ', '����', '����Ʈ��Ʈ�� ���� �븣Ʈ���κ���Ʈ�ȷ� ���� �����̴�.', 'city_img.jpg', 51.5080148,7.3301796, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '��������ũ', '����', '��������ũ�� ���� ���̿����ֿ� �ִ� �����̴�. �α��� �� 50�� �� �̻��̸� ���̿��� �ֿ����� ��� �̾� 2��°�� ū �����̴�.', 'city_img.jpg', 49.4362322,10.9929541, 1  );



INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '������', '��������', '�������� ���������� �����̴�. �������� ���� �߽ɵ�������, ������������ ���� ū ���ô�.', 'city_img.jpg', 38.7437396,-9.2302433, 1  );

INSERT INTO city_info ( city_info_id, city_name, country, city_content, city_img, lat, lng, scroll_scale )
VALUES ( TO_CHAR(seq_city_info_city_info_id.nextval), '������', '��������', '������ �� �������� �Ϻ��� �ױ� ���÷� �������� ��2�� �����̴�.', 'city_img.jpg', 41.1622023,-8.6569731, 1  );




