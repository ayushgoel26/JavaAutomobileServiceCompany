--------------------------------------------------------
--  File created - Thursday-October-18-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CAR_AG
--------------------------------------------------------

  CREATE TABLE "TRAINING"."CAR_AG" 
   (	"CUSTID" NUMBER, 
	"CARREGNUM" NUMBER, 
	"CARMAKE" VARCHAR2(20 BYTE), 
	"CARMODEL" VARCHAR2(10 BYTE), 
	"POLICYID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "TRAINING" ;
REM INSERTING into TRAINING.CAR_AG
SET DEFINE OFF;
Insert into TRAINING.CAR_AG (CUSTID,CARREGNUM,CARMAKE,CARMODEL,POLICYID) values (301,402,'Toyota','Etios',201);
Insert into TRAINING.CAR_AG (CUSTID,CARREGNUM,CARMAKE,CARMODEL,POLICYID) values (302,403,'BMW','X1',203);
Insert into TRAINING.CAR_AG (CUSTID,CARREGNUM,CARMAKE,CARMODEL,POLICYID) values (301,401,'Honda','CRV',202);
--------------------------------------------------------
--  DDL for Index SYS_C0094908
--------------------------------------------------------

  CREATE UNIQUE INDEX "TRAINING"."SYS_C0094908" ON "TRAINING"."CAR_AG" ("CARREGNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "TRAINING" ;
--------------------------------------------------------
--  Constraints for Table CAR_AG
--------------------------------------------------------

  ALTER TABLE "TRAINING"."CAR_AG" ADD PRIMARY KEY ("CARREGNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "TRAINING"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CAR_AG
--------------------------------------------------------

  ALTER TABLE "TRAINING"."CAR_AG" ADD FOREIGN KEY ("CUSTID")
	  REFERENCES "TRAINING"."CUSTOMER_SERVICING_AG" ("CUSTID") ENABLE;
 
  ALTER TABLE "TRAINING"."CAR_AG" ADD FOREIGN KEY ("POLICYID")
	  REFERENCES "TRAINING"."POLICY_AG" ("POLICYID") ENABLE;
