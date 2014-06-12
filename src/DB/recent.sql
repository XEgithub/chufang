insert into t_booking ( booking_date, booking_index, name, patient_id, case_id, mobile, comment, treat_date) 
	values ('2014-5-16','1','asdfas','000','000','adfasd','asdfasd','2014-5-16');


select * from t_booking;


INSERT INTO  `t_patient` ( `patient_no` , `patient_name` ,`mobile` ,`comment` )
	VALUES (id,'张三','13991312345','没有特别需要注意的。');


insert t_recipe (recipe_no, patient_id, json_id ) values ( '001','1','1' );
insert t_recipe (recipe_no, patient_id, json_id ) values ( '002','1','2' );
insert t_recipe (recipe_no, patient_id, json_id ) values ( '003','1','3' );
insert t_recipe (recipe_no, patient_id, json_id ) values ( '004','1','4' );

INSERT INTO `t_json` (`id`, `json_string`)
VALUES
	(1, '{abc:1111}'),
	(2, '{abc:2222}'),
	(3, '{abc:3333}'),
	(4, '{abc:4444}');


update t_patient set patient_id=id where id='1';

select * from t_patient;

INSERT INTO t_patient (`patient_no`, `patient_name`, `sex`, `age`, `mobile`) VALUES ('12345','张三','男','31','13991907195');

INSERT t_json (json_string) VALUES ('{abc:11111}');	


INSERT INTO t_patient (`patient_no`, `patient_name`, `sex`, `age`, `mobile`)   VALUES    ('12345','张三','男','31','13991907195')

INSERT INTO `t_setting` (`KEY`,`VALUE`) values ('test','123');
INSERT INTO `t_setting` (`KEY`,`VALUE`) values ('test','张三');

show processlist; 
































