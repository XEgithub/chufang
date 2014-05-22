CREATE TABLE `t_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_date` varchar(32) NOT NULL,
  `booking_index` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `patient_id` varchar(64) NOT NULL,
  `case_id` varchar(64) NOT NULL,
  `mobile` varchar(64) NOT NULL,
  `comment` varchar(256) DEFAULT NULL,
  `treat_date` datetime NOT NULL,
  `upload_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
CREATE INDEX i_booking_date on t_booking(Booking_date);

CREATE TABLE `t_patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_no` varchar(32) NOT NULL,
  `patient_name` varchar(64) NOT NULL,
  `patient_sex` varchar(16)  NULL,
  `mobile` varchar(32) NOT NULL,
  `old_mobile` varchar(1024) NULL,
  `comment` varchar(256) DEFAULT NULL,
  `json_id` int(11) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
CREATE INDEX i_patient_name on t_patient(patient_name);
CREATE INDEX i_patient_mobile on t_patient(mobile);

CREATE TABLE `t_recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_no` varchar(32) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `patient_name` varchar(64)  NULL,
  `mobile` varchar(32)  NULL,
  `dingxing` varchar(64) DEFAULT NULL,
  `dingbing` varchar(64) DEFAULT NULL,
  `dingzheng` varchar(64) DEFAULT NULL,
  `comment` varchar(256) DEFAULT NULL,
  `suitnum` varchar(32) DEFAULT NULL,
  `json_id` int(11) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

CREATE TABLE `t_recipe_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `medicine` varchar(32) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `unit` varchar(16) NOT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;


CREATE TABLE `t_json` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `json_string` varchar(21000) NOT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

CREATE TABLE `t_json_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `json_string` varchar(21000) NOT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

CREATE TABLE `t_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `binarydata` BLOB ,
  PRIMARY KEY (`id`)
) ;

CREATE TABLE `t_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) not null,
  `value` varchar(64) not null,
  PRIMARY KEY (`id`)
) ;


drop PROCEDURE get_history_recipe;
DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_history_recipe`(
        IN  p_mobileNo VARCHAR(32))
BEGIN
    DECLARE return_value VARCHAR(20000);
    DECLARE err_no  VARCHAR(32);
    DECLARE err_msg VARCHAR(128);
    DECLARE run_flag INT;
    DECLARE new_id INT;
    
    
    DECLARE v_patient_id INT;

    SET return_value = '';
    SET err_no = 'e000000';
    SET err_msg = '';
    SET run_flag = 0;


    IF p_mobileNo IS NULL OR p_mobileNo = '' THEN
        SET  return_value = '{run_result:"run_error", err_msg:"p_mobileNo is null or blank.", return_data:{} }';
            
    ELSE 
        SELECT id INTO v_patient_id FROM t_patient WHERE mobile=p_mobileNo;
            
    END IF;

    IF run_flag = 0 AND v_patient_id IS NOT NULL THEN
        SET return_value = '{run_result:"run_start", return_data:{mobile:XXXXXX} }';  
        SELECT json_id FROM t_recipe WHERE patient_id=v_patient_id ORDER BY id DESC;
    ELSE
        SET return_value = '{run_result:"run_error", return_data:{} }';
        SET run_flag = 2; 
    END IF;

    INSERT INTO t_json_temp (json_string) VALUES(return_value);
    SET new_id=LAST_INSERT_ID();


    SELECT * FROM t_json_temp where id=new_id;


END
//






CREATE PROCEDURE plogin
(
    p_username char(15),
    p_password char(32),
    p_ip char(18),
    p_logintime datetime
)
LABEL_PROC:
BEGIN   
 
    DECLARE v_uid mediumint(8);  
    DECLARE v_realpassword char(32);     
    DECLARE v_nickname varchar(30);    
    DECLARE v_oltime smallint(6);      
   
    SELECT u.uid, u.password, f.nickname, u.oltime INTO v_uid, v_realpassword, v_nickname, v_oltime
    FROM cdb_members u INNER JOIN cdb_memberfields f ON f.uid = u.uid WHERE u.username = p_username;   
   
    IF (v_uid IS NULL) THEN
        SELECT 2 AS ErrorCode;
        LEAVE LABEL_PROC;
    END IF;
 
    IF (p_password <> v_realpassword) THEN
        SELECT 3 AS ErrorCode;
        LEAVE LABEL_PROC;
    END IF;
 
    UPDATE ipsp_userexpands SET lastloginip = p_ip, lastlogintime = p_logintime WHERE uid = v_uid;
 
    SELECT 0 AS ErrorCode, v_uid AS uid, v_nickname AS nickname, v_oltime AS oltime;
 
END LABEL_PROC //















DELIMITER ;
