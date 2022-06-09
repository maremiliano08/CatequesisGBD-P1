/*==============================================================*/
/* Table: ANO_DIOS                                              */
/*==============================================================*/
create table ANO_DIOS (
   ID_ANO               INT4                 not null,
   DESCRIPCION          VARCHAR(40)          null,
   VIGENCIA             VARCHAR(40)          null,
   constraint PK_ANO_DIOS primary key (ID_ANO)
);

/*==============================================================*/
/* Index: ANO_DIOS_PK                                           */
/*==============================================================*/
create unique index ANO_DIOS_PK on ANO_DIOS (
ID_ANO
);

/*==============================================================*/
/* Table: AULA                                                  */
/*==============================================================*/
create table AULA (
   ID_AULA              INT4                 not null,
   ID_NIVEL             INT4                 null,
   NUM_AULA             VARCHAR(10)          null,
   constraint PK_AULA primary key (ID_AULA)
);

/*==============================================================*/
/* Index: AULA_PK                                               */
/*==============================================================*/
create unique index AULA_PK on AULA (
ID_AULA
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on AULA (
ID_NIVEL
);

/*==============================================================*/
/* Table: CATECUMENO                                            */
/*==============================================================*/
create table CATECUMENO (
   ID_CATECU            INT4                 not null,
   ID_REPRESENTANTE     INT4                 null,
   ID_MATRICULA         INT4                 null,
   CI_CATECU            VARCHAR(10)          null,
   NOM_CATECU           VARCHAR(40)          null,
   APLL_CATECU          VARCHAR(40)          null,
   FECHA_NACI_CATECU    VARCHAR(2)           null,
   GENERO_CATECU        VARCHAR(15)          null,
   constraint PK_CATECUMENO primary key (ID_CATECU)
);

/*==============================================================*/
/* Index: CATECUMENO_PK                                         */
/*==============================================================*/
create unique index CATECUMENO_PK on CATECUMENO (
ID_CATECU
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on CATECUMENO (
ID_REPRESENTANTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on CATECUMENO (
ID_MATRICULA
);

/*==============================================================*/
/* Table: CATEQUISTA                                            */
/*==============================================================*/
create table CATEQUISTA (
   ID_CATEQUISTA        INT4                 not null,
   CI_CATEQUISTA        VARCHAR(10)          not null,
   NOM_CATEQUISTA       VARCHAR(30)          not null,
   APLL_CATEQUISTA      VARCHAR(30)          not null,
   FECHA_NACI_CATEQUISTA VARCHAR(2)           not null,
   GENERO_CATEQUISTA    VARCHAR(20)          not null,
   constraint PK_CATEQUISTA primary key (ID_CATEQUISTA)
);

/*==============================================================*/
/* Index: CATEQUISTA_PK                                         */
/*==============================================================*/
create unique index CATEQUISTA_PK on CATEQUISTA (
ID_CATEQUISTA
);

/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
create table MATRICULA (
   ID_MATRICULA         INT4                 not null,
   ID_CATEQUISTA        INT4                 null,
   ID_NIVEL             INT4                 null,
   VALOR_PAGAR          VARCHAR(30)          null,
   FECHA_MATRICULA      DATE                 null,
   FORMA_PAGO           VARCHAR(20)          null,
   PAGO_COMPLETO        VARCHAR(10)          null,
   PAGO_CUOTAS          VARCHAR(30)          null,
   ESTADO_MATRICULA     VARCHAR(40)          null,
   constraint PK_MATRICULA primary key (ID_MATRICULA)
);

/*==============================================================*/
/* Index: MATRICULA_PK                                          */
/*==============================================================*/
create unique index MATRICULA_PK on MATRICULA (
ID_MATRICULA
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on MATRICULA (
ID_CATEQUISTA
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on MATRICULA (
ID_NIVEL
);

/*==============================================================*/
/* Table: NIVEL                                                 */
/*==============================================================*/
create table NIVEL (
   ID_NIVEL             INT4                 not null,
   ID_ANO               INT4                 null,
   FECHA_INICIO         VARCHAR(50)          null,
   FECHA_FIN            VARCHAR(50)          null,
   DESCRIPCION          VARCHAR(40)          null,
   constraint PK_NIVEL primary key (ID_NIVEL)
);

/*==============================================================*/
/* Index: NIVEL_PK                                              */
/*==============================================================*/
create unique index NIVEL_PK on NIVEL (
ID_NIVEL
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on NIVEL (
ID_ANO
);

/*==============================================================*/
/* Table: REPRESENTANTE                                         */
/*==============================================================*/
create table REPRESENTANTE (
   ID_REPRESENTANTE     INT4                 not null,
   CI_REPRESENTANTE     VARCHAR(10)          null,
   NOM_REPRESENTANTE    VARCHAR(30)          null,
   APLL_REPRESENTANTE   VARCHAR(30)          null,
   VINCULO              VARCHAR(40)          null,
   CELULAR_REPRESENTANTE VARCHAR(10)          null,
   FECHA_NACI_REPRESENTANTE VARCHAR(2)           null,
   GENERO_REPRESENTANTE VARCHAR(15)          null,
   constraint PK_REPRESENTANTE primary key (ID_REPRESENTANTE)
);

/*==============================================================*/
/* Index: REPRESENTANTE_PK                                      */
/*==============================================================*/
create unique index REPRESENTANTE_PK on REPRESENTANTE (
ID_REPRESENTANTE
);

alter table AULA
   add constraint FK_AULA_RELATIONS_NIVEL foreign key (ID_NIVEL)
      references NIVEL (ID_NIVEL)
      on delete restrict on update restrict;

alter table CATECUMENO
   add constraint FK_CATECUME_RELATIONS_MATRICUL foreign key (ID_MATRICULA)
      references MATRICULA (ID_MATRICULA)
      on delete restrict on update restrict;

alter table CATECUMENO
   add constraint FK_CATECUME_RELATIONS_REPRESEN foreign key (ID_REPRESENTANTE)
      references REPRESENTANTE (ID_REPRESENTANTE)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_RELATIONS_NIVEL foreign key (ID_NIVEL)
      references NIVEL (ID_NIVEL)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_RELATIONS_CATEQUIS foreign key (ID_CATEQUISTA)
      references CATEQUISTA (ID_CATEQUISTA)
      on delete restrict on update restrict;

alter table NIVEL
   add constraint FK_NIVEL_RELATIONS_ANO_DIOS foreign key (ID_ANO)
      references ANO_DIOS (ID_ANO)
      on delete restrict on update restrict;