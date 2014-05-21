insert into t_booking ( booking_date, booking_index, name, patient_id, case_id, mobile, comment, treat_date) 
	values ('2014-5-16','1','asdfas','000','000','adfasd','asdfasd','2014-5-16');


select * from t_booking;


insert into  `t_patient` ( `patient_id` , `patient_name` ,`mobile` ,`comment` )
	values (id,'张三','13991312345','没有特别需要注意的。');

update t_patient set patient_id=id where id='1';

select * from t_patient;


































