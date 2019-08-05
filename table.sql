create database quest_in_jeju;
use quest_in_jeju;


#고객 Table
drop table cutomer;
create table customer(
	customer_phone varchar2(11) not null,
	customer_addr_front varchar2(40) not null,
	customer_addr_detail varchar2(45) not null,
);
alter table customer add constraint customer_phone_pk primary key (customer_phone);


#고객신청 Table
drop table customer_apply;
create table customer_apply(
	serialNo varchar2(8) not null,
	customer_phone varchar2(11) not null,
	customer_addr_front varchar2(40) not null,
	customer_addr_detail varchar2(45) not null,
	bag_num number not null,
	trash_type number not null,
	wanted_time varchar2(50) not null,
	last_time number not null,
	price number not null,
	card_num varchar2(20) not null,
	helperID varchar2(25),
	customer_apply_day date not null 
); 
alter table customer_apply add constraint customer_apply_pk primary key (serialNo);
alter table customer_apply add constraint customer_apply_customer_phone_fk foreign key references customer (customer_phone);
alter table customer_apply add constraint customer_apply_helperID_fk foreign key references helper (helperID);

drop sequence customer_apply_seq;
create sequence customer_apply_seq start with 1 increment by 1;


#대행 Table
drop table helper;
create table helper(
	helperID varchar2(25),
	helper_photo_ofn varchar2(100) not null,
	helper_photo_fsn varchar2(100) not null,
	helper_phone varchar2(11) not null,
	helper_name varchar2(25) not null,
	sex varchar2(3) not null,
	bank_name varchar2(18) not null,
	account varchar2(20) not null,
	account_holder varchar2(25) not null,
	wish_addr_front1 varchar2(40) not null,
	wish_addr_detail1 varchar2(45) not null,
	wish_addr_front2 varchar2(40),
	wish_addr_detail2 varchar2(45),
	wish_addr_front3 varchar2(40),
	wish_addr_detail3 varchar2(45),
	want_to_say varchar2(300)
);
alter table helper add constraint helper_id_pk primary key (helperID);


#제안 수락 Table
drop table matching;
create table matching(
	serialNo varchar2(8) not null,
	helperID varchar2(25),
	suggestion number(1) not null check (test in (0,1)),
	acceptance number(1) not null check (test in (0,1))
);
alter table matching add constraint matching_pk primary key (serialNo, helperID );
alter table matching add constraint matching_serialNo_fk foreign key references customer_apply (serialNo);
alter table matching add constraint matching_helperID_fk foreign key references helper (helperID);


#후기 Table
drop table review;
create table review(
	serialNo int not null,	
	helperID varchar2(25) not null,
	review_title varchar2(60) not null, 
	rating number(5,1) not null, 
	clean_place_addr_front varchar2(95),
	review_content varchar2(900), 
	review_day date not null 
);
#review_pwd varchar2(12) not null,
alter table review add constraint review_pk primary key (serialNo);
alter table review add constraint review_matching_fk foreign key (serialNo, helperID ) references matching ((serialNo, helperID ));

insert into review values (serialNo.nextval,'minsu1234','test title','helperPW',3.4,'jeju','nice to meet you',to_date(sysdate,'yyyy-mm-dd'));

#인증 Table
drop table certify;
create table certify(
	serialNo varchar2(8) not null, 
	helperID varchar2(25) not null, 
	details varchar2(300) not null,
	housePlace varchar2(80) not null,
	certify_photo_ofn varchar2(100) not null,
	certify_photo_fsn varchar2(100) not null,
	certify_day date not null 
);
alter table review add constraint certify_pk primary key (serialNo);
alter table review add constraint review_matching_fk foreign key (serialNo, helperID ) references matching ((serialNo, helperID ));




#지도 Table
drop table map;
create table map(
	mapNo number not null,
	map_addr_front varchar2(80) not null,
	map_addr_detail varchar2(80)
);
alter table renting add constraint map_no_pk  primary key ( mapNo);

drop sequence map_no_seq;
create sequence map_no_seq start with 1 increment by 1 maxvalue 10000 minvalue 1 nocycle;


insert into map values (map_no_seq .NEXTVAL,'이도이동 1955-4','한마음병원 남측 탐나마트 인근(이도이동 1955-4인근)');
insert into map values (map_no_seq .NEXTVAL,'신설로9길 2-2','한마을병원서쪽 굿모닝케어 인근(무료주차장)');
insert into map values (map_no_seq .NEXTVAL,'신설동길 66 ','신설동길 66 (연북로 동측(신설동로 교차지점)');
insert into map values (map_no_seq .NEXTVAL,'오복2길 27','오복2길 27(이도2동950-1장미2차A맞은편)');
insert into map values (map_no_seq .NEXTVAL,'남광북3길 18-15','남광북3길 18-15(경원빌라 맞은편 공원 동측)');
insert into map values (map_no_seq .NEXTVAL,'이도이동 1064','일출마트 서측 도로상');
insert into map values (map_no_seq .NEXTVAL,'이도이동 1993-1','이도이동 1993-1(남광초등학교 서측 주차장)');
insert into map values (map_no_seq .NEXTVAL,'남광로2길 7','남광로2길 7(이도2동 1992-7소방서 사거리 LPG충전소 동남측)');
insert into map values (map_no_seq .NEXTVAL,'이도2동 1986-5','이도2동 1986-5(21세기 병원 동측 공영주차장 84번 옆)');
insert into map values (map_no_seq .NEXTVAL,'남광로 2길 49-27','남광로 2길 49-27(탐라중학교 서측 옛 황금갈비 무료주차장 옆)');
insert into map values (map_no_seq .NEXTVAL,'남광로4길 33','남광로4길 33(중앙여고 동쪽 주차장)');
insert into map values (map_no_seq .NEXTVAL,'신설로 16 ','신설로 16 (한마음공원 서측 인도변)');
insert into map values (map_no_seq .NEXTVAL,'신설로2길 9 ','신설로2길 9 (혜성무지개 타운 맞은편 무료주차장)');
insert into map values (map_no_seq .NEXTVAL,'신설로6길 2-11','신설로6길 2-11(이도농협 동측 주차장)');
insert into map values (map_no_seq .NEXTVAL,'구남로6길55-1 ','구남로6길55-1 (광명광고 북측 주차장)');
insert into map values (map_no_seq .NEXTVAL,'구남동 6길 31','구남동 6길 31 이도어린이집 인근 공원 앞');
