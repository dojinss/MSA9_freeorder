DROP TABLE IF EXISTS `PAYMENTS`;

CREATE TABLE `PAYMENTS` (
	`ID`				CHAR(50)  		PRIMARY KEY    	NOT NULL,
	`ORDERS_ID`			CHAR(50)			NOT NULL,
	`PAYMENT_METHOD`	VARCHAR(100)	NULL,
	`STATUS`			ENUM('PENDING','PAID','REFUND')		NOT NULL	DEFAULT 'PENDING'	COMMENT '결제대기, 결제완료, 환불',
	`PAID_AT`			TIMESTAMP		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`CREATED_AT`		TIMESTAMP		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`UPDATED_AT`		TIMESTAMP		NOT NULL	DEFAULT CURRENT_TIMESTAMP
);