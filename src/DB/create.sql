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
  `patient_id` int(11) DEFAULT NOT NULL,
  `patient_name` varchar(64) NOT NULL,
  `mobile` varchar(64) NOT NULL,
  `comment` varchar(256) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
CREATE INDEX i_patient_name on t_patient(patient_name);
CREATE INDEX i_patient_mobile on t_patient(mobile);


CREATE TABLE `t_json` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `json_string` varchar(21000) NOT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

CREATE TABLE `t_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `binarydata` BLOB ,
  PRIMARY KEY (`id`)
) ;

