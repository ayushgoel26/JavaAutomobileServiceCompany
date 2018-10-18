--------------------------------------------------------
--  File created - Thursday-October-18-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table EMPLOYEE_AG
--------------------------------------------------------

  CREATE TABLE "TRAINING"."EMPLOYEE_AG" 
   (	"EMPID" NUMBER, 
	"EMPNAME" VARCHAR2(20 BYTE), 
	"EMPPASSWORD" VARCHAR2(10 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "TRAINING" ;
REM INSERTING into TRAINING.EMPLOYEE_AG
SET DEFINE OFF;
Insert into TRAINING.EMPLOYEE_AG (EMPID,EMPNAME,EMPPASSWORD) values (1,'Ayush','ayush');
Insert into TRAINING.EMPLOYEE_AG (EMPID,EMPNAME,EMPPASSWORD) values (2,'Shubham','shubham');
Insert into TRAINING.EMPLOYEE_AG (EMPID,EMPNAME,EMPPASSWORD) values (6,'Sam','sam');
Insert into TRAINING.EMPLOYEE_AG (EMPID,EMPNAME,EMPPASSWORD) values (3,'Shubham','shubham');
Insert into TRAINING.EMPLOYEE_AG (EMPID,EMPNAME,EMPPASSWORD) values (4,'Risheek','hello');
Insert into TRAINING.EMPLOYEE_AG (EMPID,EMPNAME,EMPPASSWORD) values (5,'Prateek','prateek');
--------------------------------------------------------
--  DDL for Index SYS_C0094900
--------------------------------------------------------

  CREATE UNIQUE INDEX "TRAINING"."SYS_C0094900" ON "TRAINING"."EMPLOYEE_AG" ("EMPID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "TRAINING" ;
--------------------------------------------------------
--  Constraints for Table EMPLOYEE_AG
--------------------------------------------------------

  ALTER TABLE "TRAINING"."EMPLOYEE_AG" ADD PRIMARY KEY ("EMPID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "TRAINING"  ENABLE;
