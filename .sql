--------------------------------------------------------
--  File created - Wednesday-April-02-2025   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BONIFICACIONES
--------------------------------------------------------

  CREATE TABLE "SAN"."BONIFICACIONES" 
   (	"EMP_NOMBRE" VARCHAR2(10 BYTE), 
	"EMP_CARGO" VARCHAR2(10 BYTE), 
	"EMP_SALARIO" NUMBER, 
	"EMP_COMISION" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CLIENTES
--------------------------------------------------------

  CREATE TABLE "SAN"."CLIENTES" 
   (	"CLI_ID" NUMBER, 
	"CLI_NOMBRE" VARCHAR2(45 BYTE), 
	"CLI_DIRECCION" VARCHAR2(40 BYTE), 
	"CLI_CIUDAD" VARCHAR2(30 BYTE), 
	"CLI_DEPARTAMENTO" VARCHAR2(20 BYTE), 
	"CLI_TELEFONO" VARCHAR2(11 BYTE), 
	"CLI_CREDITOLIMITE" NUMBER(11,2), 
	"CLI_OBSERVACIONES" VARCHAR2(50 BYTE), 
	"EMP_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DEPARTAMENTOS
--------------------------------------------------------

  CREATE TABLE "SAN"."DEPARTAMENTOS" 
   (	"DEP_ID" NUMBER, 
	"DEP_NOMBRE" VARCHAR2(15 BYTE), 
	"DEP_LOCALIZACION" VARCHAR2(15 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMPLEADOS
--------------------------------------------------------

  CREATE TABLE "SAN"."EMPLEADOS" 
   (	"EMP_ID" NUMBER, 
	"DEP_ID" NUMBER, 
	"EMP_NOMBRE" VARCHAR2(10 BYTE), 
	"EMP_CARGO" VARCHAR2(10 BYTE), 
	"EMP_FECHACONTRATO" DATE, 
	"EMP_SALARIO" NUMBER(11,2), 
	"EMP_COMISION" NUMBER(11,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GRADOSDESALARIO
--------------------------------------------------------

  CREATE TABLE "SAN"."GRADOSDESALARIO" 
   (	"GRA_ID" NUMBER, 
	"GRA_LIMITEINFERIOR" NUMBER, 
	"GRA_LIMITESUPERIOR" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORDENES
--------------------------------------------------------

  CREATE TABLE "SAN"."ORDENES" 
   (	"ORD_ID" NUMBER, 
	"CLI_ID" NUMBER, 
	"ORD_FECHA" DATE, 
	"ORD_PLANCOMISION" VARCHAR2(10 BYTE), 
	"ORD_FECHAENTREGA" DATE, 
	"ORD_TOTAL" NUMBER(11,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRECIOS
--------------------------------------------------------

  CREATE TABLE "SAN"."PRECIOS" 
   (	"PRO_ID" NUMBER, 
	"PRE_FECHAINICIO" DATE, 
	"PRE_FECHAFIN" DATE, 
	"PRE_ESTANDAR" NUMBER(11,2), 
	"PRE_MINIMO" NUMBER(11,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCTOS
--------------------------------------------------------

  CREATE TABLE "SAN"."PRODUCTOS" 
   (	"PRO_ID" NUMBER, 
	"PRO_NOMBRE" VARCHAR2(40 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCTOSPORORDEN
--------------------------------------------------------

  CREATE TABLE "SAN"."PRODUCTOSPORORDEN" 
   (	"PPO_ID" NUMBER, 
	"PRO_ID" NUMBER, 
	"ORD_ID" NUMBER, 
	"PPO_PRECIOACTUAL" NUMBER(11,2), 
	"PPO_CANTIDAD" NUMBER, 
	"PPO_TOTALLINEA" NUMBER(11,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into SAN.BONIFICACIONES
SET DEFINE OFF;
REM INSERTING into SAN.CLIENTES
SET DEFINE OFF;
REM INSERTING into SAN.DEPARTAMENTOS
SET DEFINE OFF;
REM INSERTING into SAN.EMPLEADOS
SET DEFINE OFF;
REM INSERTING into SAN.GRADOSDESALARIO
SET DEFINE OFF;
REM INSERTING into SAN.ORDENES
SET DEFINE OFF;
REM INSERTING into SAN.PRECIOS
SET DEFINE OFF;
REM INSERTING into SAN.PRODUCTOS
SET DEFINE OFF;
REM INSERTING into SAN.PRODUCTOSPORORDEN
SET DEFINE OFF;
--------------------------------------------------------
--  Constraints for Table DEPARTAMENTOS
--------------------------------------------------------

  ALTER TABLE "SAN"."DEPARTAMENTOS" ADD PRIMARY KEY ("DEP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLEADOS
--------------------------------------------------------

  ALTER TABLE "SAN"."EMPLEADOS" ADD PRIMARY KEY ("EMP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCTOSPORORDEN
--------------------------------------------------------

  ALTER TABLE "SAN"."PRODUCTOSPORORDEN" ADD PRIMARY KEY ("PPO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDENES
--------------------------------------------------------

  ALTER TABLE "SAN"."ORDENES" ADD PRIMARY KEY ("ORD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CLIENTES
--------------------------------------------------------

  ALTER TABLE "SAN"."CLIENTES" ADD CHECK (CLI_OBSERVACIONES IN ('Nuevo', 'Antiguo')) ENABLE;
  ALTER TABLE "SAN"."CLIENTES" ADD PRIMARY KEY ("CLI_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCTOS
--------------------------------------------------------

  ALTER TABLE "SAN"."PRODUCTOS" ADD PRIMARY KEY ("PRO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CLIENTES
--------------------------------------------------------

  ALTER TABLE "SAN"."CLIENTES" ADD CONSTRAINT "CLI_EMP_FK" FOREIGN KEY ("EMP_ID")
	  REFERENCES "SAN"."EMPLEADOS" ("EMP_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLEADOS
--------------------------------------------------------

  ALTER TABLE "SAN"."EMPLEADOS" ADD CONSTRAINT "EMP_FK_DEP" FOREIGN KEY ("DEP_ID")
	  REFERENCES "SAN"."DEPARTAMENTOS" ("DEP_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDENES
--------------------------------------------------------

  ALTER TABLE "SAN"."ORDENES" ADD CONSTRAINT "ORD_CLI_FK" FOREIGN KEY ("CLI_ID")
	  REFERENCES "SAN"."CLIENTES" ("CLI_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRECIOS
--------------------------------------------------------

  ALTER TABLE "SAN"."PRECIOS" ADD CONSTRAINT "PRE_PRO_FK" FOREIGN KEY ("PRO_ID")
	  REFERENCES "SAN"."PRODUCTOS" ("PRO_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTOSPORORDEN
--------------------------------------------------------

  ALTER TABLE "SAN"."PRODUCTOSPORORDEN" ADD CONSTRAINT "PPO_PRO_FK" FOREIGN KEY ("PRO_ID")
	  REFERENCES "SAN"."PRODUCTOS" ("PRO_ID") ENABLE;
  ALTER TABLE "SAN"."PRODUCTOSPORORDEN" ADD CONSTRAINT "PPO_ORD_FK" FOREIGN KEY ("ORD_ID")
	  REFERENCES "SAN"."ORDENES" ("ORD_ID") ENABLE;
