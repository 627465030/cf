prompt PL/SQL Developer import file
prompt Created on 2018��2��28�� by cf
set feedback off
set define off
prompt Dropping SYS_DIC_BUSINESS...
drop table SYS_DIC_BUSINESS cascade constraints;
prompt Dropping SYS_DIC_CFG...
drop table SYS_DIC_CFG cascade constraints;
prompt Dropping SYS_LOG...
drop table SYS_LOG cascade constraints;
prompt Dropping SYS_MENU...
drop table SYS_MENU cascade constraints;
prompt Dropping SYS_ROLE...
drop table SYS_ROLE cascade constraints;
prompt Dropping SYS_ROLE_MENU...
drop table SYS_ROLE_MENU cascade constraints;
prompt Dropping SYS_ROLE_USER...
drop table SYS_ROLE_USER cascade constraints;
prompt Dropping SYS_USER...
drop table SYS_USER cascade constraints;
prompt Creating SYS_DIC_BUSINESS...
create table SYS_DIC_BUSINESS
(
  DICNO      VARCHAR2(18),
  DICNAME    VARCHAR2(50),
  DICCODE    VARCHAR2(20),
  DICITEM    VARCHAR2(150),
  PID        VARCHAR2(20),
  DICSPY     VARCHAR2(80),
  ORDERID    NUMBER(4),
  ISVALID    NUMBER(1),
  ISMODIFY   NUMBER(1),
  MEMO       VARCHAR2(512),
  CREATEUSER VARCHAR2(18),
  CREATETIME VARCHAR2(14),
  MODIFYUSER VARCHAR2(18),
  MODIFYTIME VARCHAR2(14),
  CREATEORG  VARCHAR2(20),
  MODIFYORG  VARCHAR2(20),
  OLDCODE    VARCHAR2(20),
  DEL_FLAG   VARCHAR2(2) default '0',
  YN_ENABLE  VARCHAR2(2) default '1' not null,
  ORG_ID     VARCHAR2(32)
)
tablespace CF_BASE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column SYS_DIC_BUSINESS.DEL_FLAG
  is 'ɾ�����';
comment on column SYS_DIC_BUSINESS.YN_ENABLE
  is '����״̬0������ 1 ���� ';
comment on column SYS_DIC_BUSINESS.ORG_ID
  is '������֯';

prompt Creating SYS_DIC_CFG...
create table SYS_DIC_CFG
(
  DIC_NO       VARCHAR2(32),
  DIC_ID       VARCHAR2(32),
  DIC_ID_NAME  VARCHAR2(128),
  DIC_PID      VARCHAR2(32),
  DIC_SPELL    VARCHAR2(80),
  DIC_NO_NAME  VARCHAR2(128),
  SORT_ID      VARCHAR2(4),
  OWN_DESC     VARCHAR2(256),
  CREATE_USER  VARCHAR2(32),
  CREATE_TIME  VARCHAR2(14),
  UPDATE_USER  VARCHAR2(32),
  UPDATE_TIME  VARCHAR2(14),
  CREATAE_DEPT VARCHAR2(18),
  UPDATE_DEPT  VARCHAR2(18),
  DEL_FLAG     VARCHAR2(2) default '0',
  YN_ENABLE    VARCHAR2(2) default '1',
  GROUP_ID     VARCHAR2(32),
  MEMO         VARCHAR2(512)
)
tablespace CF_BASE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SYS_DIC_CFG
  is 'ϵͳ�ֵ���';
comment on column SYS_DIC_CFG.DIC_NO
  is '����';
comment on column SYS_DIC_CFG.DIC_ID
  is '�������';
comment on column SYS_DIC_CFG.DIC_ID_NAME
  is '��������';
comment on column SYS_DIC_CFG.DIC_PID
  is '���ڵ�';
comment on column SYS_DIC_CFG.DIC_SPELL
  is '����ƴ��';
comment on column SYS_DIC_CFG.DIC_NO_NAME
  is '��������';
comment on column SYS_DIC_CFG.SORT_ID
  is '����';
comment on column SYS_DIC_CFG.OWN_DESC
  is '����˵��';
comment on column SYS_DIC_CFG.CREATE_USER
  is '������';
comment on column SYS_DIC_CFG.CREATE_TIME
  is '����ʱ��';
comment on column SYS_DIC_CFG.UPDATE_USER
  is '�޸���';
comment on column SYS_DIC_CFG.UPDATE_TIME
  is '�޸�ʱ��';
comment on column SYS_DIC_CFG.CREATAE_DEPT
  is '��������';
comment on column SYS_DIC_CFG.UPDATE_DEPT
  is '�޸Ĳ���';
comment on column SYS_DIC_CFG.DEL_FLAG
  is 'ɾ�����';
comment on column SYS_DIC_CFG.YN_ENABLE
  is '0��������1������';
comment on column SYS_DIC_CFG.GROUP_ID
  is '������֯';
comment on column SYS_DIC_CFG.MEMO
  is '��ע';

prompt Creating SYS_LOG...
create table SYS_LOG
(
  ID          VARCHAR2(32) not null,
  USER_NAME   VARCHAR2(50),
  HOSTNAME    VARCHAR2(100),
  LOG_TIME    VARCHAR2(14),
  VISIT_IP    VARCHAR2(50),
  VISIT_MAC   VARCHAR2(50),
  TYPE        VARCHAR2(2) default '1',
  LOGIN_TYPE  VARCHAR2(2),
  OPT_TYPE    VARCHAR2(2),
  LOGIN_NAME  VARCHAR2(20),
  OPT_TABLE   VARCHAR2(100),
  OPT_CONTENT VARCHAR2(1024),
  MEMO        VARCHAR2(512)
)
tablespace CF_BASE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SYS_LOG
  is 'ϵͳ��־';
comment on column SYS_LOG.ID
  is '��־����';
comment on column SYS_LOG.USER_NAME
  is '�û�����';
comment on column SYS_LOG.HOSTNAME
  is '����������';
comment on column SYS_LOG.LOG_TIME
  is '��־����ʱ��';
comment on column SYS_LOG.VISIT_IP
  is '����IP';
comment on column SYS_LOG.VISIT_MAC
  is '����MAC';
comment on column SYS_LOG.TYPE
  is '1����¼��Ϣ
2��������Ϣ';
comment on column SYS_LOG.LOGIN_TYPE
  is '1����¼
2���ǳ�';
comment on column SYS_LOG.OPT_TYPE
  is '1������
2���޸�
3��ɾ��
4����ѯ';
comment on column SYS_LOG.LOGIN_NAME
  is '��¼��';
comment on column SYS_LOG.OPT_TABLE
  is '��������';
comment on column SYS_LOG.OPT_CONTENT
  is '��������';
comment on column SYS_LOG.MEMO
  is '��ע';
alter table SYS_LOG
  add constraint PK_SYS_LOG primary key (ID)
  using index 
  tablespace CF_BASE_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SYS_MENU...
create table SYS_MENU
(
  ID           VARCHAR2(32) not null,
  MENU_NAME    VARCHAR2(100) not null,
  PID          VARCHAR2(32) default '-1',
  MENU_URL     VARCHAR2(200),
  MENU_TYPE    VARCHAR2(2),
  MENU_FUN     VARCHAR2(120),
  DEV_MODE     VARCHAR2(2),
  MENU_LEV     VARCHAR2(2),
  SORT_ID      VARCHAR2(4),
  ICON         VARCHAR2(200),
  CREATE_USER  VARCHAR2(32),
  CREATE_TIME  VARCHAR2(14),
  UPDATE_USER  VARCHAR2(32),
  UPDATE_TIME  VARCHAR2(14),
  CREATAE_DEPT VARCHAR2(18),
  UPDATE_DEPT  VARCHAR2(18),
  DEL_FLAG     VARCHAR2(2) default '0',
  YN_ENABLE    VARCHAR2(2) default '1',
  GROUP_ID     VARCHAR2(32),
  MEMO         VARCHAR2(512)
)
tablespace CF_BASE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SYS_MENU
  is 'ϵͳ�˵�';
comment on column SYS_MENU.MENU_NAME
  is '�˵���';
comment on column SYS_MENU.PID
  is '���˵�';
comment on column SYS_MENU.MENU_URL
  is '���ʵ�ַ';
comment on column SYS_MENU.MENU_TYPE
  is '1����ͨ�˵�2�����ܰ�ť3���ⲿ����';
comment on column SYS_MENU.MENU_FUN
  is 'Ψһȫ�ֹ�����';
comment on column SYS_MENU.DEV_MODE
  is '1��IFRAMEģʽ 2����ҳ��ܹ�';
comment on column SYS_MENU.MENU_LEV
  is '�㼶';
comment on column SYS_MENU.SORT_ID
  is '����';
comment on column SYS_MENU.ICON
  is 'ͼ���ַ';
comment on column SYS_MENU.CREATE_USER
  is '������';
comment on column SYS_MENU.CREATE_TIME
  is '����ʱ��';
comment on column SYS_MENU.UPDATE_USER
  is '�޸���';
comment on column SYS_MENU.UPDATE_TIME
  is '�޸�ʱ��';
comment on column SYS_MENU.CREATAE_DEPT
  is '��������';
comment on column SYS_MENU.UPDATE_DEPT
  is '�޸Ĳ���';
comment on column SYS_MENU.DEL_FLAG
  is 'ɾ�����';
comment on column SYS_MENU.YN_ENABLE
  is '0��������1������';
comment on column SYS_MENU.GROUP_ID
  is '������֯';
comment on column SYS_MENU.MEMO
  is '��ע';

prompt Creating SYS_ROLE...
create table SYS_ROLE
(
  ID           VARCHAR2(32) not null,
  NAME         VARCHAR2(100),
  YN_MODIFY    VARCHAR2(2) default '1',
  CREATE_USER  VARCHAR2(32),
  CREATE_TIME  VARCHAR2(14),
  UPDATE_USER  VARCHAR2(32),
  UPDATE_TIME  VARCHAR2(14),
  CREATAE_DEPT VARCHAR2(18),
  UPDATE_DEPT  VARCHAR2(18),
  DEL_FLAG     VARCHAR2(2) default '0',
  YN_ENABLE    VARCHAR2(2) default '1' not null,
  ORG_ID       VARCHAR2(32),
  MEMO         VARCHAR2(512)
)
tablespace CF_BASE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SYS_ROLE
  is 'ϵͳ��ɫ��';
comment on column SYS_ROLE.ID
  is '��ɫ��ʶ';
comment on column SYS_ROLE.NAME
  is '��ɫ����';
comment on column SYS_ROLE.YN_MODIFY
  is '0��������
1������';
comment on column SYS_ROLE.CREATE_USER
  is '������';
comment on column SYS_ROLE.CREATE_TIME
  is '����ʱ��';
comment on column SYS_ROLE.UPDATE_USER
  is '�޸���';
comment on column SYS_ROLE.UPDATE_TIME
  is '�޸�ʱ��';
comment on column SYS_ROLE.CREATAE_DEPT
  is '��������';
comment on column SYS_ROLE.UPDATE_DEPT
  is '�޸Ĳ���';
comment on column SYS_ROLE.DEL_FLAG
  is 'ɾ�����';
comment on column SYS_ROLE.YN_ENABLE
  is '����״̬0������ 1 ���� ';
comment on column SYS_ROLE.ORG_ID
  is '������֯';
comment on column SYS_ROLE.MEMO
  is '��ע';
alter table SYS_ROLE
  add constraint PK_SYS_ROLE primary key (ID)
  using index 
  tablespace CF_BASE_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SYS_ROLE_MENU...
create table SYS_ROLE_MENU
(
  ROLE_ID VARCHAR2(32) not null,
  MENU_ID VARCHAR2(32) not null
)
tablespace CF_BASE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SYS_ROLE_MENU
  is 'ϵͳ��ɫ�˵�';
comment on column SYS_ROLE_MENU.ROLE_ID
  is '��ɫid';
comment on column SYS_ROLE_MENU.MENU_ID
  is '�˵�id';

prompt Creating SYS_ROLE_USER...
create table SYS_ROLE_USER
(
  ROLE_ID VARCHAR2(32) not null,
  USER_ID VARCHAR2(32) not null
)
tablespace CF_BASE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SYS_ROLE_USER
  is 'ϵͳ��ɫ�û�';
comment on column SYS_ROLE_USER.ROLE_ID
  is '��ɫid';
comment on column SYS_ROLE_USER.USER_ID
  is '�û�id';

prompt Creating SYS_USER...
create table SYS_USER
(
  ID             VARCHAR2(32) not null,
  LOGIN_NAME     VARCHAR2(20) not null,
  LOGIN_ALIAS    VARCHAR2(50),
  PASSWORD       VARCHAR2(30) default '111111' not null,
  USER_TYPE      VARCHAR2(2) default '1',
  BIND_IP        VARCHAR2(50),
  BIND_MAC       VARCHAR2(50),
  BINDE_MEID     VARCHAR2(100),
  VALIDITY       VARCHAR2(10) default '1',
  MOBILE_TEL     VARCHAR2(120),
  FIX_TEL        VARCHAR2(120),
  ORG_ID         VARCHAR2(18),
  REGULATORY_ORG VARCHAR2(18),
  AREA_ID        VARCHAR2(18),
  ID_CARD        VARCHAR2(20),
  HEADER         VARCHAR2(200),
  YN_MODIFY      VARCHAR2(2) default '1',
  BIRTHDAY       VARCHAR2(14),
  SEX            VARCHAR2(2),
  EMAIL          VARCHAR2(50),
  YN_ASITANT     VARCHAR2(2) default '0',
  ASITANT_ID     VARCHAR2(18),
  CREATE_USER    VARCHAR2(32),
  CREATE_TIME    VARCHAR2(14),
  UPDATE_USER    VARCHAR2(32),
  UPDATE_TIME    VARCHAR2(14),
  CREATAE_DEPT   VARCHAR2(18),
  UPDATE_DEPT    VARCHAR2(18),
  DEL_FLAG       VARCHAR2(2) default '0',
  YN_ENABLE      VARCHAR2(2) default '1',
  GROUP_ID       VARCHAR2(32),
  MEMO           VARCHAR2(512)
)
tablespace CF_BASE_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SYS_USER
  is 'ϵͳ�û���';
comment on column SYS_USER.ID
  is '�˺ű���';
comment on column SYS_USER.LOGIN_NAME
  is '�˺ŵ�½��';
comment on column SYS_USER.LOGIN_ALIAS
  is '�˺ű�������ʾʱ��';
comment on column SYS_USER.PASSWORD
  is '�˺����룬Ĭ������ 111111';
comment on column SYS_USER.USER_TYPE
  is '1����ͨ�û�
2��ϵͳ����Ա
3����ܹ���Ա
4����������Ա';
comment on column SYS_USER.BIND_IP
  is '�û���¼���󶨵�IP��ַ';
comment on column SYS_USER.BIND_MAC
  is '�û���¼���󶨵�MAC��ַ';
comment on column SYS_USER.BINDE_MEID
  is '�û���¼���󶨵��ƶ��˻�����';
comment on column SYS_USER.VALIDITY
  is '������Ч����';
comment on column SYS_USER.MOBILE_TEL
  is '�ֻ�';
comment on column SYS_USER.FIX_TEL
  is '����';
comment on column SYS_USER.ORG_ID
  is '�û�������λ����';
comment on column SYS_USER.REGULATORY_ORG
  is '��ܵ�λ';
comment on column SYS_USER.AREA_ID
  is '�û���������';
comment on column SYS_USER.ID_CARD
  is '�û����֤����';
comment on column SYS_USER.HEADER
  is '�û�ͷ�� ���URL';
comment on column SYS_USER.YN_MODIFY
  is '0��������
1������';
comment on column SYS_USER.BIRTHDAY
  is '��������';
comment on column SYS_USER.SEX
  is '�Ա�';
comment on column SYS_USER.EMAIL
  is '�ʼ���ַ';
comment on column SYS_USER.YN_ASITANT
  is '�Ƿ񸨾���0����1����';
comment on column SYS_USER.ASITANT_ID
  is '��������ID ͬһ����ֻ�ܸ���һλ��';
comment on column SYS_USER.CREATE_USER
  is '������';
comment on column SYS_USER.CREATE_TIME
  is '����ʱ��';
comment on column SYS_USER.UPDATE_USER
  is '�޸���';
comment on column SYS_USER.UPDATE_TIME
  is '�޸�ʱ��';
comment on column SYS_USER.CREATAE_DEPT
  is '��������';
comment on column SYS_USER.UPDATE_DEPT
  is '�޸Ĳ���';
comment on column SYS_USER.DEL_FLAG
  is 'ɾ�����';
comment on column SYS_USER.YN_ENABLE
  is '0��������1������';
comment on column SYS_USER.GROUP_ID
  is '������֯';
comment on column SYS_USER.MEMO
  is '��ע';
alter table SYS_USER
  add constraint PK_SYS_USER primary key (ID)
  using index 
  tablespace CF_BASE_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for SYS_DIC_BUSINESS...
alter table SYS_DIC_BUSINESS disable all triggers;
prompt Disabling triggers for SYS_DIC_CFG...
alter table SYS_DIC_CFG disable all triggers;
prompt Disabling triggers for SYS_LOG...
alter table SYS_LOG disable all triggers;
prompt Disabling triggers for SYS_MENU...
alter table SYS_MENU disable all triggers;
prompt Disabling triggers for SYS_ROLE...
alter table SYS_ROLE disable all triggers;
prompt Disabling triggers for SYS_ROLE_MENU...
alter table SYS_ROLE_MENU disable all triggers;
prompt Disabling triggers for SYS_ROLE_USER...
alter table SYS_ROLE_USER disable all triggers;
prompt Disabling triggers for SYS_USER...
alter table SYS_USER disable all triggers;
prompt Loading SYS_DIC_BUSINESS...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610200', '�����־ֻ�ɽ�ɳ����ΰ����ж�', '320303610000', 'ylfjhspcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303610200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610201', '�����־ֻ�ɽ�ɳ���Ѳ�ߴ����ж�', '320303610200', 'ylfjhspcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303610201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610300', '�����־ֻ�ɽ�ɳ����̾��ж�', '320303610000', 'ylfjhspcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303610300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303620101', '�����־ִ���ɽ�ɳ����������жӳ�ɽ��������', '320303620100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303620102', '�����־ִ���ɽ�ɳ����������ж���ɽ�´�������', '320303620100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550107', '�����־������ɳ����������жӻ�ɽ������', '320303550100', 'ylfjtspcssqmjzdhszrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303550107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550109', '�����־������ɳ����������ж��ӷ�����������', '320303550100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550100', '�����־������ɳ����������ж�', '320303550000', 'ylfjtspcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303550100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550101', '�����־������ɳ����������ж�ͭ��������', '320303550100', 'ylfjtspcssqmjzdtxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303550101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550102', '�����־������ɳ����������ж���ɽ������', '320303550100', 'ylfjtspcssqmjzdxszrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303550102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550103', '�����־������ɳ����������жӽ���������', '320303550100', 'ylfjtspcssqmjzdjxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303550103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550104', '�����־������ɳ����������жӽ���������', '320303550100', 'ylfjtspcssqmjzdjpzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303550104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550105', '�����־������ɳ����������ж�����������', '320303550100', 'ylfjtspcssqmjzdxmzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303550105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550106', '�����־������ɳ����������жӽ�ʨ������', '320303550100', 'ylfjtspcssqmjzdjszrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303550106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580117', '�����־�����ɳ����������жӽ��������', '320303580100', 'ylfjpcpcssqmjzdjfzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580117', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580118', '�����־�����ɳ����������ж�����������', '320303580100', 'ylfjpcpcssqmjzdylzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580118', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510103', '�����־ִ�Ȫ�ɳ����������ж�Ȫ����������', '320305510100', 'jwfjdqpcssqmjzdqxczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305510103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510104', '�����־ִ�Ȫ�ɳ����������ж�Ȫ����������', '320305510100', 'jwfjdqpcssqmjzdqdczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305510104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510105', '�����־ִ�Ȫ�ɳ����������жӴ���ׯ��������', '320305510100', 'jwfjdqpcssqmjzddlzczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305510105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510106', '�����־ִ�Ȫ�ɳ����������ж���᭶��塢�������������', '320305510100', 'jwfjdqpcssqmjzddcxczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305510106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305171400', '�����־ֽ�ͨ��������ֿ���ͨ���ж�', '320305170000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303620100', '�����־ִ���ɽ�ɳ����������ж�', '320303620000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303620103', '�����־ִ���ɽ�ɳ����������ж��ǼҺ���������', '320303620100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303620104', '�����־ִ���ɽ�ɳ����������ж�����������', '320303620100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550111', '�����־������ɳ����������ж�԰��������', '320303550100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550112', '�����־������ɳ����������ж���ɲ������', '320303550100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550200', '�����־������ɳ����ΰ����ж�', '320303550000', 'ylfjtspcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303550200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550201', '�����־������ɳ���Ѳ�ߴ����ж�', '320303550200', 'ylfjtspcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303550201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550300', '�����־������ɳ����̾��ж�', '320303550000', 'ylfjtspcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303550300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303560000', '�����־��ӷ��ɳ���', '320303000000', 'ylfjzfpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303560000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303560100', '�����־��ӷ��ɳ����������ж�', '320303560000', 'ylfjzfpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303560100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303560101', '�����־��ӷ��ɳ����������ж���ɲ������', '320303560100', 'ylfjzfpcssqmjzdtszrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303560101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303560102', '�����־��ӷ��ɳ����������ж��ӷ�ɽ������', '320303560100', 'ylfjzfpcssqmjzdzfszrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303560102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303560103', '�����־��ӷ��ɳ����������жӽ�¤������', '320303560100', 'ylfjzfpcssqmjzdjlzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303560103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303560104', '�����־��ӷ��ɳ����������ж��ӷ�����������', '320303560100', 'ylfjzfpcssqmjzdzfmjzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303560104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303560105', '�����־��ӷ��ɳ����������ж��ӷ�������', '320303560100', 'ylfjzfpcssqmjzdzfzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303560105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303560106', '�����־��ӷ��ɳ����������ж�Բ��������', '320303560100', 'ylfjzfpcssqmjzdymzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303560106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303560200', '�����־��ӷ��ɳ����ΰ����ж�', '320303560000', 'ylfjzfpcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303560200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303560201', '�����־��ӷ��ɳ���Ѳ�ߴ����ж�', '320303560200', 'ylfjzfpcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303560201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303560300', '�����־��ӷ��ɳ����̾��ж�', '320303560000', 'ylfjzfpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303560300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570000', '�����־������ɳ���', '320303000000', 'ylfjqnpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570100', '�����־������ɳ����������ж�', '320303570000', 'ylfjqnpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570101', '�����־������ɳ����������ж�����������', '320303570100', 'ylfjqnpcssqmjzdxwzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570102', '�����־������ɳ����������ж�����������', '320303570100', 'ylfjqnpcssqmjzdtjzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570103', '�����־������ɳ����������жӻ�����������', '320303570100', 'ylfjqnpcssqmjzdhhtzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570104', '�����־������ɳ����������ж�����������', '320303570100', 'ylfjqnpcssqmjzdxxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570105', '�����־������ɳ����������ж�����������', '320303570100', 'ylfjqnpcssqmjzdqnzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570106', '�����־������ɳ����������жӿ���������', '320303570100', 'ylfjqnpcssqmjzdkhzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570107', '�����־������ɳ����������жӿ���������', '320303570100', 'ylfjqnpcssqmjzdkmzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570108', '�����־������ɳ����������ж��ӹ�¥������', '320303570100', 'ylfjqnpcssqmjzdzglzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570109', '�����־������ɳ����������жӴ�ͬ������', '320303570100', 'ylfjqnpcssqmjzddtzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570110', '�����־������ɳ����������ж��ղ�������', '320303570100', 'ylfjqnpcssqmjzdybzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570200', '�����־������ɳ����ΰ����ж�', '320303570000', 'ylfjqnpcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570201', '�����־������ɳ���Ѳ�ߴ����ж�', '320303570200', 'ylfjqnpcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303570300', '�����־������ɳ����̾��ж�', '320303570000', 'ylfjqnpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303570300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580000', '�����־�����ɳ���', '320303000000', 'ylfjpcpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580100', '�����־�����ɳ����������ж�', '320303580000', 'ylfjpcpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580101', '�����־�����ɳ����������ж�����������', '320303580100', 'ylfjpcpcssqmjzdylzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580102', '�����־�����ɳ����������ж�����������', '320303580100', 'ylfjpcpcssqmjzdtczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580105', '�����־�����ɳ����������ж�����������', '320303580100', 'ylfjpcpcssqmjzdxgzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580106', '�����־�����ɳ����������жӻ���������', '320303580100', 'ylfjpcpcssqmjzdjczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580108', '�����־�����ɳ����������жӿ���������', '320303580100', 'ylfjpcpcssqmjzdknzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580109', '�����־�����ɳ����������ж�ʯ��������', '320303580100', 'ylfjpcpcssqmjzdslzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580110', '�����־�����ɳ����������жӻ���ɽ��ó��������', '320303580100', 'ylfjpcpcssqmjzdhbssmczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580111', '�����־�����ɳ����������ж�����������', '320303580100', 'ylfjpcpcssqmjzdlhzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580112', '�����־�����ɳ����������ж�����������', '320303580100', 'ylfjpcpcssqmjzdxszrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580114', '�����־�����ɳ����������ж��Ͷ�������', '320303580100', 'ylfjpcpcssqmjzdldzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580114', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580115', '�����־�����ɳ����������жӻ���������', '320303580100', 'ylfjpcpcssqmjzdhdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580115', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580116', '�����־�����ɳ����������ж�����������', '320303580100', 'ylfjpcpcssqmjzdmszrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580116', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305170700', '�����־ֽ�ͨ�����Ӹ����ж�', '320305170000', 'jwfjjyjddgszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305170700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305170800', '�����־ֽ�ͨ�����ӳ�����', '320305170000', 'jwfjjyjddcgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305170800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305170900', '�����־ֽ�ͨ�������ΰ������ж�', '320305170000', 'jwfjjyjddzakkzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305170900', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305171000', '�����־ֽ�ͨ�����ӷ��ƹ�', '320305170000', 'jwfjjyjddfzg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305171000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305171100', '�����־ֽ�ͨ�����ӻ����ж�', '320305170000', 'jwfjjyjddjdzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305171100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305171200', '�����־ֽ�ͨ��������ɽ�ж�', '320305170000', 'jwfjjyjddtszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305171200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305171300', '�����־ֽ�ͨ��������ɽȪ�ж�', '320305170000', 'jwfjjyjddqsqzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305171300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305180000', '�����־ַ�����', '320305000000', 'jwfjfzdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305180000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305190000', '�����־����¿�', '320305000000', 'jwfjwsk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305190000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305200000', '�����־ֲ�������', '320305000000', 'jwfjcwglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305200000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305240000', '�����־���ƿ�', '320305000000', 'jwfjsjk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305240000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305250000', '�����־����������', '320305000000', 'jwfjxzglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305250000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305280000', '����ʡ�����й����ּ����־�Ѳ�����', '320305000000', 'jwfjyfdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305280000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305310000', '�����־ְ칫��', '320305000000', 'jwfjzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305310000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305320000', '�����־ּ�ί', '320305000000', 'jwfjjw', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305320000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305320100', '�����־ּ�ί�ල��', '320305320000', 'jwfjjwjds', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305320100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305330000', '�����־�ָ����', '320305000000', 'jwfjzhzx', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305330000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305330100', '�����־�ָ���ҵ�����', '320305330000', 'jwfjzhsdas', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305330100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305330200', '�����־�ָ����ͨѶ��', '320305330000', 'jwfjzhstyk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305330200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305330300', '�����־�ָ������Ϣ���п�', '320305330000', 'jwfjzhsxxdyk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305330300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305330400', '�����־��鱨��Ϣ����', '320305330000', 'jwfjqbxxzx', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305330400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305340000', '�����־ֶ�����', '320305000000', 'jwfjdcdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305340000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305350000', '�����־����δ�', '320305000000', 'jwfjzzc', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305350000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305410000', '����ʡ�����й����ּ����־ֱ������', '320305000000', 'jwfjbadd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305410000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510000', '�����־ִ�Ȫ�ɳ���', '320305000000', 'jwfjdqpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305510000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510100', '�����־ִ�Ȫ�ɳ����������ж�', '320305510000', 'jwfjdqpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305510100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510101', '�����־ִ�Ȫ�ɳ����������жӹ�ҵ԰��ׯׯ��������', '320305510100', 'jwfjdqpcssqmjzdgyyqzzczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305510101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510102', '�����־ִ�Ȫ�ɳ����������жӹ�ҵ԰�����Ӵ�������', '320305510100', 'jwfjdqpcssqmjzdgyyqgzczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305510102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303WB9432', '������������������Ժ', '320303WB9400', 'xzsylqrmjcy', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303WB9432', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305000000', '�����й����ּ����־�', '320300000000', 'jwfj', 3, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305000000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305010000', '�����־ֹ��ڰ�ȫ�������', '320305000000', 'jwfjgbdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305010000', '0', '1', null);
commit;
prompt 100 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305020000', '�����־־�����', '320305000000', 'jwfjjzdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305020000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305020100', '�����־־����Ӱ칫��', '320305020000', 'jwfjjzddbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305020100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305020200', '�����־־�����һ�ж�', '320305020000', 'jwfjjzddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305020200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305020300', '�����־־����Ӷ��ж�', '320305020000', 'jwfjjzddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305020300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305030000', '�����־��ΰ����', '320305000000', 'jwfjzadd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305030000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305030100', '�����־��ΰ���Ӱ칫��', '320305030000', 'jwfjzaddbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305030100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305030200', '�����־��ΰ���ӻ�����', '320305030000', 'jwfjzaddhzk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305030200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305030300', '�����־��ΰ����Σ����', '320305030000', 'jwfjzaddwbs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305030300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305030400', '�����־��ΰ�����ΰ���', '320305030000', 'jwfjzaddzag', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305030400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305050000', '�����־��̾����', '320305000000', 'jwfjxjdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305050000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305050100', '�����־��̾���Ӱ칫��', '320305050000', 'jwfjxjddbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305050100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305050200', '�����־��̾���ӷ��ƹ�', '320305050000', 'jwfjxjddfzg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305050200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305050300', '�����־��̾���Ӵ��ж�', '320305050000', 'jwfjxjdddazd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305050300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305050400', '�����־��̾���Ӽ����ж�', '320305050000', 'jwfjxjddjszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305050400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305050500', '�����־��̾�����鱨�ж�', '320305050000', 'jwfjxjddqbzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305050500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305050600', '�����־��̾���ӳ����ж�', '320305050000', 'jwfjxjddcqzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305050600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305050700', '�����־��̾���Ӷ��ж�', '320305050000', 'jwfjxjddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305050700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305050800', '�����־��̾���ӽ����ж�', '320305050000', 'jwfjxjddjdzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305050800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305070000', '�����й�������֧�Ӽ������������', '320305000000', 'xzsgaxfzdjwqxfdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305070000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305070100', '�����й�������֧�Ӽ�������Ӽ����ж�', '320305070000', 'xzsgaxfzdjwqddjwzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305070100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305070200', '�����й�������֧�Ӽ���������칤·�ж�', '320305070000', 'xzsgaxfzdjwqddtglzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305070200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305090000', '�����־־�����', '320305000000', 'jwfjjbk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305090000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305110000', '�����־���Ϣ���簲ȫ����', '320305000000', 'jwfjwadd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305110000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305130000', '������������', '320305000000', 'jwqkss', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305130000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305130100', '����������������', '320305130000', 'jwqxzjls', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305130100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305150000', '�����־��ŷÿ�', '320305000000', 'jwfjxfk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305150000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305170000', '�����־ֽ�ͨ������', '320305000000', 'jwfjjjdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305170000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305170100', '�����־ֽ�ͨ�����Ӱ칫��', '320305170000', 'jwfjjyjddbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305170100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305170200', '�����־ֽ�ͨ�����������', '320305170000', 'jwfjjyjddzxg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305170200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305170300', '�����־ֽ�ͨ�������¹ʿ�', '320305170000', 'jwfjjyjddsgk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305170300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305170400', '�����־ֽ�ͨ�����ӳ����ж�', '320305170000', 'jwfjjyjddcqzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305170400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305170500', '�����־ֽ�ͨ������¹ׯ�ж�', '320305170000', 'jwfjjyjddlzzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305170500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305170600', '�����־ֽ�ͨ�����������ж�', '320305170000', 'jwfjjyjddtzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305170600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510107', '�����־ִ�Ȫ�ɳ����������ж����Ŵ�������', '320305510100', 'jwfjdqpcssqmjzdlmczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305510107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580119', '�����־�����ɳ����������жӻ���������', '320303580100', 'ylfjpcpcssqmjzdhnzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580119', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580200', '�����־�����ɳ����ΰ����ж�', '320303580000', 'ylfjpcpcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580201', '�����־�����ɳ���Ѳ�ߴ����ж�', '320303580200', 'ylfjpcpcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580300', '�����־�����ɳ����̾��ж�', '320303580000', 'ylfjpcpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590000', '�����־�ʨ��ɽ�ɳ���', '320303000000', 'ylfjszspcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590100', '�����־�ʨ��ɽ�ɳ����������ж�', '320303590000', 'ylfjszspcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590101', '�����־�ʨ��ɽ�ɳ����������ж�����ɽ������·����������', '320303590100', 'ylfjszspcssqmjzdltsjcldqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590102', '�����־�ʨ��ɽ�ɳ����������ж�����ɽС��������', '320303590100', 'ylfjszspcssqmjzdltsxqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590103', '�����־�ʨ��ɽ�ɳ����������ж����½�1��144��������', '320303590100', 'ylfjszspcssqmjzdtxj1144hzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590104', '�����־�ʨ��ɽ�ɳ����������ж�÷԰����������', '320303590100', 'ylfjszspcssqmjzdmysqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590105', '�����־�ʨ��ɽ�ɳ����������ж�ʨ��ɽ��������', '320303590100', 'ylfjszspcssqmjzdszsczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590106', '�����־�ʨ��ɽ�ɳ����������ж�ʨ��������', '320303590100', 'ylfjszspcssqmjzdsnzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590107', '�����־�ʨ��ɽ�ɳ����������ж�����������������������', '320303590100', 'ylfjszspcssqmjzdlcjhcsszrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590108', '�����־�ʨ��ɽ�ɳ����������жӰ�̩��A��B��������', '320303590100', 'ylfjszspcssqmjzdataqbqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590109', '�����־�ʨ��ɽ�ɳ����������жӻ�ɽ�´�������', '320303590100', 'ylfjszspcssqmjzdhsxczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590110', '�����־�ʨ��ɽ�ɳ����������ж���������', '320303590100', 'ylfjszspcssqmjzdmjzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590111', '�����־�ʨ��ɽ�ɳ����������ж���԰������', '320303590100', 'ylfjszspcssqmjzdyyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590112', '�����־�ʨ��ɽ�ɳ����������ж�ܰ԰С��������', '320303590100', 'ylfjszspcssqmjzdyxqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590113', '�����־�ʨ��ɽ�ɳ����������ж���ǿ������԰С��������', '320303590100', 'ylfjszspcssqmjzdmqdhyxqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590113', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590114', '�����־�ʨ��ɽ�ɳ����������жӻ�ɽ��������', '320303590100', 'ylfjszspcssqmjzdhszrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590114', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590200', '�����־�ʨ��ɽ�ɳ����ΰ����ж�', '320303590000', 'ylfjszspcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590201', '�����־�ʨ��ɽ�ɳ���Ѳ�ߴ����ж�', '320303590200', 'ylfjszspcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303590300', '�����־�ʨ��ɽ�ɳ����̾��ж�', '320303590000', 'ylfjszspcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303590300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600000', '�����־������ɳ���', '320303000000', 'ylfjxspcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600100', '�����־������ɳ����������ж�', '320303600000', 'ylfjxspcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600101', '�����־������ɳ����������ж�����������', '320303600100', 'ylfjxspcssqmjzdqxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600102', '�����־������ɳ����������ж���¡������', '320303600100', 'ylfjxspcssqmjzdxlzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600103', '�����־������ɳ����������жӹ��������', '320303600100', 'ylfjxspcssqmjzdgdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600104', '�����־������ɳ����������жӷᴢ������', '320303600100', 'ylfjxspcssqmjzdfczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600105', '�����־������ɳ����������ж�Ԭ��������', '320303600100', 'ylfjxspcssqmjzdyqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600106', '�����־������ɳ����������ж���ԭ������', '320303600100', 'ylfjxspcssqmjzdlyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600108', '�����־������ɳ����������жӵ̶�������', '320303600100', 'ylfjxspcssqmjzdddzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600109', '�����־������ɳ����������ж�����������', '320303600100', 'ylfjxspcssqmjzdxszrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600110', '�����־������ɳ����������жӽ���������', '320303600100', 'ylfjxspcssqmjzdjnzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600111', '�����־������ɳ����������ж�����������', '320303600100', 'ylfjxspcssqmjzdyyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600201', '�����־������ɳ���Ѳ�ߴ����ж�', '320303600200', 'ylfjxspcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600300', '�����־������ɳ����̾��ж�', '320303600000', 'ylfjxspcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610000', '�����־ֻ�ɽ�ɳ���', '320303000000', 'ylfjhspcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303610000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610100', '�����־ֻ�ɽ�ɳ����������ж�', '320303610000', 'ylfjhspcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303610100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610101', '�����־ֻ�ɽ�ɳ����������ж���������', '320303610100', 'ylfjhspcssqmjzdmfzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303610101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610103', '�����־ֻ�ɽ�ɳ����������ж�����԰������', '320303610100', 'ylfjhspcssqmjzdmyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303610103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610105', '�����־ֻ�ɽ�ɳ����������ж���ɽ�º͹�ҵ԰��������', '320303610100', 'ylfjhspcssqmjzdtsshgyyqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303610105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610106', '�����־ֻ�ɽ�ɳ����������жӳ�ɽ��������', '320303610100', 'ylfjhspcssqmjzdcsczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303610106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610107', '�����־ֻ�ɽ�ɳ����������ж��ǼҺ���������', '320303610100', 'ylfjhspcssqmjzdqjhczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303610107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580107', '�����־�����ɳ����������ж����������', '320303580100', 'ylfjpcpcssqmjzdyhzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303580113', '�����־�����ɳ����������ж�����������', '320303580100', 'ylfjpcpcssqmjzdxdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303580113', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303600200', '�����־������ɳ����ΰ����ж�', '320303600000', 'ylfjxspcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303600200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510108', '�����־ִ�Ȫ�ɳ����������ж���ׯ��������', '320305510100', 'jwfjdqpcssqmjzdzzczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305510108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510109', '�����־ִ�Ȫ�ɳ����������ж��ƴ�������', '320305510100', 'jwfjdqpcssqmjzdczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305510109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510110', '�����־ִ�Ȫ�ɳ����������жӲ��ִ�������', '320305510100', 'jwfjdqpcssqmjzdcwczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305510110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510111', '�����־ִ�Ȫ�ɳ����������ж�Сɽ�Ӵ�������', '320305510110', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320305510111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510112', '�����־ִ�Ȫ�ɳ����������ж�¹¥��������', '320305510110', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320305510112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510113', '�����־ִ�Ȫ�ɳ����������ж���Ȫ��ί��������', '320305510110', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320305510113', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305510114', '�����־ִ�Ȫ�ɳ����������ж����ľ�ί��������', '320305510110', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320305510114', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305520000', '�����־���ɽ�ɳ���', '320305000000', 'jwfjtspcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305520000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320305520100', '�����־���ɽ�ɳ����������ж�', '320305520000', 'jwfjtspcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320305520100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303620000', '�����־ִ���ɽ�ɳ���', '320303000000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610108', '�����־ֻ�ɽ�ɳ����������ж��̵���������', '320303610100', 'ylfjhspcssqmjzdldzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303610108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610109', '�����־ֻ�ɽ�ɳ����������ж�����԰������', '320303610100', 'ylfjhspcssqmjzdmxyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303610109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610110', '�����־ֻ�ɽ�ɳ����������жӶ�������������', '320303610100', 'ylfjhspcssqmjzddfmdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303610110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550110', '�����־������ɳ����������ж��ӷ�������', '320303550100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560108', '��¥�־ֶ�վ�ɳ����������ж���ƽ������', '320302560100', 'glfjdzpcssqmjzdzpzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560109', '��¥�־ֶ�վ�ɳ����������ж�ӭ��������', '320302560100', 'glfjdzpcssqmjzdyczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560110', '��¥�־ֶ�վ�ɳ����������жӷ��������', '320302560100', 'glfjdzpcssqmjzdfczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303620200', '�����־ִ���ɽ�ɳ����ΰ����ж�', '320303620000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303620201', '�����־ִ���ɽ�ɳ���Ѳ�ߴ����ж�', '320303620200', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
commit;
prompt 200 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303a00000', '�����־ֵ�����', '320303000000', 'ylfjdas', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320303a00000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303a10000', '�����־����δ�', '320303000000', 'ylfjzzc', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320303a10000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303a20000', '�����־ֳ��뾳���', '320303000000', 'ylfjcrjdd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320303a20000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303a30000', '�����־ּƲƿ�', '320303000000', 'ylfjjck', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320303a30000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303a40000', '�����־ֱ�����˾', '320303000000', 'ylfjbags', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320303a40000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303a50000', '�����־������', '320303000000', 'ylfjzfb', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320303a50000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303a60000', '�����־�ά�Ȱ�', '320303000000', 'ylfjwwb', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320303a60000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303WB9431', '����������������Ժ', '320303WB9400', 'xzsylqrmfy', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303WB9431', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303051400', '�����־��̾�������ж�', '320303050000', 'ylfjxjddlzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303051400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303051600', '�����־��̾���ӱ��¶�', '320303050000', 'ylfjxjddbyd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303051600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303070000', '�����й�������֧���������������', '320303000000', 'ylfjxfk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303070000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303090000', '�����־־����Ļ�������', '320303000000', 'ylfjnbdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303090000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303150000', '�����־��ŷÿ�', '320303000000', 'ylfjxfk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303150000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303180000', '�����־ַ��ƿ�', '320303000000', 'ylfjfzk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303180000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303230000', '�����־�ͨ�ſ�', '320303000000', 'ylfjtxk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303230000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303310000', '�����־ְ칫��', '320303000000', 'ylfjbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303310000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303310100', '�����־��鱨��Ϣ����', '320303310000', 'ylfjqbxxzx', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303310100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303320000', '�����־ּ�ί', '320303000000', 'ylfjjw', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303320000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303330000', '�����־�ָ������', '320303000000', 'ylfjqbzx', 1, 0, 0, '20150126�ֶ�����', '30032', '20150126154229', null, null, '320300000000', null, '320303330000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303350000', '�����־�������', '320303000000', 'ylfjzgk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303350000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303390000', '�����־ֹ���', '320303000000', 'ylfjgh', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303390000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303510000', '�����־ִ��ׯ�ɳ���', '320303000000', 'ylfjdgzpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303510000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303510100', '�����־ִ��ׯ�ɳ����������ж�', '320303510000', 'ylfjdgzpcssqmzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303510100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303510101', '�����־ִ��ׯ�ɳ����������ж���ׯ��������', '320303510100', 'ylfjdgzpcssqmzdlzczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303510101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303510102', '�����־ִ��ׯ�ɳ����������ж��Ϻ�ͷ��������', '320303510100', 'ylfjdgzpcssqmzdshtczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303510102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303510103', '�����־ִ��ׯ�ɳ����������ж��º�ͷ������', '320303510100', 'ylfjdgzpcssqmzdxhtzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303510103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303510104', '�����־ִ��ׯ�ɳ����������ж�����ɽ��ҵ԰������', '320303510100', 'ylfjdgzpcssqmzdltsgyyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303510104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303510105', '�����־ִ��ׯ�ɳ����������ж��г�������', '320303510100', 'ylfjdgzpcssqmzdsczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303510105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303510106', '�����־ִ��ׯ�ɳ����������жӻ�������������', '320303510100', 'ylfjdgzpcssqmzdjcbdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303510106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303510300', '�����־ִ��ׯ�ɳ����̾��ж�', '320303510000', 'ylfjdgzpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303510300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303520000', '�����־������ɳ���', '320303000000', 'ylfjtqpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303520000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303520100', '�����־������ɳ����������ж�', '320303520000', 'ylfjtqpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303520100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303520101', '�����־������ɳ����������ж���Ⱥ������', '320303520100', 'ylfjtqpcssqmjzdlqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303520101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303520102', '�����־������ɳ����������ж���ׯ������', '320303520100', 'ylfjtqpcssqmjzdlzzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303520102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303520103', '�����־������ɳ����������ж��º�������', '320303520100', 'ylfjtqpcssqmjzdxhzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303520103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303520105', '�����־������ɳ����������ж�����������', '320303520100', 'ylfjtqpcssqmjzdtgzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303520105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303520106', '�����־������ɳ����������ж�����������', '320303520100', 'ylfjtqpcssqmjzdtyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303520106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303520107', '�����־������ɳ����������ж�����������', '320303520100', 'ylfjtqpcssqmjzdthzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303520107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303520108', '�����־������ɳ����������ж�����������', '320303520100', 'ylfjtqpcssqmjzdtqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303520108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303520200', '�����־������ɳ����ΰ����ж�', '320303520000', 'ylfjtqpcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303520200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303520201', '�����־������ɳ���Ѳ�ߴ����ж�', '320303520200', 'ylfjtqpcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303520201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303520300', '�����־������ɳ����̾��ж�', '320303520000', 'ylfjtqpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303520300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303540000', '�����־ֵ����ɳ���', '320303000000', 'ylfjdzpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303540000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303540100', '�����־ֵ����ɳ����������ж�', '320303540000', 'ylfjdzpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303540100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303540101', '�����־ֵ����ɳ����������жӰ�ɽ������', '320303540100', 'ylfjdzpcssqmjzdbszrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303540101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303540103', '�����־ֵ����ɳ����������жӹ�Ժ������', '320303540100', 'ylfjdzpcssqmjzdgyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303540103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303540104', '�����־ֵ����ɳ����������жӵ���������', '320303540100', 'ylfjdzpcssqmjzddzzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303540104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303540105', '�����־ֵ����ɳ����������жӿ�Է������', '320303540100', 'ylfjdzpcssqmjzdkyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303540105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303540200', '�����־ֵ����ɳ����ΰ����ж�', '320303540000', 'ylfjdzpcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303540200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303540201', '�����־ֵ����ɳ���Ѳ�ߴ����ж�', '320303540200', 'ylfjdzpcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303540201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303540300', '�����־ֵ����ɳ����̾��ж�', '320303540000', 'ylfjdzpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303540300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550000', '�����־������ɳ���', '320303000000', 'ylfjwjpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303550000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303610111', '�����־ֻ�ɽ�ɳ����������ж��̵ر�������', '320303610110', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320303610111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070307', '�����й�������֧�Ӻ��ڴ���������', '320300070300', 'xzsgaxfzdhqcscjd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070307', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174704', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·����һ�ж�', '320300174700', 'jyjzdgsglwddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174704', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590103', '��¥�־�ͭ���ɳ����������ж���������', '320302590100', 'glfjtppcssqmjzdsdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590104', '��¥�־�ͭ���ɳ����������ж�����������', '320302590100', 'glfjtppcssqmjzdsxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590105', '��¥�־�ͭ���ɳ����������ж��յ�������', '320302590100', 'glfjtppcssqmjzdsdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590106', '��¥�־�ͭ���ɳ����������ж�ͭ��������', '320302590100', 'glfjtppcssqmjzdtdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590107', '��¥�־�ͭ���ɳ����������ж�ͭ��������', '320302590100', 'glfjtppcssqmjzdtxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302a70000', '��¥�־�Ѳ�߷������', '320302000000', 'glfjxlffdd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320302a70000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302a80000', '��¥�־ֱ�����˾', '320302000000', 'glfjbags', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320302a80000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302WB9431', '�����й�¥������Ժ', '320302WB9400', 'xzsglqrmfy', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302WB9431', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300240000', '�����й�������ƴ�', '320300000000', 'sjc', 46, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300240000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300240100', '�����й�������ƴ������', '320300240000', 'sjcmsk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300240100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300240200', '�����й�������ƴ���ƿ�', '320300240000', 'sjcsjk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300240200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300250000', '�����й����ֺ��ڹ���', '320300000000', 'hqglc', 47, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300250000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300250100', '�����й����ֺ��ڹ��������', '320300250000', 'hqglcmsk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300250100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300250200', '�����й����ֺ��ڹ����йܿ�', '320300250000', 'hqglcxgk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300250200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300250300', '�����й����ֺ��ڹ�������', '320300250000', 'hqglccd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300250300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300250400', '�����й����ֺ��ڹ���װ����', '320300250000', 'hqglczbk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300250400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300250500', '�����й����ֺ��ڹ������ܿ�', '320300250000', 'hqglcfgk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300250500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300250600', '����ʡ�����й����ֺ��ڹ��������ʲ������', '320300250000', 'hqglcgyzcglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300250600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300270000', '�����й����ַ��ֲ�������', '320300000000', 'fkbgzzd', 36, 0, 0, '20140224������֯�������롣', null, null, null, null, null, null, '320300270000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300340300', '�����й����־��񶽲��Ҷ��ж�', '320300340000', 'ywdczdezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300340300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300340400', '�����й����־��񶽲������ж�', '320300340000', 'jwdczdszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300340400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300340500', '�����й����־��񶽲������ж�', '320300340000', 'jwdczdszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300340500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030034a000', '���񶽲�֧�����ж�', '320300340000', 'jwdczdwzd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030034a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300350000', '�����й��������β�', '320300000000', 'zzb', 53, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300350000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '3203003594', 'cscs2', '320300060000', 'cscs2', 1, 0, 0, 'yjghjgh', '30032', '20141108102123', '30032', '20141108102135', '320300000000', '320300000000', '3203003594', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300360000', '�����й��������β����´�', '320300350000', 'zzbrsc', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300360000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030308', '�����й������ΰ�֧���ۺϿƷ��ƹ�', '320300030300', 'zazdzhkfzg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030308', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030400', '�����й������ΰ�֧��������', '320300030000', 'zazdzgk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030500', '�����й������ΰ�֧�Ӱ����鴦һ���', '320300030000', 'zzzdydd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070102', '�����й�������֧��˾�սѵ��', '320300070100', 'xzsgaxfzdslbzyk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070103', '�����й�������֧��˾������', '320300070100', 'xzsgaxfzdslbjwk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070104', '�����й�������֧��˾�ͨ�ſ�', '320300070100', 'xzsgaxfzdslbtxk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070105', '�����й�������֧��˾�רְ��ָ����', '320300070100', 'xzsgaxfzdslbzzdzdk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070106', '�����й�������֧��˾�����ָ����', '320300070100', 'xzsgaxfzdslbddzhs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070107', '�����й�������֧��˾������ж�', '320300070100', 'xzsgaxfzdslbtqzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070200', '�����й�������֧�����δ�', '320300070000', 'xzsgaxfzdzzc', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070201', '�����й�������֧�����δ���ɿ�', '320300070200', 'xzsgaxfzdzzczgk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070202', '�����й�������֧�����δ�������', '320300070200', 'xzsgaxfzdzzcxck', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070203', '�����й�������֧�����δ��ͼ챣����', '320300070200', 'xzsgaxfzdzzcjjbwk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070203', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070300', '�����й�������֧�Ӻ��ڴ�', '320300070000', 'xzsgaxfzdhqc', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070301', '�����й�������֧�Ӻ��ڴ������', '320300070300', 'xzsgaxfzdhqccwk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070301', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070302', '�����й�������֧�Ӻ��ڴ�����װ����', '320300070300', 'xzsgaxfzdhqcggzbk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070302', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070303', '�����й�������֧�Ӻ��ڴ������', '320300070300', 'xzsgaxfzdhqcglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070303', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070304', '�����й�������֧�Ӻ��ڴ�������', '320300070300', 'xzsgaxfzdhqcsck', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070304', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070305', '�����й�������֧�Ӻ��ڴ���ѵ��', '320300070300', 'xzsgaxfzdhqclyd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070305', '0', '1', null);
commit;
prompt 300 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070306', '�����й�������֧�Ӻ��ڴ�������', '320300070300', 'xzsgaxfzdhqcwsd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070306', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173402', '�����й����ֽ�ͨ����֧�ӳ������칫��', '320300173400', 'jyjzdcgsbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173404', '�����й����ֽ�ͨ����֧�ӳ�������֤��', '320300173400', 'jyjzdcgspzg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173406', '�����й����ֽ�ͨ����֧�ӳ�����������', '320300173400', 'jyjzdcgsdag', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173406', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300360100', '�����й��������β����´��ɲ������', '320300360000', 'zzbrscgbglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300360100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300360200', '�����й��������β����´����ʹ����', '320300360000', 'zzbrscgzglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300360200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300360300', '�����й��������β����´����ι����', '320300360000', 'zzbrscjxglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300360300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300370000', '�����й��������β���֯������', '320300350000', 'zzbzzjyc', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300370000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300370100', '�����й��������β���֯���������ý�����', '320300370000', 'zzbzzjycbzjlk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300370100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300370200', '�����й��������β���֯��������֯ѵ����', '320300370000', 'zzbzzjyczzylk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300370200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300380000', '�����й��������β�������', '320300350000', 'zzbxcc', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300380000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300150200', '�����й������ŷô��Ӵ���', '320300150000', 'xfcjdk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300150200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030015a000', '�ŷô�������', '320300150000', 'xfcbxs', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030015a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160000', '�����й������ؾ�֧��', '320300000000', 'txjzd', 32, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160200', '�����й������ؾ�֧���ۺϿ�', '320300160000', 'txjzdzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160202', '�����й������ؾ�֧���ۺϿ������', '320300160200', 'tjzdzhkmsg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170804', '�����й����ֽ�ͨ����֧�ӽ�ͨ�������������', '320300170800', 'jyjzdjtzxglkzxg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171200', '�����й����ֽ�ͨ����֧�ӷ��ƿ�', '320300170000', 'jjzdfzk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171202', '�����й����ֽ�ͨ����֧�ӷ��ƿƷ��Ƽල��', '320300171200', 'jyjzdfzkfzjdg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172500', '�����й����ֽ�ͨ����֧�������������վ', '320300170000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171204', '�����й����ֽ�ͨ����֧�ӷ��ƿ���˹�', '320300171200', 'jyjzdfzkshg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171206', '�����й����ֽ�ͨ����֧�ӷ��ƿư��������', '320300171200', 'jyjzdfzkajfyg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171400', '�����й����ֽ�ͨ����֧�ӿƼ�װ����', '320300170000', 'jjzdkjzbk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171402', '�����й����ֽ�ͨ����֧�ӿƼ�װ���ƿƼ���', '320300171400', 'jyjzdkjzbkkjg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171404', '�����й����ֽ�ͨ����֧�ӿƼ�װ����װ����', '320300171400', 'jyjzdkjzbkzbg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171600', '�����й����ֽ�ͨ����֧���������', '320300170000', 'jjzdyldd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171601', '�����й����ֽ�ͨ����֧��������������ͼ�', '320300171600', 'jyjzdylddzgjj', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171601', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171602', '�����й����ֽ�ͨ����֧����������ۺϹ�', '320300171600', 'jyjzdylddzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171604', '�����й����ֽ�ͨ����֧���������ҵ���', '320300171600', 'jyjzdylddywg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173408', '�����й����ֽ�ͨ����֧�ӳ��������Թ�', '320300173400', 'jyjzdcgsksg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173408', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173410', '�����й����ֽ�ͨ����֧�ӳ����������', '320300173400', 'jyjzdcgscjg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173410', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173412', '�����й����ֽ�ͨ����֧�ӳ��������ܹ�', '320300173400', 'jyjzdcgscgg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173412', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173414', '�����й����ֽ�ͨ����֧�ӳ������ǻ�������', '320300173400', 'jyjzdcgsfjdcg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173414', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173600', '�����й����ֽ�ͨ����֧����ѵ����', '320300170000', 'jjzdpxzx', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173601', '�����й����ֽ�ͨ����֧����ѵ���������ͼ����', '320300173600', 'jyjzdpyzxzgjjgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173601', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173602', '�����й����ֽ�ͨ����֧����ѵ���İ칫��', '320300173600', 'jyjzdpyzxbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173604', '�����й����ֽ�ͨ����֧����ѵ���Ľ�����', '320300173600', 'jyjzdpyzxjys', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173606', '�����й����ֽ�ͨ����֧����ѵ����һ�ж�', '320300173600', 'jyjzdpyzxyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173606', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173608', '�����й����ֽ�ͨ����֧����ѵ���Ķ��ж�', '320300173600', 'jyjzdpyzxezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173608', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173610', '�����й����ֽ�ͨ����֧����ѵ�������ж�', '320300173600', 'jyjzdpyzxszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173610', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173800', '�����й����ֽ�ͨ����֧�Ӽ������', '320300170000', 'jjzdjczx', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173802', '�����й����ֽ�ͨ����֧�Ӽ�����İ칫��', '320300173800', 'jyjzdjczxbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173803', '�����й����ֽ�ͨ����֧�Ӽ�����������ͼ�', '320300173800', 'jyjzdjczxzgjj', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173803', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173804', '�����й����ֽ�ͨ����֧�Ӽ�����ļ��һ��', '320300173800', 'jyjzdjczxjcyg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173806', '�����й����ֽ�ͨ����֧�Ӽ�����ļ�����', '320300173800', 'jyjzdjczxjceg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173806', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173808', '�����й����ֽ�ͨ����֧�Ӽ�����ĵ��Թ�', '320300173800', 'jyjzdjczxdsg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173808', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174000', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·һ���', '320300170000', 'jjzdgsglydd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174002', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·һ����ۺϹ�', '320300174000', 'jyjzdgsglyddzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174004', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·һ���һ�ж�', '320300174000', 'jyjzdgsglyddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174004', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174006', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·һ��Ӷ��ж�', '320300174000', 'jyjzdgsglyddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174006', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174008', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·һ������ж�', '320300174000', 'jyjzdgsglyddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174008', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174010', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·һ��������ͼ�', '320300174000', 'jyjzdgsglyddzgjj', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174010', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174011', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·һ������ж�', '320300174000', 'jyjzdgsglyddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174011', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174100', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·�����', '320300170000', 'jjzdgsgledd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174102', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·������ۺϹ�', '320300174100', 'jyjzdgsgleddzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174104', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·�����һ�ж�', '320300174100', 'jyjzdgsgleddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174106', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·����Ӷ��ж�', '320300174100', 'jyjzdgsgleddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174108', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·����������ͼ�', '320300174100', 'jyjzdgsgleddzgjj', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174200', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·�����', '320300170000', 'jjzdgsglsdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174202', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·������ۺϹ�', '320300174200', 'jyjzdgsglsddzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174204', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·�����һ�ж�', '320300174200', 'jyjzdgsglsddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174206', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·����Ӷ��ж�', '320300174200', 'jyjzdgsglsddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174208', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·��������ж�', '320300174200', 'jyjzdgsglsddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174208', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174211', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·��������ж�', '320300174200', 'jyjzdgsglsddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174211', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300300000', '�����й����ֵ�����', '320300000000', 'dac', 49, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300300000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300300100', '�����й����ֵ�����ҵ��ָ����', '320300300000', 'dacywzdk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300300100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300300200', '�����й����ֵ��������������', '320300300000', 'dacdaglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300300200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300310000', '�����й����ְ칫��', '320300000000', 'bgs', 50, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300310000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300310100', '�����й����ְ칫�������', '320300310000', 'bgsmsk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300310100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172810', '����ʡ�����й����ֽ�ͨ����֧�ӻ���������ж�', '320300172800', 'jyjzdjdddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172810', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173000', '�����й����ֽ�ͨ����֧���ΰ����ڴ��', '320300170000', 'jjzdzakkdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173001', '�����й����ֽ�ͨ����֧���ΰ����ڴ�Ӽͼ����', '320300173000', 'jyjzdzakkddjjgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173001', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173002', '�����й����ֽ�ͨ����֧���ΰ����ڴ���ۺϹ�', '320300173000', 'jyjzdzakkddzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173004', '�����й����ֽ�ͨ����֧���ΰ����ڴ�ӳ��⳵����', '320300173000', 'jyjzdzakkddczcglc', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173004', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173006', '�����й����ֽ�ͨ����֧���ΰ����ڴ�����﹵�ж�', '320300173000', 'jyjzdzakkddplgzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173006', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173008', '�����й����ֽ�ͨ����֧���ΰ����ڴ�Ӷ������ж�', '320300173000', 'jyjzdzakkddddzzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173008', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173010', '�����й����ֽ�ͨ����֧���ΰ����ڴ��ʯ���ж�', '320300173000', 'jyjzdzakkddsqzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173010', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173012', '�����й����ֽ�ͨ����֧���ΰ����ڴ���غ����ж�', '320300173000', 'jyjzdzakkddqhqzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173012', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173014', '�����й����ֽ�ͨ����֧���ΰ����ڴ�������ж�', '320300173000', 'jyjzdzakkddlwzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173014', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173016', '�����й����ֽ�ͨ����֧���ΰ����ڴ���ϸ��ж�', '320300173000', 'jyjzdzakkddngzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173016', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173018', '�����й����ֽ�ͨ����֧���ΰ����ڴ�ӻ��ж�', '320300173000', 'jyjzdzakkddhhzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173018', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173020', '�����й����ֽ�ͨ����֧���ΰ����ڴ�Ӻ�ɽ�ж�', '320300173000', 'jyjzdzakkddhszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173020', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173022', '�����й����ֽ�ͨ����֧���ΰ����ڴ�Ӳ����ж�', '320300173000', 'jyjzdzakkddcpzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173022', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173024', '�����й����ֽ�ͨ����֧���ΰ����ڴ�ӵ�ɽ�ж�', '320300173000', 'jyjzdzakkdddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173024', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300310200', '�����й����ְ칫�ҵ��п�', '320300310000', 'bgsdyk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300310200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300310300', '�����й����ְ칫����Ϣ��', '320300310000', 'bgsxxk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300310300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300310400', '�����й����ְ칫�һ�Ҫ��', '320300310000', 'bgsjyk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300310400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300310500', '�����й����ְ칫�Ҷ�����', '320300310000', 'bgsdyekddk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300310500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300310600', '����ʡ�����й����ְ칫��ͳ�ƿ�', '320300310000', 'bgstjk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300310600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300310700', '����ʡ�����й����ְ칫����վ�����', '320300310000', 'bgswzglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300310700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030031a000', '�칫����������������', '320300310000', 'bgswlylydk', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030031a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300320000', '�����й����ּ�ί', '320300000000', 'jw', 51, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300320000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300320100', '�����й����ּ�ί�ۺϴ�', '320300320000', 'jwzhc', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300320100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300320200', '�����й����ּ�ί������鴦', '320300320000', 'jwajjcc', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300320200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300320300', '�����й����ּ�ί��������', '320300320000', 'jwajslc', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300320300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300330000', '�����й�����ָ������', '320300000000', 'zhzx', 0, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300330000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300330100', '�����й�����ָ�������ۺϿ�', '320300330000', 'zhzxzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300330100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300330200', '�����й�����ָ������ָ�ӵ��ȿ�', '320300330000', 'zhzxzhddk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300330200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300330202', '�����й�����ָ������ָ�ӵ��ȿ�һ��', '320300330200', 'zhzxzhddkyg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300330202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300330204', '�����й�����ָ������ָ�ӵ��ȿƶ���', '320300330200', 'zhzxzhddkeg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300330204', '0', '1', null);
commit;
prompt 400 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300330206', '�����й�����ָ������ָ�ӵ��ȿ�����', '320300330200', 'zhzxzhddksg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300330206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300330208', '�����й�����ָ������ָ�ӵ��ȿ��Ĺ�', '320300330200', 'zhzxzhddksg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300330208', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300330300', 'ָ������Ѳ��ָ����', '320300330000', 'zhzxxfzzdk', 1, 0, 0, '20130626����', null, null, null, null, null, null, '320300330300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300000000', '�����й�����', '-1', 'xzsgaj', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300000000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300010000', '���ڰ�ȫ����֧��', '320300000000', 'gbzd', 22, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300010000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300010100', '�����й����ֹ��ڰ�ȫ�������ۺϿ�', '320300010000', 'gbzdzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300010100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300010200', '�����й����ֹ��ڰ�ȫ������һ��', '320300010000', 'gbzdydd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300010200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300010300', '�����й����ֹ��ڰ�ȫ����������', '320300010000', 'gbzdedd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300010300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300010400', '�����й����ֹ��ڰ�ȫ����������', '320300010000', 'gbzdsdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300010400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300010500', '�����й����ֹ��ڰ�ȫ�������Ŀ�', '320300010000', 'gnaqbwcsk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300010500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300010600', '�����й����ֹ��ڰ�ȫ���������', '320300010000', 'gbzdwdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300010600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300010700', '�����й����ֹ��ڰ�ȫ����������', '320300010000', 'gnaqbwclk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300010700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300020000', '�����й����־���֧��', '320300000000', 'jzzd', 23, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300020000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300020200', '�����й����־���֧���ۺϿ�', '320300020000', 'jzzdzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300020200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300020204', '�����й����־���֧���ۺϿ������', '320300020200', 'jzzdzhkmsg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300020204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300020206', '�����й����־���֧���ۺϿƷ��ƹ�', '320300020200', 'jzzdzhkfzg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300020206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300020400', '�����й����־���֧��һ���', '320300020000', 'jzzdydd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300020400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300020402', '�����й����־���֧��һ���һ�ж�', '320300020400', 'jzzdyddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300020402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300020404', '�����й����־���֧��һ��Ӷ��ж�', '320300020400', 'jzzdyddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300020404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300020600', '�����й����־���֧�Ӷ����', '320300020000', 'jzzdedd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300020600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300020602', '�����й����־���֧�Ӷ����һ�ж�', '320300020600', 'jzzdeddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300020602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300020604', '�����й����־���֧�Ӷ���Ӷ��ж�', '320300020600', 'jzzdeddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300020604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300020800', '�����й����־���֧�������', '320300020000', 'jzzdsdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300020800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300020802', '�����й����־���֧�������һ�ж�', '320300020800', 'jzzdsddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300020802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300020804', '�����й����־���֧������Ӷ��ж�', '320300020800', 'jzzdsddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300020804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300021000', '�����й����־���֧���Ĵ��', '320300020000', 'jzzdsdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300021000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300021002', '�����й����־���֧���Ĵ��һ�ж�', '320300021000', 'jzzdsddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300021002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300021004', '�����й����־���֧���Ĵ�Ӷ��ж�', '320300021000', 'jzzdsddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300021004', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300021200', '����ʡ�����й����־���֧������', '320300020000', 'jzzdwdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300021200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302WB9432', '�����й�¥��������Ժ', '320302WB9400', 'xzsglqrmjcy', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302WB9432', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303000000', '�����й����������־�', '320300000000', 'ylfj', 2, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303000000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303010000', '�����־ֹ��ڰ�ȫ������', '320303000000', 'ylfjgbdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303010000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303020000', '�����־־�����', '320303000000', 'ylfjjadd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303020000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303030000', '�����־��ΰ����', '320303000000', 'ylfjzadd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303030000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303030100', '����ʡ�����й����������־��ΰ����Ѳ��һ�ж�', '320303030000', 'ylfjzaddyfyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303030100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303030200', '����ʡ�����й����������־��ΰ����Ѳ�����ж�', '320303030000', 'ylfjzaddyfezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303030200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030502', '�����й������ΰ�֧�Ӱ����鴦һ���һ�ж�', '320300030500', 'zazdajccyddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030502', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030504', '�����й������ΰ�֧�Ӱ����鴦һ��Ӷ��ж�', '320300030500', 'zazdajccyddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030504', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030600', '�����й������ΰ�֧�Ӱ����鴦�����', '320300030000', 'zazdajccedd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030602', '�����й������ΰ�֧�Ӱ����鴦�����һ�ж�', '320300030600', 'zazdajcceddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030604', '�����й������ΰ�֧�Ӱ����鴦����Ӷ��ж�', '320300030600', 'zazdajcceddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030800', '�����й������ΰ�֧���ΰ���', '320300030000', 'zzzdsdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030802', '�����й������ΰ�֧���ΰ������й����', '320300030800', 'zazdzaktxglg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171606', '�����й����ֽ�ͨ����֧���������һ�ж�', '320300171600', 'jyjzdylddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171606', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171608', '�����й����ֽ�ͨ����֧��������Ӷ��ж�', '320300171600', 'jyjzdylddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171608', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171610', '�����й����ֽ�ͨ����֧������������ж�', '320300171600', 'jyjzdylddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171610', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300380100', '�����й��������β������������', '320300380000', 'zzbxccmsk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300380100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300380200', '�����й��������β�����������������', '320300380000', 'zzbxccdwxck', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300380200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300380300', '�����й��������β���������Ϣ���п�', '320300380000', 'zzbxccxxdyk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300380300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030804', '�����й������ΰ�֧���ΰ��ƹ������������', '320300030800', 'zazdzakggcsglg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030806', '�����й������ΰ�֧���ΰ��������', '320300030800', 'zazdzakmsg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030806', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030808', '����ʡ�����й������ΰ�֧���ΰ���Ȯ�����칫��', '320300030800', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320300030808', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030900', '�����й������ΰ�֧�ӻ�����', '320300030000', 'zzzdwdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030900', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030901', '�����й������ΰ�֧�ӻ����������', '320300030900', 'zazdhzkmsg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030901', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030902', '�����й������ΰ�֧�ӻ����ƻ�����', '320300030900', 'zazdhzkhjg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030902', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030904', '�����й������ΰ�֧�ӻ����ƻ�����', '320300030900', 'zazdhzkjcg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030904', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030906', '�����й������ΰ�֧�ӻ����Ʊ߾�֤�칫��', '320300030900', 'zazdhzkbjzbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030906', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030908', '�����й������ΰ�֧�ӻ����Ʊ��������', '320300030900', 'zazdhzkbaglg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030908', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300031000', '�������ΰ�֧���ΰ���Ȯ�����칫��', '320300030000', 'gajzazdzakqlglbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300031000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300031200', '�����й������ΰ�֧��Σ����Ʒ�����', '320300030000', 'zzzdldd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300031200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300031202', '�����й������ΰ�֧��Σ����Ʒ����Ʊ�ը��Ʒ�����', '320300031200', 'zazdwxwpglkbzwpglg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300031202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300031204', '�����й������ΰ�֧��Σ����Ʒ�����ǹе�����', '320300031200', 'zazdwxwpglkqxglg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300031204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300031206', '�����й������ΰ�֧��Σ����Ʒ����ƾ綾��Ʒ�����', '320300031200', 'zazdwxwpglkjdwpglg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300031206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300031400', '�����й������ΰ�֧�Ӽ���Ԥ���칫��', '320300030000', 'zazdjsyfbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300031400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300031500', '�����й������ΰ�֧�����֤������', '320300030000', 'zazdsfzzzs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300031500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300031502', '�����й������ΰ�֧�����֤������������', '320300031500', 'zazdsfzzzszzg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300031502', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300031504', '�����й������ΰ�֧�����֤�����������', '320300031500', 'zazdsfzzzsglg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300031504', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300031600', '����ʡ�����й������ΰ�֧�������', '320300030000', 'gajzazdsdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300031600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300031602', '����ʡ�����й������ΰ�֧�������һ�ж�', '320300031600', 'jzazdsddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300031602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300031604', '����ʡ�����й������ΰ�֧������Ӷ��ж�', '320300031600', 'zazdsddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300031604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300040000', '���ݱ߷����վ', '320300000000', null, 40, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320300040000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300041000', '���ݱ߷����վ�ۺϰ칫��', '320300040000', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320300041000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300041010', '���ݱ߷����վִ��ҵ���', '320300041000', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320300041010', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300041020', '���ݱ߷����վ��Ҫ��ؿ�', '320300041000', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320300041020', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300041030', '���ݱ߷����վ��Ϣ����', '320300041000', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320300041030', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300041040', '���ݱ߷����վָ������', '320300041000', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320300041040', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300045010', '���ݱ߷����վ�����ж�', '320300040000', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320300045010', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300050000', '�����й������̾�֧��', '320300000000', 'xjzd', 25, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300050000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300050200', '�����й������̾�֧�Ӽ�ί', '320300050000', 'xjzdjw', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300050200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300050400', '�����й������̾�֧���ۺϿ�', '320300050000', 'xjzdzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300050400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300050402', '�����й������̾�֧���ۺϿƺ��ڹ����', '320300050400', 'xjzdzhkhqglg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300050402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300050404', '�����й������̾�֧���ۺϿ������', '320300050400', 'xjzdzhkmsg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300050404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300050600', '�����й������̾�֧��������', '320300050000', 'xjzdzgk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300050600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300050800', '�����й������̾�֧�ӷ��ƿ�', '320300050000', 'xjzdfzk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300050800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051000', '�����й������̾�֧��һ���', '320300050000', 'xjzdydd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160204', '�����й������ؾ�֧���ۺϿ�ҵ���', '320300160200', 'tjzdzhkywg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160400', '�����й������ؾ�֧��һ���', '320300160000', 'txjzdydd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160402', '�����й������ؾ�֧��һ���һ�ж�', '320300160400', 'tjzdyddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160404', '�����й������ؾ�֧��һ��Ӷ��ж�', '320300160400', 'tjzdyddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160406', '����ʡ�����й������ؾ�֧��һ������ж�', '320300160400', 'tjzdyddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160406', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160600', '�����й������ؾ�֧�Ӷ����', '320300160000', 'txjzdedd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160602', '�����й������ؾ�֧�Ӷ����һ�ж�', '320300160600', 'tjzdeddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171612', '�����й����ֽ�ͨ����֧������������ж�', '320300171600', 'jyjzdylddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171612', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171614', '�����й����ֽ�ͨ����֧������������ж�', '320300171600', 'jyjzdylddwzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171614', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171616', '�����й����ֽ�ͨ����֧������������ж�', '320300171600', 'jyjzdylddlzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171616', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171618', '�����й����ֽ�ͨ����֧����������¹ʴ����ж�', '320300171600', 'jyjzdylddsgclzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171618', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171620', '����ʡ�����й����ֽ�ͨ����֧�ӹ�¥������ж�', '320300171600', 'jyjzdglddpzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171620', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171800', '�����й����ֽ�ͨ����֧�ӹ�¥���', '320300170000', 'jjzdgldd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171801', '�����й����ֽ�ͨ����֧�ӹ�¥�����������', '320300171800', 'jyjzdglddzggs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171801', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171802', '�����й����ֽ�ͨ����֧�ӹ�¥����ۺϹ�', '320300171800', 'jyjzdglddzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171802', '0', '1', null);
commit;
prompt 500 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171804', '�����й����ֽ�ͨ����֧�ӹ�¥���ҵ���', '320300171800', 'jyjzdglddywg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171806', '�����й����ֽ�ͨ����֧�ӹ�¥���һ�ж�', '320300171800', 'jyjzdglddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171806', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171808', '�����й����ֽ�ͨ����֧�ӹ�¥��Ӷ��ж�', '320300171800', 'jyjzdglddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171808', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171810', '�����й����ֽ�ͨ����֧�ӹ�¥������ж�', '320300171800', 'jyjzdglddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171810', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171812', '�����й����ֽ�ͨ����֧�ӹ�¥������ж�', '320300171800', 'jyjzdglddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171812', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171814', '�����й����ֽ�ͨ����֧�ӹ�¥������ж�', '320300171800', 'jyjzdglddwzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171814', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171816', '�����й����ֽ�ͨ����֧�ӹ�¥������ж�', '320300171800', 'jyjzdglddlzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171816', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171818', '�����й����ֽ�ͨ����֧�ӹ�¥����¹ʴ����ж�', '320300171800', 'jyjzdglddsgclzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171818', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300171820', '����ʡ�����й����ֽ�ͨ����֧������������ж�', '320300171800', 'jyjzdylddpzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300171820', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172000', '�����й����ֽ�ͨ����֧��Ȫɽ���', '320300170000', 'jjzdqsdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172001', '�����й����ֽ�ͨ����֧��Ȫɽ�����������', '320300172000', 'jyjzdqsddzggs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172001', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172002', '�����й����ֽ�ͨ����֧��Ȫɽ����ۺϹ�', '320300172000', 'jyjzdqsddzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172004', '�����й����ֽ�ͨ����֧��Ȫɽ���ҵ���', '320300172000', 'jyjzdqsddywg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172004', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172006', '�����й����ֽ�ͨ����֧��Ȫɽ���һ�ж�', '320300172000', 'jyjzdqsddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172006', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172008', '�����й����ֽ�ͨ����֧��Ȫɽ��Ӷ��ж�', '320300172000', 'jyjzdqsddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172008', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172010', '�����й����ֽ�ͨ����֧��Ȫɽ������ж�', '320300172000', 'jyjzdqsddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172010', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172012', '�����й����ֽ�ͨ����֧��Ȫɽ������ж�', '320300172000', 'jyjzdqsddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172012', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172014', '�����й����ֽ�ͨ����֧��Ȫɽ������ж�', '320300172000', 'jyjzdqsddwzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172014', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172016', '�����й����ֽ�ͨ����֧��Ȫɽ������ж�', '320300172000', 'jyjzdqsddlzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172016', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172018', '�����й����ֽ�ͨ����֧��Ȫɽ������ж�', '320300172000', 'jyjzdqsddpzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172018', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172020', '�����й����ֽ�ͨ����֧��Ȫɽ��Ӱ��ж�', '320300172000', 'jyjzdqsddbzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172020', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172022', '�����й����ֽ�ͨ����֧��Ȫɽ����¹ʴ����ж�', '320300172000', 'jyjzdqsddsgclzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172022', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172200', '�����й����ֽ�ͨ����֧�Ӿ�����', '320300170000', 'jjzdjldd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172201', '�����й����ֽ�ͨ����֧�Ӿ�������������', '320300172200', 'jyjzdjlddzggs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172202', '�����й����ֽ�ͨ����֧�Ӿ������ۺϹ�', '320300172200', 'jyjzdjlddzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172204', '�����й����ֽ�ͨ����֧�Ӿ�����ҵ���', '320300172200', 'jyjzdjlddywg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173026', '�����й����ֽ�ͨ����֧���ΰ����ڴ��Ѳ��һ�ж�', '320300173000', 'jyjzdzakkddylyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173026', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173028', '�����й����ֽ�ͨ����֧���ΰ����ڴ��Ѳ�߶��ж�', '320300173000', 'jyjzdzakkddylezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173028', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173300', '�����й����ֽ���֧��ָ������', '320300170000', 'xzsgajjjzdzhzx', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320300173300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172408', '�����й����ֽ�ͨ����֧���¹ʴ����Ӷ��ж�', '320300172400', 'jyjzdsgclddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172408', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172410', '����ʡ�����й����ֽ�ͨ����֧���¹ʴ��������ж�', '320300172400', 'jyjzdsgclddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172410', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172412', '�����й����ֽ�ͨ����֧���¹ʴ��������ж�', '320300172400', 'jyjzdsgclddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172412', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172414', '�����й����ֽ�ͨ����֧���¹ʴ��������ж�', '320300172400', 'jyjzdsgclddwzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172414', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172416', '�����й����ֽ�ͨ����֧���¹ʴ��������ж�', '320300172400', 'jyjzdsgclddlzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172416', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172600', '�����й����ֽ�ͨ����֧����ʩ���', '320300170000', 'jjzdssdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172602', '�����й����ֽ�ͨ����֧����ʩ����ۺϹ�', '320300172600', 'jyjzdssddzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172604', '�����й����ֽ�ͨ����֧����ʩ��ӹ����ж�', '320300172600', 'jyjzdssddgczd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172606', '�����й����ֽ�ͨ����֧����ʩ��ӱ����ж�', '320300172600', 'jyjzdssddbxzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172606', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172700', '�����й����ֽ�ͨ����֧�Ӿ�̨�������վ', '320300170000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172800', '�����й����ֽ�ͨ����֧�ӻ������', '320300170000', 'jjzdjddd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172802', '�����й����ֽ�ͨ����֧�ӻ�������ۺϹ�', '320300172800', 'jyjzdjdddzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172804', '�����й����ֽ�ͨ����֧�ӻ������һ�ж�', '320300172800', 'jyjzdjdddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172806', '�����й����ֽ�ͨ����֧�ӻ�����Ӷ��ж�', '320300172800', 'jyjzdjdddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172806', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172808', '����ʡ�����й����ֽ�ͨ����֧�ӻ���������ж�', '320300172800', 'jyjzdjdddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172808', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172900', '�����й����ֽ�ͨ����֧�Ӻ컨���������վ', '320300170000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300330400', 'ָ�������鱨��Ϣ��', '320300330000', 'zhzxqbxxk', 1, 0, 0, '20130626����', null, null, null, null, null, null, '320300330400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300340000', '�����й����־��񶽲�֧��', '320300000000', 'jwddzd', 37, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300340000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300340100', '�����й����־��񶽲��������', '320300340000', 'jwdczdzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300340100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300340200', '�����й����־��񶽲���һ�ж�', '320300340000', 'jwdczdyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300340200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160604', '�����й������ؾ�֧�Ӷ���Ӷ��ж�', '320300160600', 'tjzdeddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160800', '�����й������ؾ�֧�������', '320300160000', 'txjzdsdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160802', '�����й������ؾ�֧�������һ�ж�', '320300160800', 'tjzdsddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300160804', '�����й������ؾ�֧������Ӷ��ж�', '320300160800', 'tjzdsddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300160804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300161000', '�����й������ؾ�֧���Ĵ��', '320300160000', 'txjzdsdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300161000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300161002', '�����й������ؾ�֧���Ĵ��һ�ж�', '320300161000', 'tjzdsddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300161002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300161004', '�����й������ؾ�֧���Ĵ�Ӷ��ж�', '320300161000', 'tjzdsddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300161004', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030016a000', '��Ѳ��֧��������', '320300160000', 'txjzdzgk', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030016a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030016a100', '��Ѳ��֧��Ѳ��ָ����', '320300160000', 'txjzdxfzdk', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030016a100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030016a200', '��Ѳ��֧������', '320300160000', 'txjzdwdd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030016a200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170000', '�����й����ֽ�ͨ����֧��', '320300000000', 'jjzd', 33, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170200', '�����й����ֽ�ͨ����֧�Ӽ�ί', '320300170000', 'jjzdjw', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170400', '�����й����ֽ�ͨ����֧�ӹ���', '320300170000', 'jjzdgh', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170600', '�����й����ֽ�ͨ����֧���ۺϿ�', '320300170000', 'jjzdzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170602', '�����й����ֽ�ͨ����֧���ۺϿ������', '320300170600', 'jyjzdzhkmsg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170606', '�����й����ֽ�ͨ����֧���ۺϿƺ��ڹ����', '320300170600', 'jyjzdzhkhqglg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170606', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170607', '�����й����ֽ�ͨ����֧���ۺϿ�װ����', '320300170600', 'jyjzdzhkzbg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170607', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170608', '�����й����ֽ�ͨ����֧���ۺϿ�С����', '320300170600', 'jyjzdzhkxcd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170608', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170700', '�����й����ֽ�ͨ����֧��������', '320300170000', 'jjzdzgk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170702', '�����й����ֽ�ͨ����֧�����������¹����', '320300170700', 'jyjzdzgkrsglg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170702', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170704', '�����й����ֽ�ͨ����֧��������������', '320300170700', 'jyjzdzgkxcg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170704', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170706', '�����й����ֽ�ͨ����֧�������ƽ�����', '320300170700', 'jyjzdzgkjyg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170706', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170800', '�����й����ֽ�ͨ����֧�ӽ�ͨ��������', '320300170000', 'jjzdjtzxglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300170802', '�����й����ֽ�ͨ����֧�ӽ�ͨ���������ۺϹ�', '320300170800', 'jyjzdjtzxglkzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300170802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300390000', '�����й����ֻ��ص�ί', '320300000000', 'jgdw', 54, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300390000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300390200', '�����й����ֹ���', '320300390000', 'gh', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300390200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300390400', '�����й�������ί', '320300390000', 'tw', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300390400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300400000', '�����й������ϸɲ���', '320300350000', 'zzbltxgbc', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300400000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300430000', '�������Ͷ���������ίԱ��', '320300000000', 'xzsldjyglwyh', 63, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300430000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300440000', '�����й��������񾯲���ѵѧУ', '320300000000', 'rmjcpyyx', 56, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300440000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300440400', '�����й��������񾯲���ѵѧУ�ۺϿ�', '320300440000', 'rmjcpyyxzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300440400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300440600', '�����й��������񾯲���ѵѧУ�����', '320300440000', 'rmjcpyyxjwk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300440600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300440601', '�����й��������񾯲���ѵѧУ����ƿƼ���', '320300440600', 'rmjcpyyxjwkkjg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300440601', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300440603', '�����й��������񾯲���ѵѧУ��������̹�', '320300440600', 'rmjcpyyxjwkzjg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300440603', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300440605', '�����й��������񾯲���ѵѧУ����Ʒ��ƹ�', '320300440600', 'rmjcpyyxjwkfzg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300440605', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300440607', '�����й��������񾯲���ѵѧУ�����ҵ���', '320300440600', 'rmjcpyyxjwkywg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300440607', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300440700', '�����й��������񾯲���ѵѧУ��ѵ��', '320300440000', 'rmjcpyyxpyk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300440700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300440701', '����ʡ�����й��������񾯲���ѵѧУ��ѵ�ƾ����ܽ��й�', '320300440700', 'rmjcpyyxpykjwjnjyg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300440701', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173400', '�����й����ֽ�ͨ����֧�ӳ�����', '320300170000', 'jjzdcgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300173401', '�����й����ֽ�ͨ����֧�ӳ����������ͼ�', '320300173400', 'jyjzdcgszgjj', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300173401', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030027a000', '���ֲ�����֧���ۺϿ�', '320300270000', 'fkbgzzdzhk', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030027a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174300', '�����й����ֽ�ͨ����֧�Ӵ��ʹ��', '320300170000', 'jjzddtdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174400', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·�Ĵ��', '320300170000', 'jjzdgsglsdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174402', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·�Ĵ���ۺϹ�', '320300174400', 'jyjzdgsglsddzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174404', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·�Ĵ��һ�ж�', '320300174400', 'jyjzdgsglsddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174406', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·�Ĵ�Ӷ��ж�', '320300174400', 'jyjzdgsglsddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174406', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174500', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·�����', '320300170000', 'jjzdgsglglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174600', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·�����', '320300170000', 'jjzdgsglldd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174700', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·����', '320300170000', 'jjzdgsglwdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174702', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·�����ۺϹ�', '320300174700', 'jyjzdgsglwddzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174702', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174706', '�����й����ֽ�ͨ����֧�Ӹ��ٹ�·���Ӷ��ж�', '320300174700', 'jyjzdgsglwddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300174706', '0', '1', null);
commit;
prompt 600 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174800', '�����й����ֽ���֧�Ӹ��ٹ�·�ߴ��', '320300170000', 'jjzdgsqdd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320300174800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174802', '�����й����ֽ���֧�Ӹ��ٹ�·�ߴ��һ�ж�', '320300174800', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174804', '�����й����ֽ���֧�Ӹ��ٹ�·�ߴ�Ӷ��ж�', '320300174800', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174806', '�����й����ֽ���֧�Ӹ��ٹ�·�ߴ�����ж�', '320300174800', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174808', '�����й����ֽ���֧�Ӹ��ٹ�·�ߴ�����ж�', '320300174800', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174900', '�����й����ֽ�ͨ����֧�Ӹ߼ܿ���·���', '320300170000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174902', '�����й����ֽ�ͨ����֧�Ӹ߼ܿ���·���ҵ���', '320300174900', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174904', '�����й����ֽ�ͨ����֧�Ӹ߼ܿ���·���һ�ж�', '320300174900', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174906', '�����й����ֽ�ͨ����֧�Ӹ߼ܿ���·��Ӷ��ж�', '320300174900', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303030300', '����ʡ�����й����������־��ΰ����Ѳ�����ж�', '320303030000', 'ylfjzaddyfszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303030300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303030400', '����ʡ�����й����������־��ΰ����Ѳ�����ж�', '320303030000', 'ylfjzaddyfszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303030400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303050000', '�����־��̾����', '320303000000', 'ylfjxjdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303050000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303050200', '�����־��̾���Ӱ칫��', '320303050000', 'ylfjxjddbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303050200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303050400', '�����־��̾����һ�ж�', '320303050000', 'ylfjxjddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303050400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174908', '�����й����ֽ�ͨ����֧�Ӹ߼ܿ���·������ж�', '320300174900', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300174910', '�����й����ֽ�ͨ����֧�Ӹ߼ܿ���·����¹��ж�', '320300174900', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030017a000', '����֧�ӹ�����ͨ���', '320300170000', 'jjzdggjtdd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030017a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030017a100', '����֧�Ӹ߼ܿ���·���', '320300170000', 'jjzdgjksldd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030017a100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300180000', '�����й����ַ��ƴ�', '320300000000', 'fzzd', 34, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300180000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300180100', '�����й����ַ��ƴ������', '320300180000', 'jjzdzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300180100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300180200', '�����й����ַ��ƴ�����Ӧ�߿�', '320300180000', 'jjzdedfyys', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300180200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300180300', '�����й����ַ��ƴ�������˿�', '320300180000', 'jjzdwdajsh', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300180300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300180400', '�����й����ַ��ƴ�ִ���ල��', '320300180000', 'jjzdydfzjg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300180400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300180500', '�����й����ַ��ƴ��ͽ�������', '320300180000', 'jjzdsdajfk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300180500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300180600', '�����й����ַ��ƴ������', '320300180000', 'jjzdsdgf', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300180600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300200000', '�����й����ּƻ�����', '320300000000', 'jhcwc', 43, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300200000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300200100', '�����й����ּƻ����������', '320300200000', 'jhcwcmsk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300200100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300200200', '�����й����ּƻ����񴦲���һ��', '320300200000', 'jhcwccwyk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300200200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300200300', '�����й����ּƻ����񴦲������', '320300200000', 'jhcwccwek', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300200300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300200400', '�����й����ּƻ����������־ֲ����', '320300200000', 'jhcwcylfjcwg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300200400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300200500', '�����й����ּƻ����񴦹�¥�־ֲ����', '320300200000', 'jhcwcglfjcwg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300200500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300200600', '�����й����ּƻ�����Ȫɽ�־ֲ����', '320300200000', 'jhcwcqsfjcwg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300200600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300200700', '�����й����ּƻ����񴦾���־ֲ����', '320300200000', 'jhcwcjlfjcwg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300200700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300200800', '�����й����ּƻ����񴦹㳡�־ֲ����', '320300200000', 'jhcwcgcfjcwg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300200800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300200900', '�����й����ּƻ����񴦾�У�����', '320300200000', 'jhcwcjxcwg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300200900', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300201000', '�����й����ּƻ������ΰ�֧�Ӳ����', '320300200000', 'jhcwczazdcwg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300201000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303550108', '�����־������ɳ����������ж��ӷ�ɽ������', '320303550100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300201100', '�����й����ּƻ����񴦽�ͨ����֧�Ӳ����', '320300200000', 'jhcwcjyjzdcwg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300201100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300201200', '�����й����ּƻ������̾�֧�Ӳ����', '320300200000', 'jhcwcxjzdcwg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300201200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300210000', '�����й����ֽ���֧��', '320300000000', 'jdzd', 35, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300210000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300210100', '�����й����ֽ����������', '320300210000', 'jdzdzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300210100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300210200', '�����й����ֽ�����������', '320300210000', 'jdcjdk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300210200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300210300', '�����й����ֽ�����������', '320300210000', 'jdcjdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300210300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300220000', '����ʡ�����й����ֿƼ���', '320300000000', 'kjc', 62, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300220000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300230000', '�����й�������Ϣͨ�Ŵ�', '320300000000', 'xxtxc', 45, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300230000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300230200', '�����й�������Ϣͨ�Ŵ������Ӧ�ÿ�', '320300230000', 'xxtxcyykfk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300230200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300230400', '�����й�������Ϣͨ�Ŵ����߿�', '320300230000', 'xxtxcwxglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300230400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300230600', '�����й�������Ϣͨ�Ŵ����߿�', '320300230000', 'xxtxcwlglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300230600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300230800', '�����й�������Ϣͨ�Ŵ��Źܿ�', '320300230000', 'xxtxcxxglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300230800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300231000', '�����й�������Ϣͨ�Ŵ������', '320300230000', 'xxtxcmsk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300231000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051002', '�����й������̾�֧��һ���һ�ж�', '320300051000', 'xjzdyddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070308', '�����й�������֧�Ӻ��ڴ�������', '320300070300', 'xzsgaxfzdhqcxls', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070308', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070309', '�����й�������֧�Ӻ��ڴ�����ʳ��', '320300070300', 'xzsgaxfzdhqcjgst', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070309', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070310', '�����й�������֧�Ӻ��ڴ��д���', '320300070300', 'xzsgaxfzdhqczds', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070310', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070400', '�����й�������֧�ӷ���', '320300070000', 'xzsgaxfzdfhc', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070401', '�����й�������֧�ӷ��𴦼ල�����', '320300070400', 'xzsgaxfzdfhcjdglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070401', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070402', '�����й�������֧�ӷ��𴦽�����˿�', '320300070400', 'xzsgaxfzdfhcjzshk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070403', '�����й�������֧�ӷ��𴦷��ƿ�', '320300070400', 'xzsgaxfzdfhcfzk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070403', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070404', '�����й�������֧�ӷ����ص㱣����', '320300070400', 'xzsgaxfzdfhczdbwk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070405', '�����й�������֧�ӷ������տ�', '320300070400', 'xzsgaxfzdfhcysk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070405', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070406', '�����й�������֧�ӷ��𴦻���ԭ������', '320300070400', 'xzsgaxfzdfhchzyydck', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070406', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070407', '�����й�������֧�ӷ�����������', '320300070400', 'xzsgaxfzdfhcxczx', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070407', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070500', '�����й�������֧�����ڴ��', '320300070000', 'xzsgaxfzdtqdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070501', '�����й�������֧�����ڴ��һ�ж�', '320300070500', 'xzsgaxfzdtqddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070501', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070502', '�����й�������֧�����ڴ�Ӷ��ж�', '320300070500', 'xzsgaxfzdtqddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070502', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300080000', '�����й����־�����', '320300000000', 'jwc', 61, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300080000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300090000', '��λ�ڲ���ȫ����֧��', '320300000000', 'dwnbaqbwzd', 28, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300090000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300090100', '�����й����־����Ļ������������', '320300090000', 'jjwhbwcmsk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300090100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300440702', '����ʡ�����й��������񾯲���ѵѧУ��ѵ��ѧԱ�����', '320300440700', 'rmjcpyyxpykyyglg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300440702', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300440800', '�����й��������񾯲���ѵѧУ�����', '320300440000', 'rmjcpyyxzwk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300440800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300440801', '�����й��������񾯲���ѵѧУ�����������', '320300440800', 'rmjcpyyxzwkxzg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300440801', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300440803', '�����й��������񾯲���ѵѧУ�������ʳ��', '320300440800', 'rmjcpyyxzwkssg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300440803', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300460000', '�����й���������֯�������֧��', '320300000000', 'yzzfzzczd', 38, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300460000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300460200', '�����й���������֯�������֧�����һ��', '320300460000', 'yzzfzzczdzcyd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300460200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172206', '�����й����ֽ�ͨ����֧�Ӿ�����һ�ж�', '320300172200', 'jyjzdjlddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172208', '�����й����ֽ�ͨ����֧�Ӿ����Ӷ��ж�', '320300172200', 'jyjzdjlddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172208', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172210', '�����й����ֽ�ͨ����֧�Ӿ��������ж�', '320300172200', 'jyjzdjlddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172210', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172212', '�����й����ֽ�ͨ����֧�Ӿ��������ж�', '320300172200', 'jyjzdjlddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172212', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172214', '�����й����ֽ�ͨ����֧�Ӿ������¹ʴ����ж�', '320300172200', 'jyjzdjlddsgclzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172214', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172300', '�����й����ֽ�ͨ����֧�Ӿ��ü������������', '320300170000', 'jjzdjjjskfqdd', 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172301', '�����й����ֽ�ͨ����֧�Ӿ��ü������������ҵ���', '320300172300', null, 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172301', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172302', '�����й����ֽ�ͨ����֧�Ӿ��ü�������������ۺϹ�', '320300172300', null, 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172302', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300460400', '�����й���������֯�������֧��������', '320300460000', 'yzzfzzczdzced', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300460400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300460600', '�����й���������֯�������֧���鱨��', '320300460000', 'yzzfzzczdqbd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300460600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300460800', '�����й���������֯�������֧���ۺϿ�', '320300460000', 'yzzfzzczdzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300460800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030046a000', '����֯�������֧���������', '320300460000', 'yzzfzzczdzcsd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030046a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300a00000', '������ɷ���', '320300000000', 'xzxkfwc', 64, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320300a00000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300a10000', '�����еڶ�������', '320300000000', 'xzsdekss', 65, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320300a10000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300a20000', '������', '320300000000', 'jjb', 66, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320300a20000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300a30000', '������˾', '320300000000', 'bags', 67, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320300a30000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300a40000', '�侯֧��', '320300000000', 'wjzd', 60, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320300a40000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300a50000', '���β��ۺϴ�', '320300350000', 'zzbzhk', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320300a50000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300WB9431', '�������м�����Ժ', '320300WB9400', 'xzszjrmfy', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300WB9431', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300WB9432', '������������Ժ', '320300WB9400', 'xzsrmjcy', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300WB9432', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302000000', '�����й����ֹ�¥�־�', '320300000000', 'glfj', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302000000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302010000', '��¥�־ֹ��ڰ�ȫ������', '320302000000', 'glfjgbdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302010000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302020000', '��¥�־־�����', '320302000000', 'glfjjzdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302020000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302030000', '��¥�־��ΰ����', '320302000000', 'glfjzadd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302030000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302030100', '����ʡ�����й����ֹ�¥�־��ΰ����Ѳ��һ�ж�', '320302030000', 'glfjzaddyfyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302030100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302030200', '����ʡ�����й����ֹ�¥�־��ΰ����Ѳ�����ж�', '320302030000', 'glfjzaddyfezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302030200', '0', '1', null);
commit;
prompt 700 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302030300', '����ʡ�����й����ֹ�¥�־��ΰ����Ѳ�����ж�', '320302030000', 'glfjzaddyfszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302030300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302030400', '����ʡ�����й����ֹ�¥�־��ΰ����Ѳ�����ж�', '320302030000', 'glfjzaddyfszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302030400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302050000', '��¥�־��̾����', '320302000000', 'glfjxjdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302050000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302050200', '��¥�־��̾���Ӱ칫��', '320302050000', 'glfjxjddbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302050200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302050400', '��¥�־��̾����һ�ж�', '320302050000', 'glfjxjddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302050400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302050600', '��¥�־��̾���Ӷ��ж�', '320302050000', 'glfjxjddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302050600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302050800', '��¥�־��̾�������ж�', '320302050000', 'glfjxjddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302050800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302051000', '��¥�־��̾�������ж�', '320302050000', 'glfjxjddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302051000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302051200', '��¥�־��̾�������ж�', '320302050000', 'glfjxjddwzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302051200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302051400', '��¥�־��̾�������ж�', '320302050000', 'glfjxjddlzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302051400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302060000', '��¥�־ֳ��뾳�����', '320302000000', 'glfjcrjglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302060000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302070000', '�����й�������֧�ӹ�¥���������', '320302000000', 'xzsgaxfzdglqxfdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302070000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302070100', '�����й�������֧�ӹ�¥������ϼҹ��ж�', '320302070000', 'xzsgaxfzdglqddmjgzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302070100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560111', '��¥�־ֶ�վ�ɳ����������жӰ���������', '320302560100', 'glfjdzpcssqmjzdbzzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560200', '��¥�־ֶ�վ�ɳ����ΰ����ж�', '320302560000', 'glfjdzpcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560201', '��¥�־ֶ�վ�ɳ���Ѳ�ߴ����ж�', '320302560200', 'glfjdzpcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560300', '��¥�־ֶ�վ�ɳ����̾��ж�', '320302560000', 'glfjdzpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570000', '��¥�־ַ���ɳ���', '320302000000', 'glfjfcpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303050600', '�����־��̾���Ӷ��ж�', '320303050000', 'ylfjxjddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303050600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303050800', '�����־��̾�������ж�', '320303050000', 'ylfjxjddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303050800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303051000', '�����־��̾�������ж�', '320303050000', 'ylfjxjddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303051000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303051200', '�����־��̾�������ж�', '320303050000', 'ylfjxjddwzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320303051200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570100', '��¥�־ַ���ɳ����������ж�', '320302570000', 'glfjfcpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570101', '��¥�־ַ���ɳ����������жӽ���������', '320302570100', 'glfjfcpcssqmjzdjdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570102', '��¥�־ַ���ɳ����������ж���԰ͤ������', '320302570100', 'glfjfcpcssqmjzdytzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570103', '��¥�־ַ���ɳ����������ж���԰��������', '320302570100', 'glfjfcpcssqmjzdxygzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570104', '��¥�־ַ���ɳ����������ж�����������', '320302570100', 'glfjfcpcssqmjzdxzzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570105', '��¥�־ַ���ɳ����������ж�������������', '320302570100', 'glfjfcpcssqmjzdsjxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570106', '��¥�־ַ���ɳ����������ж�����������', '320302570100', 'glfjfcpcssqmjzdxxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570107', '��¥�־ַ���ɳ����������ж��½�������', '320302570100', 'glfjfcpcssqmjzdxjzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570108', '��¥�־ַ���ɳ����������жӰ���������', '320302570100', 'glfjfcpcssqmjzdbxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570109', '��¥�־ַ���ɳ����������ж�����������', '320302570100', 'glfjfcpcssqmjzdtdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570110', '��¥�־ַ���ɳ����������ж��˶�������', '320302570100', 'glfjfcpcssqmjzdxdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570111', '��¥�־ַ���ɳ����������жӺ���������', '320302570100', 'glfjfcpcssqmjzdhpzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570112', '��¥�־ַ���ɳ����������ж�����������', '320302570100', 'glfjfcpcssqmjzdtxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570114', '��¥�־ַ���ɳ����������жӶ���������', '320302570100', 'glfjfcpcssqmjzdepzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570114', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570115', '��¥�־ַ���ɳ����������ж�����������', '320302570100', 'glfjfcpcssqmjzdtjzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570115', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570116', '��¥�־ַ���ɳ����������жӶ��ӱ�������', '320302570100', 'glfjfcpcssqmjzdebbzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570116', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570117', '��¥�־ַ���ɳ����������жӸ���������', '320302570100', 'glfjfcpcssqmjzdfbzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570117', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570118', '��¥�־ַ���ɳ����������ж�ɳ��������', '320302570100', 'glfjfcpcssqmjzdshzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570118', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570200', '��¥�־ַ���ɳ����ΰ����ж�', '320302570000', 'glfjfcpcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570201', '��¥�־ַ���ɳ���Ѳ�ߴ����ж�', '320302570200', 'glfjfcpcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302570300', '��¥�־ַ���ɳ����̾��ж�', '320302570000', 'glfjfcpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302570300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302580000', '��¥�־���ׯ�ɳ���', '320302000000', 'glfjyzpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302580000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302580100', '��¥�־���ׯ�ɳ����������ж�', '320302580000', 'glfjyzpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302580100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302580101', '��¥�־���ׯ�ɳ����������ж��߷�������', '320302580100', 'glfjyzpcssqmjzdwfzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302580101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302580102', '��¥�־���ׯ�ɳ����������ж�ú������������', '320302580100', 'glfjyzpcssqmjzdmjdczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302580102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302580103', '��¥�־���ׯ�ɳ����������ж�ú������������', '320302580100', 'glfjyzpcssqmjzdmjxczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302580103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302580104', '��¥�־���ׯ�ɳ����������ж����������', '320302580100', 'glfjyzpcssqmjzdxgzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302580104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302580105', '��¥�־���ׯ�ɳ����������ж��µ�������', '320302580100', 'glfjyzpcssqmjzdxdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302580105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302580106', '��¥�־���ׯ�ɳ����������жӶ���С��������', '320302580100', 'glfjyzpcssqmjzdejxqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302580106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302580200', '��¥�־���ׯ�ɳ����ΰ����ж�', '320302580000', 'glfjyzpcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302580200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302580201', '��¥�־���ׯ�ɳ���Ѳ�ߴ����ж�', '320302580200', 'glfjyzpcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302580201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302580300', '��¥�־���ׯ�ɳ����̾��ж�', '320302580000', 'glfjyzpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302580300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590000', '��¥�־�ͭ���ɳ���', '320302000000', 'glfjtppcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590100', '��¥�־�ͭ���ɳ����������ж�', '320302590000', 'glfjtppcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590101', '��¥�־�ͭ���ɳ����������ж��򳡴塢���ִ�������', '320302590100', 'glfjtppcssqmjzdsccwczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590108', '��¥�־�ͭ���ɳ����������ж�ͭ��������', '320302590100', 'glfjtppcssqmjzdtjzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590109', '��¥�־�ͭ���ɳ����������жӱ���������', '320302590100', 'glfjtppcssqmjzdbgzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590110', '��¥�־�ͭ���ɳ����������ж�����������', '320302590100', 'glfjtppcssqmjzdxgzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590111', '��¥�־�ͭ���ɳ����������жӻ���������', '320302590100', 'glfjtppcssqmjzdjczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590112', '��¥�־�ͭ���ɳ����������жӻ�԰������', '320302590100', 'glfjtppcssqmjzdhyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590113', '��¥�־�ͭ���ɳ����������жӵ���������', '320302590100', 'glfjtppcssqmjzddbzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590113', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590114', '��¥�־�ͭ���ɳ����������жӸ���������', '320302590100', 'glfjtppcssqmjzdgnzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590114', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590200', '��¥�־�ͭ���ɳ����ΰ����ж�', '320302590000', 'glfjtppcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590201', '��¥�־�ͭ���ɳ���Ѳ�ߴ����ж�', '320302590200', 'glfjtppcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302590300', '��¥�־�ͭ���ɳ����̾��ж�', '320302590000', 'glfjtppcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302590300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600000', '��¥�־־����ɳ���', '320302000000', 'glfjgspcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600100', '��¥�־־����ɳ����������ж�', '320302600000', 'glfjgspcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600101', '��¥�־־����ɳ����������ж������������', '320302600100', 'glfjgspcssqmjzdtpczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600102', '��¥�־־����ɳ����������ж���¥��������', '320302600100', 'glfjgspcssqmjzdllczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600103', '��¥�־־����ɳ����������жӾ����������', '320302600100', 'glfjgspcssqmjzdjlczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600104', '��¥�־־����ɳ����������ж�ʡú����˾����������', '320302600100', 'glfjgspcssqmjzdsmjgsjczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600105', '��¥�־־����ɳ����������ж����Ӽ�������Ժ������', '320302600100', 'glfjgspcssqmjzdshjkjdxyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600106', '��¥�־־����ɳ����������ж����Ӽ����ض�Ժ������', '320302600100', 'glfjgspcssqmjzdshjkjddyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600107', '��¥�־־����ɳ����������ж����Ӽ�����̹��˴�������', '320302600100', 'glfjgspcssqmjzdshjklggrczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600108', '��¥�־־����ɳ����������жӹ�ɽ��������', '320302600100', 'glfjgspcssqmjzdgsczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600109', '��¥�־־����ɳ����������ж����ʹ�������', '320302600100', 'glfjgspcssqmjzdltczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600110', '��¥�־־����ɳ����������ж�����������', '320302600100', 'glfjgspcssqmjzdmezrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600111', '��¥�־־����ɳ����������жӿ�̽����������', '320302600100', 'glfjgspcssqmjzdktedzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302600300', '��¥�־־����ɳ����̾��ж�', '320302600000', 'glfjgspcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302600300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302610000', '��¥�־��ϼҹ�ˮ���ɳ���', '320302000000', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320302610000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302620000', '��¥�־���կˮ���ɳ���', '320302000000', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320302620000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302a00000', '��¥�־��ɳ�������ָ����', '320302000000', 'glfjpcsxfzdb', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320302a00000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302a10000', '��¥�־ֿ��ſ�', '320302000000', 'glfjkxk', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320302a10000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302a20000', '��¥�־ֵ�����', '320302000000', 'glfjdas', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320302a20000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302a30000', '��¥�־�ά�Ȱ�', '320302000000', 'glfjwwb', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320302a30000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302a40000', '��¥�־������', '320302000000', 'glfjzfb', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320302a40000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302a50000', '��¥�־ּƲƿ�', '320302000000', 'glfjjck', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320302a50000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302a60000', '��¥�־��������', '320302000000', 'glfjwadd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '320302a60000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030027a100', '���ֲ�����֧��һ��', '320300270000', 'fkbgzzdyd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030027a100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030027a200', '���ֲ�����֧�Ӷ���', '320300270000', 'fkbgzzded', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030027a200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300290000', '�����й�����ά���ȶ������쵼С��칫��', '320300000000', 'wwb', 48, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300290000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030029a000', 'ά�Ȱ���Ϣ���д�', '320300290000', 'wwbxxdyc', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030029a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030029a100', 'ά�Ȱ����綽�촦', '320300290000', 'wwblldbc', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030029a100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030029a200', 'ά�Ȱ�����ָ����', '320300290000', 'wwbwpzdc', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030029a200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300090200', '�����й����־����Ļ����������ñ�����', '320300090000', 'jjwhbwcjjbwk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300090200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300090300', '�����й����־����Ļ����������ر�����', '320300090000', 'jjwhbwcjgbwk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300090300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300090400', '�����й����־����Ļ���������ѧ������', '320300090000', 'jjwhbwcdybwk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300090400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300090500', '�����й����־����Ļ����������ڱ�����', '320300090000', 'jjwhbwcjrbwk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300090500', '0', '1', null);
commit;
prompt 800 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300090600', '�����й����־����Ļ������������鴦��', '320300090000', 'jjwhbwcajcck', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300090600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030002a000', '����֧�������', '320300020000', 'jzzdldd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030002a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030000', '�����й������ΰ�֧��', '320300000000', 'zazd', 24, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030200', '�����й������ΰ�֧�Ӽ�ί', '320300030000', 'zazdjw', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030300', '�����й������ΰ�֧���ۺϿ�', '320300030000', 'zazdzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030302', '�����й������ΰ�֧���ۺϿ������', '320300030300', 'zazdzhkmsg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030302', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300030306', '�����й������ΰ�֧���ۺϿƺ��ڹ����', '320300030300', 'zazdzhkhqglg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300030306', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051004', '�����й������̾�֧��һ��Ӷ��ж�', '320300051000', 'xjzdyddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051004', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051006', '�����й������̾�֧��һ������ж�', '320300051000', 'xjzdyddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051006', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051008', '�����й������̾�֧��һ������ж�', '320300051000', 'xjzdyddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051008', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051200', '�����й������̾�֧�Ӷ����', '320300050000', 'xjzdedd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051202', '�����й������̾�֧�Ӷ����һ�ж�', '320300051200', 'xjzdeddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300090700', '�����й����־����Ļ�������������������', '320300090000', 'jjwhbwcbwdwglk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300090700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172307', '�����й����ֽ���֧�Ӿ��ü�����������Ӹ����ж�', '320300172300', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300110000', '�����й�������Ϣ���簲ȫ��촦', '320300000000', 'wlaqbwzd', 29, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300110000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300110100', '�����й�������Ϣ���簲ȫ��촦��ȫ����', '320300110000', 'xxwlaqjccaqjck', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300110100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300110200', '�����й�������Ϣ���簲ȫ��촦�����鴦��', '320300110000', 'xxwlaqjccajcck', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300110200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300110300', '�����й�������Ϣ���簲ȫ��촦�����', '320300110000', 'xxwlaqjccmsk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300110300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300110400', '����ʡ�����й��������羯��֧���鱨����', '320300110000', 'wljczdqbzcd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300110400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300110500', '����ʡ�����й��������羯��֧�������ΰ���', '320300110000', 'wljczdwlzad', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300110500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300110600', '����ʡ�����й��������羯��֧�Ӽ����Բ߶�', '320300110000', 'wljczdjsdcd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300110600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300110700', '����ʡ�����й��������羯��֧���ۺϿ�', '320300110000', 'wljczdzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300110700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300120000', '�����й������ж�������', '320300000000', 'jszczd', 30, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300120000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300120100', '�����й������ж��������ۺϿ�', '320300120000', 'xdjsczhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300120100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300120200', '�����й������ж������������鱨��', '320300120000', 'xdjscgjqbd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300120200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300120300', '�����й������ж������������鱨��', '320300120000', 'xdjscgnqbd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300120300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300120400', '�����й������ж�������������ض�', '320300120000', 'xdjscdxzkd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300120400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300120500', '�����й������ж��������ۺ����һ��', '320300120000', 'xdjsczhzcyd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300120500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300120600', '�����й������ж��������ۺ�������', '320300120000', 'xdjsczhzced', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300120600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300120700', '����ʡ�����й������ж��������ܰ���ѯ��', '320300120000', 'xdjscsacyd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300120700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '3203001235', 'cscs1', '320300040000', 'cscs1', 1, 0, 0, 'sdfsdfsdf', '30032', '20141108100647', '30032', '20141108102045', '320300000000', '320300000000', '3203001235', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130000', '�����й����ּ��֧��', '320300000000', 'jgzd', 31, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130100', '�����й����ּ��������칫��', '320300130000', 'jsglcbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130200', '�����й����ּ�������ҵ��ָ����', '320300130000', 'jgzdywzdk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130300', '�����й����ּ�������һ��', '320300130000', 'jsglcyg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130400', '�����й����ּ�����������', '320300130000', 'jsglceg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130500', '�����й����ּ�����������', '320300130000', 'jsglcsg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130600', '�����й����ּ��������Ĺ�', '320300130000', 'jsglcsg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130700', '�����п�����', '320300130000', 'xzskss', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130701', '�����п������칫��', '320300130700', 'xzskssbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130701', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130702', '�����п�����һ�ж�', '320300130700', 'xzskssyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130702', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130703', '�����п��������ж�', '320300130700', 'xzskssezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130703', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130704', '�����п��������ж�', '320300130700', 'xzskssszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130704', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130705', '�����п��������ж�', '320300130700', 'xzskssszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130705', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '3203001307a0', '�����п��������ж�', '320300130700', 'xxsksswzd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '3203001307a0', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '3203001307a1', '�����п��������ж�', '320300130700', 'xxsksslzd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '3203001307a1', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130800', '�����й��������ݽ�����', '320300130000', 'srjys', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130801', '�����й��������ݽ������칫��', '320300130800', 'srjysbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130801', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130802', '�����й��������ݽ�����һ�ж�', '320300130800', 'srjysyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130803', '�����й��������ݽ��������ж�', '320300130800', 'srjysezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130803', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130804', '�����й��������ݽ��������ж�', '320300130800', 'srjysszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130805', '�����й��������ݽ��������ж�', '320300130800', 'srjysszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130805', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300130900', '����������������', '320300130000', 'xzsxzjls', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300130900', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300131000', '�����й����ֽ䶾��', '320300130000', 'qzgljds', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300131000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300131100', '�����й����־�����', '320300130000', 'jys', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300131100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300131101', '�����й����־������칫��', '320300131100', 'jysbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300131101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300131102', '�����й����־�����������', '320300131100', 'jysyzg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300131102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300131103', '�����й����־�����һ�ж�', '320300131100', 'jysyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300131103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300131104', '�����й����־��������ж�', '320300131100', 'jysezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300131104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300131105', '�����й����־��������ж�', '320300131100', 'jysszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300131105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300150000', '�����й������ŷô�', '320300000000', 'xfc', 42, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300150000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300150100', '�����й������ŷô������', '320300150000', 'xfcmsk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300150100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051204', '�����й������̾�֧�Ӷ���Ӷ��ж�', '320300051200', 'xjzdeddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051206', '�����й������̾�֧�Ӷ�������ж�', '320300051200', 'xjzdeddszd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051400', '�����й������̾�֧�������', '320300050000', 'xjzdsdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051402', '�����й������̾�֧�������һ�ж�', '320300051400', 'xjzdsddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051404', '�����й������̾�֧������Ӷ��ж�', '320300051400', 'xjzdsddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051600', '�����й������̾�֧���Ĵ��', '320300050000', 'xjzdsdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051602', '�����й������̾�֧���Ĵ��һ�ж�', '320300051600', 'xjzdsddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051604', '�����й������̾�֧���Ĵ�Ӷ��ж�', '320300051600', 'xjzdsddezd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051608', '����ʡ�����й������̾�֧���Ĵ������֯���ﰸ������ж�', '320300051600', 'xjzdsddyzzfzajzczd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051608', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051610', '����ʡ�����й������̾�֧���Ĵ�ӱ����ж��ж�', '320300051600', 'xjzdsddbyxdzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051610', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051800', '�����й������̾�֧������', '320300050000', 'xjzdwdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051802', '�����й������̾�֧�����ӷ�����', '320300051800', 'xjzdwddfhs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051804', '�����й������̾�֧�������ļ���', '320300051800', 'xjzdwddwjs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051806', '�����й������̾�֧�����Ӻۼ���', '320300051800', 'xjzdwddhjs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051806', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051808', '�����й������̾�֧�����Ӿ�Ȯ��', '320300051800', 'xjzdwddjqd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051808', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300051810', '�����й������̾�֧������ָ����', '320300051800', 'xjzdwddzws', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300051810', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300052000', '�����й������̾�֧�������', '320300050000', 'xjzdldd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, '3003622', '20160615102050', null, '320300000000', '320300052000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300052002', '����ʡ�����й������̾�֧��������鱨�����ж�', '320300052000', 'xjzdlddqbzlzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300052002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300052200', '����ʡ�����й������̾�֧���ߴ��', '320300050000', 'xjzdpdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300052200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030005a000', '�̾�֧�Ӱ˴��', '320300050000', 'xjzdbdd', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030005a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320303620300', '�����־ִ���ɽ�ɳ����̾��ж�', '320303620000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300060000', '�����й����ֳ��뾳����', '320300000000', 'crjglzd', 26, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300060000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300060100', '�����й����ֳ��뾳���������', '320300060000', 'crjglzdmsk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300060100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300060200', '�����й����ֳ��뾳������ܿ�', '320300060000', 'crjglzdwgk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300060200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300060300', '����ʡ�����й����ֳ��뾳�������뾳�����', '320300060000', 'crjglzdcrgjk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300060300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030006a000', '���뾳����֧�ӿڰ���', '320300060000', 'crjglzdkak', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030006a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '32030006a100', '���뾳����֧�ӷ�֤��', '320300060000', 'crjglzdfzs', 1, 0, 0, '�ֹ����20150210', null, null, null, null, null, null, '32030006a100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070000', '�����й�������֧��', '320300000000', 'xzsgaxfzd', 27, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070100', '�����й�������֧��˾�', '320300070000', 'xzsgaxfzdslb', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300070101', '�����й�������֧��˾��칫��', '320300070100', 'xzsgaxfzdslbbgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300070101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172303', '�����й����ֽ�ͨ����֧�Ӿ��ü������������һ�ж�', '320300172300', null, 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172303', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172304', '�����й����ֽ�ͨ����֧�Ӿ��ü�����������Ӷ��ж�', '320300172300', null, 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172304', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172305', '�����й����ֽ�ͨ����֧�Ӿ��ü���������������ж�', '320300172300', null, 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172305', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172306', '�����й����ֽ�ͨ����֧�Ӿ��ü�������������¹��ж�', '320300172300', null, 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172306', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172400', '�����й����ֽ�ͨ����֧���¹ʴ�����', '320300170000', 'jjzdsgcldd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172401', '�����й����ֽ�ͨ����֧���¹ʴ����������ͼ����', '320300172400', 'jyjzdsgclddzgjjgs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172401', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172402', '�����й����ֽ�ͨ����֧���¹ʴ������ۺϹ�', '320300172400', 'jyjzdsgclddzhg', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172404', '�����й����ֽ�ͨ����֧���¹ʴ������¹ʸ���', '320300172400', 'jyjzdsgclddsgfy', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172404', '0', '1', null);
commit;
prompt 900 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320300172406', '�����й����ֽ�ͨ����֧���¹ʴ�����һ�ж�', '320300172400', 'jyjzdsgclddyzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320300172406', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302180000', '��¥�־ַ��ƿ�', '320302000000', 'glfjfzdd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302180000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302230000', '��¥�־�ͨ�ſ�', '320302000000', 'glfjtxk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302230000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302310000', '��¥�־ְ칫��', '320302000000', 'glfjzhk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302310000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302320000', '��¥�־ּ�ί', '320302000000', 'glfjjw', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302320000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302330000', '��¥�־�ָ������', '320302000000', 'glfjqbzhs', 1, 0, 0, '20150126�ֶ�����', '30032', '20150126153829', null, null, '320300000000', null, '320302330000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302350000', '��¥�־�������', '320302000000', 'glfjzgk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302350000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302390000', '��¥�־ֹ���', '320302000000', 'glfjgh', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302390000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510000', '��¥�־ֻ����ɳ���', '320302000000', 'glfjhcpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510100', '��¥�־ֻ����ɳ����������ж�', '320302510000', 'glfjhcpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510101', '��¥�־ֻ����ɳ����������жӵ̱���������', '320302510100', 'glfjhcpcssqmjzddbczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510102', '��¥�־ֻ����ɳ����������жӻ���������', '320302510100', 'glfjhcpcssqmjzdhczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510103', '��¥�־ֻ����ɳ����������жӶ���������', '320302510100', 'glfjhcpcssqmjzddhzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510104', '��¥�־ֻ����ɳ����������жӰ���������', '320302510100', 'glfjhcpcssqmjzdbzzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510105', '��¥�־ֻ����ɳ����������ж�բ��������', '320302510100', 'glfjhcpcssqmjzdzkzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510106', '��¥�־ֻ����ɳ����������ж�բ��������', '320302510100', 'glfjhcpcssqmjzdzdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510107', '��¥�־ֻ����ɳ����������ж�բ��������', '320302510100', 'glfjhcpcssqmjzdzbzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510108', '��¥�־ֻ����ɳ����������ж�ú��������', '320302510100', 'glfjhcpcssqmjzdmgzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510109', '��¥�־ֻ����ɳ����������жӵ̱�������', '320302510100', 'glfjhcpcssqmjzddbzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510110', '��¥�־ֻ����ɳ����������жӶ�����������', '320302510100', 'glfjhcpcssqmjzdebwzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510111', '��¥�־ֻ����ɳ����������жӵ̶�������', '320302510100', 'glfjhcpcssqmjzdddzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510112', '��¥�־ֻ����ɳ����������ж��ĵ���������', '320302510100', 'glfjhcpcssqmjzdsdjzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510200', '��¥�־ֻ����ɳ����ΰ����ж�', '320302510000', 'glfjhcpcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510201', '��¥�־ֻ����ɳ���Ѳ�ߴ����ж�', '320302510200', 'glfjhcpcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302510300', '��¥�־ֻ����ɳ����̾��ж�', '320302510000', 'glfjhcpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302510300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520000', '��¥�־���¥�ɳ���', '320302000000', 'glfjplpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520100', '��¥�־���¥�ɳ����������ж�', '320302520000', 'glfjplpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520101', '��¥�־���¥�ɳ����������ж�6414����������', '320302520100', 'glfjplpcssqmjzd6414sszrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520102', '��¥�־���¥�ɳ����������жӻݹ�С��������', '320302520100', 'glfjplpcssqmjzdhgxqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520103', '��¥�־���¥�ɳ����������жӱ�Ҥ������', '320302520100', 'glfjplpcssqmjzdbyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520104', '��¥�־���¥�ɳ����������ж�����С��������', '320302520100', 'glfjplpcssqmjzdqyxqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520105', '��¥�־���¥�ɳ����������жӱ�վ������', '320302520100', 'glfjplpcssqmjzdbzzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520106', '��¥�־���¥�ɳ����������жӻ��Ļ�԰������', '320302520100', 'glfjplpcssqmjzdhxhyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520107', '��¥�־���¥�ɳ����������жӺ����԰������', '320302520100', 'glfjplpcssqmjzdhchyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520108', '��¥�־���¥�ɳ����������ж���������', '320302520100', 'glfjplpcssqmjzdmczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520109', '��¥�־���¥�ɳ����������ж��̽�������', '320302520100', 'glfjplpcssqmjzdljzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520110', '��¥�־���¥�ɳ����������жӹ�¥��԰������', '320302520100', 'glfjplpcssqmjzdglhyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520111', '��¥�־���¥�ɳ����������жӾ���С��������', '320302520100', 'glfjplpcssqmjzdjnxqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520112', '��¥�־���¥�ɳ����������жӽ�԰������', '320302520100', null, 1, 0, 0, '�ֹ����20130114', null, null, null, null, null, null, '320302520112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520200', '��¥�־���¥�ɳ����ΰ����ж�', '320302520000', 'glfjplpcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520201', '��¥�־���¥�ɳ���Ѳ�ߴ����ж�', '320302520200', 'glfjplpcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302520300', '��¥�־���¥�ɳ����̾��ж�', '320302520000', 'glfjplpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302520300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530000', '��¥�־������ɳ���', '320302000000', 'glfjwcpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530100', '��¥�־������ɳ����������ж�', '320302530000', 'glfjwcpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530101', '��¥�־������ɳ����������жӺ�÷������', '320302530100', 'glfjwcpcssqmjzdhmzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530102', '��¥�־������ɳ����������ж���ޱ������', '320302530100', 'glfjwcpcssqmjzdzzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530103', '��¥�־������ɳ����������жӳ���������', '320302530100', 'glfjwcpcssqmjzdcqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530104', '��¥�־������ɳ����������ж���ׯ��������', '320302530100', 'glfjwcpcssqmjzdzzczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530105', '��¥�־������ɳ����������ж����������', '320302530100', 'glfjwcpcssqmjzdxhzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530106', '��¥�־������ɳ����������жӶ�����·������', '320302530100', 'glfjwcpcssqmjzdehblzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530107', '��¥�־������ɳ����������ж��յ繫Ԣ������', '320302530100', 'glfjwcpcssqmjzdsdgyzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530108', '��¥�־������ɳ����������ж�������������', '320302530100', 'glfjwcpcssqmjzdwcczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530109', '��¥�־������ɳ����������жӽ���������', '320302530100', 'glfjwcpcssqmjzdjxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530110', '��¥�־������ɳ����������ж���Է��һ��������', '320302530100', 'glfjwcpcssqmjzdzylyczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530111', '��¥�־������ɳ����������ж���Է�����������', '320302530100', 'glfjwcpcssqmjzdzyleczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530112', '��¥�־������ɳ����������жӼ��廧������', '320302530100', 'glfjwcpcssqmjzdjthzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530200', '��¥�־������ɳ����ΰ����ж�', '320302530000', 'glfjwcpcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530201', '��¥�־������ɳ���Ѳ�ߴ����ж�', '320302530200', 'glfjwcpcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302530300', '��¥�־������ɳ����̾��ж�', '320302530000', 'glfjwcpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302530300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302540000', '��¥�־���ׯ�ɳ���', '320302000000', 'glfjzzpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302540000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302540100', '��¥�־���ׯ�ɳ����������ж�', '320302540000', 'glfjzzpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302540100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302540101', '��¥�־���ׯ�ɳ����������жӰ���������', '320302540100', 'glfjzzpcssqmjzdblzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302540101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302540102', '��¥�־���ׯ�ɳ����������ж���ׯ������', '320302540100', 'glfjzzpcssqmjzdyzzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302540102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302540103', '��¥�־���ׯ�ɳ����������ж�����������', '320302540100', 'glfjzzpcssqmjzdppzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302540103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302540104', '��¥�־���ׯ�ɳ����������ж��ϼҹ�������', '320302540100', 'glfjzzpcssqmjzdmjgzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302540104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302540105', '��¥�־���ׯ�ɳ����������ж�����������', '320302540100', 'glfjzzpcssqmjzdlwzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302540105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302540106', '��¥�־���ׯ�ɳ����������ж�̨��������', '320302540100', 'glfjzzpcssqmjzdtzzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302540106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302540107', '��¥�־���ׯ�ɳ����������ж���կ��������', '320302540100', 'glfjzzpcssqmjzdwzgzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302540107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302540108', '��¥�־���ׯ�ɳ����������ж���կ������', '320302540100', 'glfjzzpcssqmjzdwzzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302540108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302540200', '��¥�־���ׯ�ɳ����ΰ����ж�', '320302540000', 'glfjzzpcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302540200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302540201', '��¥�־���ׯ�ɳ���Ѳ�ߴ����ж�', '320302540200', 'glfjzzpcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302540201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302540300', '��¥�־���ׯ�ɳ����̾��ж�', '320302540000', 'glfjzzpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302540300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550000', '��¥�־ֻ�¥�ɳ���', '320302000000', 'glfjhlpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550100', '��¥�־ֻ�¥�ɳ����������ж�', '320302550000', 'glfjhlpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550101', '��¥�־ֻ�¥�ɳ����������жӺ�ѧ��������', '320302550100', 'glfjhlpcssqmjzdhyxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550102', '��¥�־ֻ�¥�ɳ����������жӵ籱��������', '320302550100', 'glfjhlpcssqmjzddbxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550103', '��¥�־ֻ�¥�ɳ����������ж�����������', '320302550100', 'glfjhlpcssqmjzdszzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550104', '��¥�־ֻ�¥�ɳ����������ж�����������', '320302550100', 'glfjhlpcssqmjzdmzzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550105', '��¥�־ֻ�¥�ɳ����������ж����������', '320302550100', 'glfjhlpcssqmjzdzhzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550106', '��¥�־ֻ�¥�ɳ����������ж��ٺ�������', '320302550100', 'glfjhlpcssqmjzdlhzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550107', '��¥�־ֻ�¥�ɳ����������ж����������', '320302550100', 'glfjhlpcssqmjzdzhzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550108', '��¥�־ֻ�¥�ɳ����������жӴ���������', '320302550100', 'glfjhlpcssqmjzddmzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550109', '��¥�־ֻ�¥�ɳ����������жӸ���������', '320302550100', 'glfjhlpcssqmjzdgxzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550110', '��¥�־ֻ�¥�ɳ����������жӺ���������', '320302550100', 'glfjhlpcssqmjzdhqzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550200', '��¥�־ֻ�¥�ɳ����ΰ����ж�', '320302550000', 'glfjhlpcszamjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550201', '��¥�־ֻ�¥�ɳ���Ѳ�ߴ����ж�', '320302550200', 'glfjhlpcsylcjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302550300', '��¥�־ֻ�¥�ɳ����̾��ж�', '320302550000', 'glfjhlpcsxjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302550300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560000', '��¥�־ֶ�վ�ɳ���', '320302000000', 'glfjdzpcs', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560100', '��¥�־ֶ�վ�ɳ����������ж�', '320302560000', 'glfjdzpcssqmjzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560101', '��¥�־ֶ�վ�ɳ����������жӶ���������', '320302560100', 'glfjdzpcssqmjzddgzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560102', '��¥�־ֶ�վ�ɳ����������жӺӶ�������', '320302560100', 'glfjdzpcssqmjzdhdzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560103', '��¥�־ֶ�վ�ɳ����������жӵز�������', '320302560100', 'glfjdzpcssqmjzddczrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560104', '��¥�־ֶ�վ�ɳ����������жӴ��������', '320302560100', 'glfjdzpcssqmjzddbzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560105', '��¥�־ֶ�վ�ɳ����������ж�¤��������', '320302560100', 'glfjdzpcssqmjzdlhzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560106', '��¥�־ֶ�վ�ɳ����������ж�����������', '320302560100', 'glfjdzpcssqmjzdyazrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302560107', '��¥�־ֶ�վ�ɳ����������ж�˳��������', '320302560100', 'glfjdzpcssqmjzdshzrq', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302560107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302070200', '�����й�������֧�ӹ�¥����Ӵ���·�ж�', '320302070000', 'xzsgaxfzdglqdddmlzd', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302070200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302090000', '��¥�־־����Ļ�������', '320302000000', 'glfjjjwhbwk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302090000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '��λ����', '320302150000', '��¥�־��ŷÿ�', '320302000000', 'glfjxfk', 1, 0, 0, 'ʡ�淶����ƽ̨��20120413', null, null, null, null, null, null, '320302150000', '0', '1', null);
commit;
prompt 999 records loaded
prompt Loading SYS_DIC_CFG...
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('1', '0', '��', '-1', null, '�ж�', '2', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('1', '1', '��', '-1', null, '�ж�', '1', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('2', '1', '��', '-1', null, '�Ա�', '1', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('2', '2', 'Ů', '-1', null, '�Ա�', '2', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('2', '3', '����', '-1', null, '�Ա�', '3', null, null, null, null, null, null, null, '0', '0', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('100', '1', '��ͨ�û�', '-1', null, '�û�����', '1', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('100', '2', 'ϵͳ����Ա', '-1', null, '�û�����', '2', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('100', '3', '��������Ա', '-1', null, '�û�����', '3', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('100', '4', '��ܹ���Ա', '-1', null, '�û�����', '4', null, null, null, null, null, null, null, '0', '1', null, null);
commit;
prompt 9 records loaded
prompt Loading SYS_LOG...
prompt Table is empty
prompt Loading SYS_MENU...
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802241710563860', 'ϵͳ����', '0', null, '1', null, '1', '0', '2', 'layui-icon-shezhi', '1', '20180224171106', 'ec0729ee1a084900be9aed9ad1da9223', '20180226143556', '320305000000', '320300000000', '0', '1', null, null);
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802241711129609', '�û�����', '201802241710563860', '/sysUser/toSysUserList', '1', null, '1', '1', '1', null, '1', '20180224171158', 'ec0729ee1a084900be9aed9ad1da9223', '20180226143751', '320305000000', '320300000000', '0', '1', null, null);
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802241712082875', '��ɫ����', '201802241710563860', '/sysRole/toSysRoleList', '1', null, '1', '1', '2', null, '1', '20180224171229', null, null, '320305000000', null, '0', '1', null, null);
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802241712316776', '�˵�����', '201802241710563860', '/sysMenu/toSysMenuList', '1', null, '1', '1', '3', null, '1', '20180224171248', '1', '20180224171614', '320305000000', '320305000000', '0', '1', null, null);
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802241712544607', '��������', '201802241710563860', '/sysOrg/toSysOrgList', '1', null, '1', '1', '4', null, '1', '20180224171329', null, null, '320305000000', null, '0', '1', null, null);
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802241741218759', '��������', '0', null, '1', null, '1', '0', '1', 'layui-icon-read', '1', '20180224174137', 'ec0729ee1a084900be9aed9ad1da9223', '20180226143857', '320305000000', '320300000000', '0', '1', null, null);
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802251314558709', '������Ϣ', '201802241741218759', '/sysUser/toSysUserList', '1', null, '1', '1', '1', null, '1', '20180225131527', 'ec0729ee1a084900be9aed9ad1da9223', '20180226143250', '320305000000', '320300000000', '0', '1', null, null);
commit;
prompt 7 records loaded
prompt Loading SYS_ROLE...
insert into SYS_ROLE (ID, NAME, YN_MODIFY, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, ORG_ID, MEMO)
values ('95e608035511439ea72645d3f2b2aa22', '��ͨ�û�', null, '1', '20180224172210', null, null, '320305000000', null, '0', '1', null, null);
insert into SYS_ROLE (ID, NAME, YN_MODIFY, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, ORG_ID, MEMO)
values ('2071a824a8d34cf787e195643ff14487', 'ϵͳ����Ա', null, '1', '20180224172146', null, null, '320305000000', null, '0', '1', null, 'ϵͳ����Ա');
commit;
prompt 2 records loaded
prompt Loading SYS_ROLE_MENU...
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('95e608035511439ea72645d3f2b2aa22', '201802241741218759');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('95e608035511439ea72645d3f2b2aa22', '201802251314558709');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('ed6574fb0bd54a818873baa4b05349c3', '201802121716071892');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('ed6574fb0bd54a818873baa4b05349c3', '201802121751599775');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('ed6574fb0bd54a818873baa4b05349c3', '201802121743261934');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('ed6574fb0bd54a818873baa4b05349c3', '201802131156308316');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('ed6574fb0bd54a818873baa4b05349c3', '201802121715203241');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('ed6574fb0bd54a818873baa4b05349c3', '201802121751422957');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('66834ccabb604698880a3da719bb582b', '201802121715203241');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('66834ccabb604698880a3da719bb582b', '201802121751422957');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('0a3074ba055f48a38c0d8471b7d1c8cb', '201802121743261934');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2071a824a8d34cf787e195643ff14487', '201802241710563860');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2071a824a8d34cf787e195643ff14487', '201802241711129609');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2071a824a8d34cf787e195643ff14487', '201802241712082875');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2071a824a8d34cf787e195643ff14487', '201802241712316776');
insert into SYS_ROLE_MENU (ROLE_ID, MENU_ID)
values ('2071a824a8d34cf787e195643ff14487', '201802241712544607');
commit;
prompt 16 records loaded
prompt Loading SYS_ROLE_USER...
insert into SYS_ROLE_USER (ROLE_ID, USER_ID)
values ('2071a824a8d34cf787e195643ff14487', '1');
insert into SYS_ROLE_USER (ROLE_ID, USER_ID)
values ('95e608035511439ea72645d3f2b2aa22', 'ec0729ee1a084900be9aed9ad1da9223');
insert into SYS_ROLE_USER (ROLE_ID, USER_ID)
values ('2071a824a8d34cf787e195643ff14487', 'ec0729ee1a084900be9aed9ad1da9223');
commit;
prompt 3 records loaded
prompt Loading SYS_USER...
insert into SYS_USER (ID, LOGIN_NAME, LOGIN_ALIAS, PASSWORD, USER_TYPE, BIND_IP, BIND_MAC, BINDE_MEID, VALIDITY, MOBILE_TEL, FIX_TEL, ORG_ID, REGULATORY_ORG, AREA_ID, ID_CARD, HEADER, YN_MODIFY, BIRTHDAY, SEX, EMAIL, YN_ASITANT, ASITANT_ID, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('1', 'admin', 'admin', '1', '1', null, null, null, '20990101', null, null, '320300000000', '320300000000', null, null, null, '1', null, null, null, '0', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_USER (ID, LOGIN_NAME, LOGIN_ALIAS, PASSWORD, USER_TYPE, BIND_IP, BIND_MAC, BINDE_MEID, VALIDITY, MOBILE_TEL, FIX_TEL, ORG_ID, REGULATORY_ORG, AREA_ID, ID_CARD, HEADER, YN_MODIFY, BIRTHDAY, SEX, EMAIL, YN_ASITANT, ASITANT_ID, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('ec0729ee1a084900be9aed9ad1da9223', 'lt', '����', '1', '1', null, null, null, '2018-02-03', '1', null, '320300000000', '320300000000', '320300', '1', null, null, '2018-02-01', '1', null, null, null, '1', '20180225105221', 'ec0729ee1a084900be9aed9ad1da9223', '20180227155839', '320305000000', '320300000000', '0', '1', null, null);
commit;
prompt 2 records loaded
prompt Enabling triggers for SYS_DIC_BUSINESS...
alter table SYS_DIC_BUSINESS enable all triggers;
prompt Enabling triggers for SYS_DIC_CFG...
alter table SYS_DIC_CFG enable all triggers;
prompt Enabling triggers for SYS_LOG...
alter table SYS_LOG enable all triggers;
prompt Enabling triggers for SYS_MENU...
alter table SYS_MENU enable all triggers;
prompt Enabling triggers for SYS_ROLE...
alter table SYS_ROLE enable all triggers;
prompt Enabling triggers for SYS_ROLE_MENU...
alter table SYS_ROLE_MENU enable all triggers;
prompt Enabling triggers for SYS_ROLE_USER...
alter table SYS_ROLE_USER enable all triggers;
prompt Enabling triggers for SYS_USER...
alter table SYS_USER enable all triggers;
set feedback on
set define on
prompt Done.
