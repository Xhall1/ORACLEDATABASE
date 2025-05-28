/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     5/27/2025 10:10:34 PM                        */
/*==============================================================*/


/*==============================================================*/
/* Table: ASIGNACION_ASESOR                                     */
/*==============================================================*/
create table ASIGNACION_ASESOR 
(
   ID_ASIGNACION_ASESOR VARCHAR2(36)         not null,
   ID_DOCENTE           VARCHAR2(36)         not null,
   ID_TRABAJO_GRADO     VARCHAR2(36)         not null,
   TIPO_ASESOR          VARCHAR2(30)         not null,
   ESTADO_ASESORIA      VARCHAR2(30)         not null,
   FECHA_ASIGNACION_ASESOR DATE                 not null,
   constraint PK_ASIGNACION_ASESOR primary key (ID_ASIGNACION_ASESOR)
);

/*==============================================================*/
/* Index: ACTUA_COMO_ASESOR_FK                                  */
/*==============================================================*/
create index ACTUA_COMO_ASESOR_FK on ASIGNACION_ASESOR (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Index: ES_ASESORADO_POR_FK                                   */
/*==============================================================*/
create index ES_ASESORADO_POR_FK on ASIGNACION_ASESOR (
   ID_TRABAJO_GRADO ASC
);

/*==============================================================*/
/* Table: ASIGNACION_JURADO                                     */
/*==============================================================*/
create table ASIGNACION_JURADO 
(
   ID_ASIGNACION_JURADO VARCHAR2(36)         not null,
   ID_TRABAJO_GRADO     VARCHAR2(36)         not null,
   ID_DOCENTE           VARCHAR2(36)         not null,
   FECHA_ASIGNACION_JURADO DATE                 not null,
   ROL_JURADO           VARCHAR2(30)         not null,
   FECHA_CONCEPTO       DATE                 not null,
   CONCEPTO_EMITIDO     VARCHAR2(100)        not null,
   constraint PK_ASIGNACION_JURADO primary key (ID_ASIGNACION_JURADO)
);

/*==============================================================*/
/* Index: ES_EVALUADO_POR_FK                                    */
/*==============================================================*/
create index ES_EVALUADO_POR_FK on ASIGNACION_JURADO (
   ID_TRABAJO_GRADO ASC
);

/*==============================================================*/
/* Index: ACTUA_COMO_JURADO_FK                                  */
/*==============================================================*/
create index ACTUA_COMO_JURADO_FK on ASIGNACION_JURADO (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Table: CONCEJO_FACULTAD                                      */
/*==============================================================*/
create table CONCEJO_FACULTAD 
(
   ID_CONSEJO           VARCHAR2(36)         not null,
   NOMBRE_CONSEJO       VARCHAR2(50)         not null,
   FECHA_SESION_ACTA    DATE                 not null,
   NUMERO_ACTA          VARCHAR2(30)         not null,
   constraint PK_CONCEJO_FACULTAD primary key (ID_CONSEJO)
);

/*==============================================================*/
/* Table: CONVENIO                                              */
/*==============================================================*/
create table CONVENIO 
(
   ID_CONVENIO          VARCHAR2(36)         not null,
   ID_EMPRESA           VARCHAR2(36)         not null,
   ID_PROGRAMA_ACADEMICO VARCHAR2(36)         not null,
   OBJETO_CONVENIO      CLOB                 not null,
   FECHA_FORMALIZACION  DATE                 not null,
   FECHA_INICIO_VIGENCIA DATE                 not null,
   FECHA_FIN_VIGENCIA   DATE                 not null,
   PERSONA_CONTACTO_CONVENIO VARCHAR2(100)        not null,
   DOCUMENTO_CONVENIO_ADJUNTO BLOB                 not null,
   constraint PK_CONVENIO primary key (ID_CONVENIO)
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create index TIENE_FK on CONVENIO (
   ID_EMPRESA ASC
);

/*==============================================================*/
/* Index: PUEDE_TENER_CONVENIO_CON_FK                           */
/*==============================================================*/
create index PUEDE_TENER_CONVENIO_CON_FK on CONVENIO (
   ID_PROGRAMA_ACADEMICO ASC
);

/*==============================================================*/
/* Table: DEC_CONJO_TRBJO_GRA                                   */
/*==============================================================*/
create table DEC_CONJO_TRBJO_GRA 
(
   ID_DECISION          VARCHAR2(36)         not null,
   ID_CONSEJO           VARCHAR2(36)         not null,
   ID_HISTORIAL         VARCHAR2(36),
   ID_CONVENIO          VARCHAR2(36),
   ID_TRABAJO_GRADO     VARCHAR2(36)         not null,
   TIPO_DECISION        VARCHAR2(50)         not null,
   FECHA_DECISION       DATE                 not null,
   DETALLE_DECISION     VARCHAR2(200)        not null,
   constraint PK_DEC_CONJO_TRBJO_GRA primary key (ID_DECISION)
);

/*==============================================================*/
/* Index: EMITE_DECISION_SOBRE_FK                               */
/*==============================================================*/
create index EMITE_DECISION_SOBRE_FK on DEC_CONJO_TRBJO_GRA (
   ID_CONSEJO ASC
);

/*==============================================================*/
/* Index: RECIBE_DECISION_DE_FK                                 */
/*==============================================================*/
create index RECIBE_DECISION_DE_FK on DEC_CONJO_TRBJO_GRA (
   ID_TRABAJO_GRADO ASC
);

/*==============================================================*/
/* Index: PUEDE_SER_CAUSADO_POR_FK                              */
/*==============================================================*/
create index PUEDE_SER_CAUSADO_POR_FK on DEC_CONJO_TRBJO_GRA (
   ID_HISTORIAL ASC
);

/*==============================================================*/
/* Index: PUEDE_SER_FK                                          */
/*==============================================================*/
create index PUEDE_SER_FK on DEC_CONJO_TRBJO_GRA (
   ID_CONVENIO ASC
);

/*==============================================================*/
/* Table: DETALLE_PRACTICA_PROFESIONAL                          */
/*==============================================================*/
create table DETALLE_PRACTICA_PROFESIONAL 
(
   ID_DET_PRACT_PRO     VARCHAR2(36)         not null,
   ID_CONVENIO          VARCHAR2(36)         not null,
   ID_EMPRESA           VARCHAR2(36)         not null,
   ID_TRABAJO_GRADO     VARCHAR2(36)         not null,
   NOMBRE_JEFE_INMEDIATO_PRACTICA VARCHAR2(100)        not null,
   CARGO_JEFE_INMEDIATO_PRACTICA VARCHAR2(100)        not null,
   CONSTANCIA_ARL_ADJUNTA BLOB                 not null,
   FECHA_INICIO_PRACTICA DATE                 not null,
   FECHA_FIN_PRACTICA   DATE                 not null,
   constraint PK_DETALLE_PRACTICA_PROFESIONA primary key (ID_DET_PRACT_PRO)
);

/*==============================================================*/
/* Index: AMPARA_PRACTICA_FK                                    */
/*==============================================================*/
create index AMPARA_PRACTICA_FK on DETALLE_PRACTICA_PROFESIONAL (
   ID_CONVENIO ASC
);

/*==============================================================*/
/* Index: OFRECE_PRACTICA_EN_FK                                 */
/*==============================================================*/
create index OFRECE_PRACTICA_EN_FK on DETALLE_PRACTICA_PROFESIONAL (
   ID_EMPRESA ASC
);

/*==============================================================*/
/* Index: TIENE_UN_FK                                           */
/*==============================================================*/
create index TIENE_UN_FK on DETALLE_PRACTICA_PROFESIONAL (
   ID_TRABAJO_GRADO ASC
);

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
create table DOCENTE 
(
   ID_DOCENTE           VARCHAR2(36)         not null,
   NOMBRES_DOCENTE      VARCHAR2(100)        not null,
   APELLIDOS_DOCENTE    VARCHAR2(100)        not null,
   EMAIL_DOCENTE        VARCHAR2(100)        not null,
   TIPO_VINCULACION     VARCHAR2(100)        not null,
   AREA_ESPECIALIZACION VARCHAR2(100)        not null,
   constraint PK_DOCENTE primary key (ID_DOCENTE)
);

/*==============================================================*/
/* Table: DOC_ADJ_TRBJO_GRA                                     */
/*==============================================================*/
create table DOC_ADJ_TRBJO_GRA 
(
   ID_DOCUMENTO_ADJUNTO VARCHAR2(36)         not null,
   ID_TRABAJO_GRADO     VARCHAR2(36)         not null,
   NOMBRE_DOCUMENTO     VARCHAR2(100)        not null,
   TIPO_DOCUMENTO       VARCHAR2(20)         not null,
   ARCHIVO_ADJUNTO      BLOB                 not null,
   FECHA_CARGA          DATE                 not null,
   DESCRIPCION_DOCUMENTO VARCHAR2(100)        not null,
   constraint PK_DOC_ADJ_TRBJO_GRA primary key (ID_DOCUMENTO_ADJUNTO)
);

/*==============================================================*/
/* Index: TIENE_DOCUMENTOS_FK                                   */
/*==============================================================*/
create index TIENE_DOCUMENTOS_FK on DOC_ADJ_TRBJO_GRA (
   ID_TRABAJO_GRADO ASC
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA 
(
   ID_EMPRESA           VARCHAR2(36)         not null,
   NIT_EMPRESA          VARCHAR2(30)         not null,
   NOMBRE_EMPRESA       VARCHAR2(100)        not null,
   DIRECCION_EMPRESA    VARCHAR2(50)         not null,
   TELEFONO_EMPRESA     VARCHAR2(50)         not null,
   EMAIL_CONTACTO_EMPRESA VARCHAR2(100)        not null,
   constraint PK_EMPRESA primary key (ID_EMPRESA)
);

/*==============================================================*/
/* Table: ESTADO_TRABAJO_GRADO                                  */
/*==============================================================*/
create table ESTADO_TRABAJO_GRADO 
(
   ID_ESTADO_TG         VARCHAR2(36)         not null,
   NOMBRE_ESTADO        VARCHAR2(50)         not null,
   constraint PK_ESTADO_TRABAJO_GRADO primary key (ID_ESTADO_TG)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE 
(
   ID_ESTUDIANTE        VARCHAR2(36)         not null,
   ID_PROGRAMA_ACADEMICO VARCHAR2(36)         not null,
   NOMBRES              VARCHAR2(100)        not null,
   APELLIDOS            VARCHAR2(100)        not null,
   TIPO_DOCUMENTO_IDENTIDAD VARCHAR2(50)         not null,
   NUMERO_DOCUMENTO_IDENTIDAD NUMBER(20)           not null,
   CORREO_INSTITUCIONAL VARCHAR2(100)        not null,
   TELEFONO             VARCHAR2(20)         not null,
   CREDITOS_APROBADOS   NUMBER(5,2)          not null,
   ESTADO_ACADEMICO_GENERAL VARCHAR2(50)         not null,
   constraint PK_ESTUDIANTE primary key (ID_ESTUDIANTE)
);

/*==============================================================*/
/* Index: PERTENECE_A_FK                                        */
/*==============================================================*/
create index PERTENECE_A_FK on ESTUDIANTE (
   ID_PROGRAMA_ACADEMICO ASC
);

/*==============================================================*/
/* Table: EST_TRBJO_GRA                                         */
/*==============================================================*/
create table EST_TRBJO_GRA 
(
   ID_ESTUDIANTE        VARCHAR2(36)         not null,
   ID_TRABAJO_GRADO     VARCHAR2(36)         not null,
   ROL_ESTUDIANTE       VARCHAR2(30)         not null,
   constraint PK_EST_TRBJO_GRA primary key (ID_ESTUDIANTE, ID_TRABAJO_GRADO)
);

/*==============================================================*/
/* Index: ESTUDIANTE_TRABAJO_GRADO2_FK                          */
/*==============================================================*/
create index ESTUDIANTE_TRABAJO_GRADO2_FK on EST_TRBJO_GRA (
   ID_ESTUDIANTE ASC
);

/*==============================================================*/
/* Index: ESTUDIANTE_TRABAJO_GRADO_FK                           */
/*==============================================================*/
create index ESTUDIANTE_TRABAJO_GRADO_FK on EST_TRBJO_GRA (
   ID_TRABAJO_GRADO ASC
);

/*==============================================================*/
/* Table: FACULTAD                                              */
/*==============================================================*/
create table FACULTAD 
(
   ID_FACULTAD          VARCHAR2(36)         not null,
   NOMBRE_FACULTAD      VARCHAR2(100)        not null,
   constraint PK_FACULTAD primary key (ID_FACULTAD)
);

/*==============================================================*/
/* Table: HIST_ESTDO_TRBJO_GRA                                  */
/*==============================================================*/
create table HIST_ESTDO_TRBJO_GRA 
(
   ID_HISTORIAL         VARCHAR2(36)         not null,
   ID_ESTADO_TG         VARCHAR2(36)         not null,
   ID_TRABAJO_GRADO     VARCHAR2(36)         not null,
   FECHA_CAMBIO_ESTADO  DATE                 not null,
   OBSERVACION_CAMBIO   VARCHAR2(100)        not null,
   constraint PK_HIST_ESTDO_TRBJO_GRA primary key (ID_HISTORIAL)
);

/*==============================================================*/
/* Index: REGISTRA_ESTADO_FK                                    */
/*==============================================================*/
create index REGISTRA_ESTADO_FK on HIST_ESTDO_TRBJO_GRA (
   ID_ESTADO_TG ASC
);

/*==============================================================*/
/* Index: TIENE_HISTORIAL_FK                                    */
/*==============================================================*/
create index TIENE_HISTORIAL_FK on HIST_ESTDO_TRBJO_GRA (
   ID_TRABAJO_GRADO ASC
);

/*==============================================================*/
/* Table: OPCION_GRADO                                          */
/*==============================================================*/
create table OPCION_GRADO 
(
   ID_OPCION_GRADO      VARCHAR2(36)         not null,
   NOMBRE_OPCION_GRADO  VARCHAR2(100)        not null,
   DESCRIPCION_OPCION   VARCHAR2(100)        not null,
   DURACION_ESTIMADA_PERIODOS INTEGER              not null,
   constraint PK_OPCION_GRADO primary key (ID_OPCION_GRADO)
);

/*==============================================================*/
/* Table: PROGRAMA_ACADEMICO                                    */
/*==============================================================*/
create table PROGRAMA_ACADEMICO 
(
   ID_PROGRAMA_ACADEMICO VARCHAR2(36)         not null,
   ID_FACULTAD          VARCHAR2(36)         not null,
   NOMBRE_PROGRAMA      VARCHAR2(100)        not null,
   NIVEL_FORMACION      VARCHAR2(100)        not null,
   CODIGO_SNIES         VARCHAR2(100)        not null,
   constraint PK_PROGRAMA_ACADEMICO primary key (ID_PROGRAMA_ACADEMICO)
);

/*==============================================================*/
/* Index: CONTIENE_FK                                           */
/*==============================================================*/
create index CONTIENE_FK on PROGRAMA_ACADEMICO (
   ID_FACULTAD ASC
);

/*==============================================================*/
/* Table: TRABAJO_GRADO                                         */
/*==============================================================*/
create table TRABAJO_GRADO 
(
   ID_TRABAJO_GRADO     VARCHAR2(36)         not null,
   ID_ESTADO_TG         VARCHAR2(36)         not null,
   ID_OPCION_GRADO      VARCHAR2(36)         not null,
   TITULO_GRADO         VARCHAR2(200)        not null,
   FECHA_REGISTRO_PROPUESTA DATE                 not null,
   FECHA_APROBACION_PROPUESTA DATE                 not null,
   FECHA_INICIO_DESARROLLO DATE                 not null,
   FECHA_LIMITE_ENTREGA_ESTIMADA DATE                 not null,
   FECHA_ENTREGA_FINAL  DATE                 not null,
   FECHA_SUSTENTACION   DATE                 not null,
   CALIFICACION_FINAL   NUMBER(5,2)          not null,
   MENCION_HONORIFICA   VARCHAR2(50)         not null,
   OBSERVACIONES_GENERALES CLOB                 not null,
   constraint PK_TRABAJO_GRADO primary key (ID_TRABAJO_GRADO)
);

/*==============================================================*/
/* Index: TIENE_ESTADO_ACTUAL_FK                                */
/*==============================================================*/
create index TIENE_ESTADO_ACTUAL_FK on TRABAJO_GRADO (
   ID_ESTADO_TG ASC
);

/*==============================================================*/
/* Index: ES_UNA_FK                                             */
/*==============================================================*/
create index ES_UNA_FK on TRABAJO_GRADO (
   ID_OPCION_GRADO ASC
);

alter table ASIGNACION_ASESOR
   add constraint FK_ASIGNACI_ACTUA_COM_DOCENTE foreign key (ID_DOCENTE)
      references DOCENTE (ID_DOCENTE);

alter table ASIGNACION_ASESOR
   add constraint FK_ASIGNACI_ES_ASESOR_TRABAJO_ foreign key (ID_TRABAJO_GRADO)
      references TRABAJO_GRADO (ID_TRABAJO_GRADO);

alter table ASIGNACION_JURADO
   add constraint FK_ASIGJUR_DOCENTE_ACTUAJURADO foreign key (ID_DOCENTE)
      references DOCENTE (ID_DOCENTE);

alter table ASIGNACION_JURADO
   add constraint FK_ASIGNACI_ES_EVALUA_TRABAJO_ foreign key (ID_TRABAJO_GRADO)
      references TRABAJO_GRADO (ID_TRABAJO_GRADO);

alter table CONVENIO
   add constraint FK_CONVENIO_PUEDE_TEN_PROGRAMA foreign key (ID_PROGRAMA_ACADEMICO)
      references PROGRAMA_ACADEMICO (ID_PROGRAMA_ACADEMICO);

alter table CONVENIO
   add constraint FK_CONVENIO_TIENE_EMPRESA foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA);

alter table DEC_CONJO_TRBJO_GRA
   add constraint FK_DEC_CONJ_EMITE_DEC_CONCEJO_ foreign key (ID_CONSEJO)
      references CONCEJO_FACULTAD (ID_CONSEJO);

alter table DEC_CONJO_TRBJO_GRA
   add constraint FK_DEC_CONJ_PUEDE_SER_CONVENIO foreign key (ID_CONVENIO)
      references CONVENIO (ID_CONVENIO);

alter table DEC_CONJO_TRBJO_GRA
   add constraint FK_DEC_CONJ_PUEDE_SER_HIST_EST foreign key (ID_HISTORIAL)
      references HIST_ESTDO_TRBJO_GRA (ID_HISTORIAL);

alter table DEC_CONJO_TRBJO_GRA
   add constraint FK_DEC_CONJ_RECIBE_DE_TRABAJO_ foreign key (ID_TRABAJO_GRADO)
      references TRABAJO_GRADO (ID_TRABAJO_GRADO);

alter table DETALLE_PRACTICA_PROFESIONAL
   add constraint FK_DETALLE__AMPARA_PR_CONVENIO foreign key (ID_CONVENIO)
      references CONVENIO (ID_CONVENIO);

alter table DETALLE_PRACTICA_PROFESIONAL
   add constraint FK_DETALLE__OFRECE_PR_EMPRESA foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA);

alter table DETALLE_PRACTICA_PROFESIONAL
   add constraint FK_DETALLE__TIENE_UN_TRABAJO_ foreign key (ID_TRABAJO_GRADO)
      references TRABAJO_GRADO (ID_TRABAJO_GRADO);

alter table DOC_ADJ_TRBJO_GRA
   add constraint FK_DOC_ADJ__TIENE_DOC_TRABAJO_ foreign key (ID_TRABAJO_GRADO)
      references TRABAJO_GRADO (ID_TRABAJO_GRADO);

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_PERTENECE_PROGRAMA foreign key (ID_PROGRAMA_ACADEMICO)
      references PROGRAMA_ACADEMICO (ID_PROGRAMA_ACADEMICO);

alter table EST_TRBJO_GRA
   add constraint FK_EST_TRBJ_EST_TRBJO_TRABAJO_ foreign key (ID_TRABAJO_GRADO)
      references TRABAJO_GRADO (ID_TRABAJO_GRADO);

alter table EST_TRBJO_GRA
   add constraint FK_EST_TRBJ_EST_TRBJO_ESTUDIAN foreign key (ID_ESTUDIANTE)
      references ESTUDIANTE (ID_ESTUDIANTE);

alter table HIST_ESTDO_TRBJO_GRA
   add constraint FK_HIST_EST_REGISTRA__ESTADO_T foreign key (ID_ESTADO_TG)
      references ESTADO_TRABAJO_GRADO (ID_ESTADO_TG);

alter table HIST_ESTDO_TRBJO_GRA
   add constraint FK_HIST_EST_TIENE_HIS_TRABAJO_ foreign key (ID_TRABAJO_GRADO)
      references TRABAJO_GRADO (ID_TRABAJO_GRADO);

alter table PROGRAMA_ACADEMICO
   add constraint FK_PROGRAMA_CONTIENE_FACULTAD foreign key (ID_FACULTAD)
      references FACULTAD (ID_FACULTAD);

alter table TRABAJO_GRADO
   add constraint FK_TRABAJO__ES_UNA_OPCION_G foreign key (ID_OPCION_GRADO)
      references OPCION_GRADO (ID_OPCION_GRADO);

alter table TRABAJO_GRADO
   add constraint FK_TRABAJO__TIENE_EST_ESTADO_T foreign key (ID_ESTADO_TG)
      references ESTADO_TRABAJO_GRADO (ID_ESTADO_TG);


alter table ASIGNACION_ASESOR
   drop constraint FK_ASIGNACI_ACTUA_COM_DOCENTE;

alter table ASIGNACION_ASESOR
   drop constraint FK_ASIGNACI_ES_ASESOR_TRABAJO_;

alter table ASIGNACION_JURADO
   drop constraint FK_ASIGJUR_DOCENTE_ACTUAJURADO;

alter table ASIGNACION_JURADO
   drop constraint FK_ASIGNACI_ES_EVALUA_TRABAJO_;

alter table CONVENIO
   drop constraint FK_CONVENIO_PUEDE_TEN_PROGRAMA;

alter table CONVENIO
   drop constraint FK_CONVENIO_TIENE_EMPRESA;

alter table DEC_CONJO_TRBJO_GRA
   drop constraint FK_DEC_CONJ_EMITE_DEC_CONCEJO_;

alter table DEC_CONJO_TRBJO_GRA
   drop constraint FK_DEC_CONJ_PUEDE_SER_CONVENIO;

alter table DEC_CONJO_TRBJO_GRA
   drop constraint FK_DEC_CONJ_PUEDE_SER_HIST_EST;

alter table DEC_CONJO_TRBJO_GRA
   drop constraint FK_DEC_CONJ_RECIBE_DE_TRABAJO_;

alter table DETALLE_PRACTICA_PROFESIONAL
   drop constraint FK_DETALLE__AMPARA_PR_CONVENIO;

alter table DETALLE_PRACTICA_PROFESIONAL
   drop constraint FK_DETALLE__OFRECE_PR_EMPRESA;

alter table DETALLE_PRACTICA_PROFESIONAL
   drop constraint FK_DETALLE__TIENE_UN_TRABAJO_;

alter table DOC_ADJ_TRBJO_GRA
   drop constraint FK_DOC_ADJ__TIENE_DOC_TRABAJO_;

alter table ESTUDIANTE
   drop constraint FK_ESTUDIAN_PERTENECE_PROGRAMA;

alter table EST_TRBJO_GRA
   drop constraint FK_EST_TRBJ_EST_TRBJO_TRABAJO_;

alter table EST_TRBJO_GRA
   drop constraint FK_EST_TRBJ_EST_TRBJO_ESTUDIAN;

alter table HIST_ESTDO_TRBJO_GRA
   drop constraint FK_HIST_EST_REGISTRA__ESTADO_T;

alter table HIST_ESTDO_TRBJO_GRA
   drop constraint FK_HIST_EST_TIENE_HIS_TRABAJO_;

alter table PROGRAMA_ACADEMICO
   drop constraint FK_PROGRAMA_CONTIENE_FACULTAD;

alter table TRABAJO_GRADO
   drop constraint FK_TRABAJO__ES_UNA_OPCION_G;

alter table TRABAJO_GRADO
   drop constraint FK_TRABAJO__TIENE_EST_ESTADO_T;

drop index ES_ASESORADO_POR_FK;

drop index ACTUA_COMO_ASESOR_FK;

drop table ASIGNACION_ASESOR cascade constraints;

drop index ACTUA_COMO_JURADO_FK;

drop index ES_EVALUADO_POR_FK;

drop table ASIGNACION_JURADO cascade constraints;

drop table CONCEJO_FACULTAD cascade constraints;

drop index PUEDE_TENER_CONVENIO_CON_FK;

drop index TIENE_FK;

drop table CONVENIO cascade constraints;

drop index PUEDE_SER_FK;

drop index PUEDE_SER_CAUSADO_POR_FK;

drop index RECIBE_DECISION_DE_FK;

drop index EMITE_DECISION_SOBRE_FK;

drop table DEC_CONJO_TRBJO_GRA cascade constraints;

drop index TIENE_UN_FK;

drop index OFRECE_PRACTICA_EN_FK;

drop index AMPARA_PRACTICA_FK;

drop table DETALLE_PRACTICA_PROFESIONAL cascade constraints;

drop table DOCENTE cascade constraints;

drop index TIENE_DOCUMENTOS_FK;

drop table DOC_ADJ_TRBJO_GRA cascade constraints;

drop table EMPRESA cascade constraints;

drop table ESTADO_TRABAJO_GRADO cascade constraints;

drop index PERTENECE_A_FK;

drop table ESTUDIANTE cascade constraints;

drop index ESTUDIANTE_TRABAJO_GRADO_FK;

drop index ESTUDIANTE_TRABAJO_GRADO2_FK;

drop table EST_TRBJO_GRA cascade constraints;

drop table FACULTAD cascade constraints;

drop index TIENE_HISTORIAL_FK;

drop index REGISTRA_ESTADO_FK;

drop table HIST_ESTDO_TRBJO_GRA cascade constraints;

drop table OPCION_GRADO cascade constraints;

drop index CONTIENE_FK;

drop table PROGRAMA_ACADEMICO cascade constraints;

drop index ES_UNA_FK;

drop index TIENE_ESTADO_ACTUAL_FK;

drop table TRABAJO_GRADO cascade constraints;