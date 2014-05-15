CREATE TABLE t_booking(
    id INT PRIMARY KEY AUTO_INCREMENT,
    booking_date varchar(32) NOT NULL,
    booking_index integer NOT NULL ,
    name VARCHAR(64) NOT NULL ,
    patient_id VARCHAR(64) NOT NULL ,
    case_id VARCHAR(64) NOT NULL ,
    mobile VARCHAR(64) NOT NULL ,
    comment VARCHAR(256) NULL ,
    treat_date DATETIME NOT NULL,
    upload_date TIMESTAMP NULL DEFAULT now()
) DEFAULT CHARSET=utf8;

CREATE UNIQUE INDEX i_booking_date on t_booking(BookingDate);

