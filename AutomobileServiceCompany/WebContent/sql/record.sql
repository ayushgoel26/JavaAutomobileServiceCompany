--------------------------------------------------------
--  File created - Thursday-October-18-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table RECORDS_AG
--------------------------------------------------------

  CREATE TABLE "TRAINING"."RECORDS_AG" 
   (	"CARREGNUM" NUMBER, 
	"SERVICEID" NUMBER, 
	"RECORDDATE" DATE, 
	"DELIVERYDATE" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "TRAINING" ;
REM INSERTING into TRAINING.RECORDS_AG
SET DEFINE OFF;
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (403,101,to_date('17-OCT-18','DD-MON-RR'),null);
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (401,101,to_date('17-OCT-18','DD-MON-RR'),null);
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (403,102,to_date('17-OCT-18','DD-MON-RR'),null);
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (402,101,to_date('18-OCT-18','DD-MON-RR'),null);
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (401,102,to_date('18-OCT-18','DD-MON-RR'),to_date('21-OCT-18','DD-MON-RR'));
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (402,101,to_date('18-OCT-18','DD-MON-RR'),null);
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (402,101,to_date('11-OCT-18','DD-MON-RR'),null);
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (402,102,to_date('16-OCT-18','DD-MON-RR'),null);
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (403,102,to_date('18-OCT-18','DD-MON-RR'),to_date('21-OCT-18','DD-MON-RR'));
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (403,103,to_date('18-OCT-18','DD-MON-RR'),to_date('21-OCT-18','DD-MON-RR'));
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (403,101,to_date('18-OCT-18','DD-MON-RR'),to_date('21-OCT-18','DD-MON-RR'));
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (401,102,to_date('16-OCT-18','DD-MON-RR'),null);
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (402,101,to_date('17-OCT-18','DD-MON-RR'),null);
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (402,102,to_date('17-OCT-18','DD-MON-RR'),null);
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (402,101,to_date('18-OCT-18','DD-MON-RR'),null);
Insert into TRAINING.RECORDS_AG (CARREGNUM,SERVICEID,RECORDDATE,DELIVERYDATE) values (402,102,to_date('18-OCT-18','DD-MON-RR'),null);
--------------------------------------------------------
--  Ref Constraints for Table RECORDS_AG
--------------------------------------------------------

  ALTER TABLE "TRAINING"."RECORDS_AG" ADD FOREIGN KEY ("SERVICEID")
	  REFERENCES "TRAINING"."SERVICES_AG" ("SERVICEID") ENABLE;
 
  ALTER TABLE "TRAINING"."RECORDS_AG" ADD FOREIGN KEY ("CARREGNUM")
	  REFERENCES "TRAINING"."CAR_AG" ("CARREGNUM") ENABLE;
