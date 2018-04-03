prompt PL/SQL Developer import file
prompt Created on 2018年2月28日 by cf
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
  is '删除标记';
comment on column SYS_DIC_BUSINESS.YN_ENABLE
  is '数据状态0不可用 1 可用 ';
comment on column SYS_DIC_BUSINESS.ORG_ID
  is '所属组织';

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
  is '系统字典项';
comment on column SYS_DIC_CFG.DIC_NO
  is '项编号';
comment on column SYS_DIC_CFG.DIC_ID
  is '主项编码';
comment on column SYS_DIC_CFG.DIC_ID_NAME
  is '子项名称';
comment on column SYS_DIC_CFG.DIC_PID
  is '父节点';
comment on column SYS_DIC_CFG.DIC_SPELL
  is '子项拼音';
comment on column SYS_DIC_CFG.DIC_NO_NAME
  is '主项名称';
comment on column SYS_DIC_CFG.SORT_ID
  is '排序';
comment on column SYS_DIC_CFG.OWN_DESC
  is '归属说明';
comment on column SYS_DIC_CFG.CREATE_USER
  is '创建人';
comment on column SYS_DIC_CFG.CREATE_TIME
  is '创建时间';
comment on column SYS_DIC_CFG.UPDATE_USER
  is '修改人';
comment on column SYS_DIC_CFG.UPDATE_TIME
  is '修改时间';
comment on column SYS_DIC_CFG.CREATAE_DEPT
  is '创建部门';
comment on column SYS_DIC_CFG.UPDATE_DEPT
  is '修改部门';
comment on column SYS_DIC_CFG.DEL_FLAG
  is '删除标记';
comment on column SYS_DIC_CFG.YN_ENABLE
  is '0、不可用1、可用';
comment on column SYS_DIC_CFG.GROUP_ID
  is '所属组织';
comment on column SYS_DIC_CFG.MEMO
  is '备注';

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
  is '系统日志';
comment on column SYS_LOG.ID
  is '日志编码';
comment on column SYS_LOG.USER_NAME
  is '用户名称';
comment on column SYS_LOG.HOSTNAME
  is '访问主机名';
comment on column SYS_LOG.LOG_TIME
  is '日志产生时间';
comment on column SYS_LOG.VISIT_IP
  is '访问IP';
comment on column SYS_LOG.VISIT_MAC
  is '访问MAC';
comment on column SYS_LOG.TYPE
  is '1、登录信息
2、操作信息';
comment on column SYS_LOG.LOGIN_TYPE
  is '1、登录
2、登出';
comment on column SYS_LOG.OPT_TYPE
  is '1、新增
2、修改
3、删除
4、查询';
comment on column SYS_LOG.LOGIN_NAME
  is '登录名';
comment on column SYS_LOG.OPT_TABLE
  is '操作表名';
comment on column SYS_LOG.OPT_CONTENT
  is '操作内容';
comment on column SYS_LOG.MEMO
  is '备注';
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
  is '系统菜单';
comment on column SYS_MENU.MENU_NAME
  is '菜单名';
comment on column SYS_MENU.PID
  is '父菜单';
comment on column SYS_MENU.MENU_URL
  is '访问地址';
comment on column SYS_MENU.MENU_TYPE
  is '1、普通菜单2、功能按钮3、外部链接';
comment on column SYS_MENU.MENU_FUN
  is '唯一全局功能名';
comment on column SYS_MENU.DEV_MODE
  is '1、IFRAME模式 2、单页面架构';
comment on column SYS_MENU.MENU_LEV
  is '层级';
comment on column SYS_MENU.SORT_ID
  is '排序';
comment on column SYS_MENU.ICON
  is '图标地址';
comment on column SYS_MENU.CREATE_USER
  is '创建人';
comment on column SYS_MENU.CREATE_TIME
  is '创建时间';
comment on column SYS_MENU.UPDATE_USER
  is '修改人';
comment on column SYS_MENU.UPDATE_TIME
  is '修改时间';
comment on column SYS_MENU.CREATAE_DEPT
  is '创建部门';
comment on column SYS_MENU.UPDATE_DEPT
  is '修改部门';
comment on column SYS_MENU.DEL_FLAG
  is '删除标记';
comment on column SYS_MENU.YN_ENABLE
  is '0、不可用1、可用';
comment on column SYS_MENU.GROUP_ID
  is '所属组织';
comment on column SYS_MENU.MEMO
  is '备注';

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
  is '系统角色表';
comment on column SYS_ROLE.ID
  is '角色标识';
comment on column SYS_ROLE.NAME
  is '角色名称';
comment on column SYS_ROLE.YN_MODIFY
  is '0、不允许
1、允许';
comment on column SYS_ROLE.CREATE_USER
  is '创建人';
comment on column SYS_ROLE.CREATE_TIME
  is '创建时间';
comment on column SYS_ROLE.UPDATE_USER
  is '修改人';
comment on column SYS_ROLE.UPDATE_TIME
  is '修改时间';
comment on column SYS_ROLE.CREATAE_DEPT
  is '创建部门';
comment on column SYS_ROLE.UPDATE_DEPT
  is '修改部门';
comment on column SYS_ROLE.DEL_FLAG
  is '删除标记';
comment on column SYS_ROLE.YN_ENABLE
  is '数据状态0不可用 1 可用 ';
comment on column SYS_ROLE.ORG_ID
  is '所属组织';
comment on column SYS_ROLE.MEMO
  is '备注';
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
  is '系统角色菜单';
comment on column SYS_ROLE_MENU.ROLE_ID
  is '角色id';
comment on column SYS_ROLE_MENU.MENU_ID
  is '菜单id';

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
  is '系统角色用户';
comment on column SYS_ROLE_USER.ROLE_ID
  is '角色id';
comment on column SYS_ROLE_USER.USER_ID
  is '用户id';

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
  is '系统用户表';
comment on column SYS_USER.ID
  is '账号编码';
comment on column SYS_USER.LOGIN_NAME
  is '账号登陆名';
comment on column SYS_USER.LOGIN_ALIAS
  is '账号别名，显示时用';
comment on column SYS_USER.PASSWORD
  is '账号密码，默认密码 111111';
comment on column SYS_USER.USER_TYPE
  is '1、普通用户
2、系统管理员
3、监管管理员
4、超级管理员';
comment on column SYS_USER.BIND_IP
  is '用户登录所绑定的IP地址';
comment on column SYS_USER.BIND_MAC
  is '用户登录所绑定的MAC地址';
comment on column SYS_USER.BINDE_MEID
  is '用户登录锁绑定的移动端机器码';
comment on column SYS_USER.VALIDITY
  is '最终有效日期';
comment on column SYS_USER.MOBILE_TEL
  is '手机';
comment on column SYS_USER.FIX_TEL
  is '座机';
comment on column SYS_USER.ORG_ID
  is '用户所属单位代码';
comment on column SYS_USER.REGULATORY_ORG
  is '监管单位';
comment on column SYS_USER.AREA_ID
  is '用户所属区域';
comment on column SYS_USER.ID_CARD
  is '用户身份证号码';
comment on column SYS_USER.HEADER
  is '用户头像 存放URL';
comment on column SYS_USER.YN_MODIFY
  is '0、不允许
1、允许';
comment on column SYS_USER.BIRTHDAY
  is '出生日期';
comment on column SYS_USER.SEX
  is '性别';
comment on column SYS_USER.EMAIL
  is '邮件地址';
comment on column SYS_USER.YN_ASITANT
  is '是否辅警　0、否　1、是';
comment on column SYS_USER.ASITANT_ID
  is '被辅助民警ID 同一辅警只能辅助一位民警';
comment on column SYS_USER.CREATE_USER
  is '创建人';
comment on column SYS_USER.CREATE_TIME
  is '创建时间';
comment on column SYS_USER.UPDATE_USER
  is '修改人';
comment on column SYS_USER.UPDATE_TIME
  is '修改时间';
comment on column SYS_USER.CREATAE_DEPT
  is '创建部门';
comment on column SYS_USER.UPDATE_DEPT
  is '修改部门';
comment on column SYS_USER.DEL_FLAG
  is '删除标记';
comment on column SYS_USER.YN_ENABLE
  is '0、不可用1、可用';
comment on column SYS_USER.GROUP_ID
  is '所属组织';
comment on column SYS_USER.MEMO
  is '备注';
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
values ('2', '单位代码', '320303610200', '云龙分局黄山派出所治安民警中队', '320303610000', 'ylfjhspcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303610200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303610201', '云龙分局黄山派出所巡逻处警中队', '320303610200', 'ylfjhspcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303610201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303610300', '云龙分局黄山派出所刑警中队', '320303610000', 'ylfjhspcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303610300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303620101', '云龙分局翠屏山派出所社区民警中队长山村责任区', '320303620100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303620102', '云龙分局翠屏山派出所社区民警中队土山寺村责任区', '320303620100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550107', '云龙分局王杰派出所社区民警中队黄山责任区', '320303550100', 'ylfjtspcssqmjzdhszrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303550107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550109', '云龙分局王杰派出所社区民警中队子房美景责任区', '320303550100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550100', '云龙分局王杰派出所社区民警中队', '320303550000', 'ylfjtspcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303550100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550101', '云龙分局王杰派出所社区民警中队铜新责任区', '320303550100', 'ylfjtspcssqmjzdtxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303550101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550102', '云龙分局王杰派出所社区民警中队响山责任区', '320303550100', 'ylfjtspcssqmjzdxszrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303550102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550103', '云龙分局王杰派出所社区民警中队建新责任区', '320303550100', 'ylfjtspcssqmjzdjxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303550103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550104', '云龙分局王杰派出所社区民警中队津浦责任区', '320303550100', 'ylfjtspcssqmjzdjpzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303550104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550105', '云龙分局王杰派出所社区民警中队新民责任区', '320303550100', 'ylfjtspcssqmjzdxmzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303550105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550106', '云龙分局王杰派出所社区民警中队金狮责任区', '320303550100', 'ylfjtspcssqmjzdjszrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303550106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580117', '云龙分局彭城派出所社区民警中队解放责任区', '320303580100', 'ylfjpcpcssqmjzdjfzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580117', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580118', '云龙分局彭城派出所社区民警中队云龙责任区', '320303580100', 'ylfjpcpcssqmjzdylzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580118', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510103', '贾汪分局大泉派出所社区民警中队泉西村责任区', '320305510100', 'jwfjdqpcssqmjzdqxczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305510103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510104', '贾汪分局大泉派出所社区民警中队泉东村责任区', '320305510100', 'jwfjdqpcssqmjzdqdczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305510104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510105', '贾汪分局大泉派出所社区民警中队大李庄村责任区', '320305510100', 'jwfjdqpcssqmjzddlzczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305510105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510106', '贾汪分局大泉派出所社区民警中队崮岘东村、崮岘西村责任区', '320305510100', 'jwfjdqpcssqmjzddcxczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305510106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305171400', '贾汪分局交通警察大队徐贾快速通道中队', '320305170000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303620100', '云龙分局翠屏山派出所社区民警中队', '320303620000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303620103', '云龙分局翠屏山派出所社区民警中队乔家湖村责任区', '320303620100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303620104', '云龙分局翠屏山派出所社区民警中队兴云责任区', '320303620100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550111', '云龙分局王杰派出所社区民警中队园梦责任区', '320303550100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550112', '云龙分局王杰派出所社区民警中队铁刹责任区', '320303550100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550200', '云龙分局王杰派出所治安民警中队', '320303550000', 'ylfjtspcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303550200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550201', '云龙分局王杰派出所巡逻处警中队', '320303550200', 'ylfjtspcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303550201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550300', '云龙分局王杰派出所刑警中队', '320303550000', 'ylfjtspcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303550300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303560000', '云龙分局子房派出所', '320303000000', 'ylfjzfpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303560000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303560100', '云龙分局子房派出所社区民警中队', '320303560000', 'ylfjzfpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303560100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303560101', '云龙分局子房派出所社区民警中队铁刹责任区', '320303560100', 'ylfjzfpcssqmjzdtszrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303560101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303560102', '云龙分局子房派出所社区民警中队子房山责任区', '320303560100', 'ylfjzfpcssqmjzdzfszrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303560102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303560103', '云龙分局子房派出所社区民警中队津陇责任区', '320303560100', 'ylfjzfpcssqmjzdjlzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303560103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303560104', '云龙分局子房派出所社区民警中队子房美景责任区', '320303560100', 'ylfjzfpcssqmjzdzfmjzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303560104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303560105', '云龙分局子房派出所社区民警中队子房责任区', '320303560100', 'ylfjzfpcssqmjzdzfzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303560105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303560106', '云龙分局子房派出所社区民警中队圆梦责任区', '320303560100', 'ylfjzfpcssqmjzdymzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303560106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303560200', '云龙分局子房派出所治安民警中队', '320303560000', 'ylfjzfpcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303560200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303560201', '云龙分局子房派出所巡逻处警中队', '320303560200', 'ylfjzfpcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303560201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303560300', '云龙分局子房派出所刑警中队', '320303560000', 'ylfjzfpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303560300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570000', '云龙分局青年派出所', '320303000000', 'ylfjqnpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570100', '云龙分局青年派出所社区民警中队', '320303570000', 'ylfjqnpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570101', '云龙分局青年派出所社区民警中队宣武责任区', '320303570100', 'ylfjqnpcssqmjzdxwzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570102', '云龙分局青年派出所社区民警中队铁货责任区', '320303570100', 'ylfjqnpcssqmjzdtjzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570103', '云龙分局青年派出所社区民警中队淮海堂责任区', '320303570100', 'ylfjqnpcssqmjzdhhtzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570104', '云龙分局青年派出所社区民警中队新徐责任区', '320303570100', 'ylfjqnpcssqmjzdxxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570105', '云龙分局青年派出所社区民警中队青年责任区', '320303570100', 'ylfjqnpcssqmjzdqnzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570106', '云龙分局青年派出所社区民警中队奎河责任区', '320303570100', 'ylfjqnpcssqmjzdkhzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570107', '云龙分局青年派出所社区民警中队开明责任区', '320303570100', 'ylfjqnpcssqmjzdkmzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570108', '云龙分局青年派出所社区民警中队钟鼓楼责任区', '320303570100', 'ylfjqnpcssqmjzdzglzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570109', '云龙分局青年派出所社区民警中队大同责任区', '320303570100', 'ylfjqnpcssqmjzddtzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570110', '云龙分局青年派出所社区民警中队艺波责任区', '320303570100', 'ylfjqnpcssqmjzdybzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570200', '云龙分局青年派出所治安民警中队', '320303570000', 'ylfjqnpcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570201', '云龙分局青年派出所巡逻处警中队', '320303570200', 'ylfjqnpcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303570300', '云龙分局青年派出所刑警中队', '320303570000', 'ylfjqnpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303570300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580000', '云龙分局彭城派出所', '320303000000', 'ylfjpcpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580100', '云龙分局彭城派出所社区民警中队', '320303580000', 'ylfjpcpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580101', '云龙分局彭城派出所社区民警中队云龙责任区', '320303580100', 'ylfjpcpcssqmjzdylzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580102', '云龙分局彭城派出所社区民警中队土城责任区', '320303580100', 'ylfjpcpcssqmjzdtczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580105', '云龙分局彭城派出所社区民警中队晓光责任区', '320303580100', 'ylfjpcpcssqmjzdxgzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580106', '云龙分局彭城派出所社区民警中队积翠责任区', '320303580100', 'ylfjpcpcssqmjzdjczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580108', '云龙分局彭城派出所社区民警中队奎南责任区', '320303580100', 'ylfjpcpcssqmjzdknzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580109', '云龙分局彭城派出所社区民警中队石磊责任区', '320303580100', 'ylfjpcpcssqmjzdslzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580110', '云龙分局彭城派出所社区民警中队户部山商贸城责任区', '320303580100', 'ylfjpcpcssqmjzdhbssmczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580111', '云龙分局彭城派出所社区民警中队莲花责任区', '320303580100', 'ylfjpcpcssqmjzdlhzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580112', '云龙分局彭城派出所社区民警中队晓市责任区', '320303580100', 'ylfjpcpcssqmjzdxszrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580114', '云龙分局彭城派出所社区民警中队劳动责任区', '320303580100', 'ylfjpcpcssqmjzdldzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580114', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580115', '云龙分局彭城派出所社区民警中队户东责任区', '320303580100', 'ylfjpcpcssqmjzdhdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580115', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580116', '云龙分局彭城派出所社区民警中队马市责任区', '320303580100', 'ylfjpcpcssqmjzdmszrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580116', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305170700', '贾汪分局交通警察大队高速中队', '320305170000', 'jwfjjyjddgszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305170700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305170800', '贾汪分局交通警察大队车管所', '320305170000', 'jwfjjyjddcgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305170800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305170900', '贾汪分局交通警察大队治安卡口中队', '320305170000', 'jwfjjyjddzakkzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305170900', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305171000', '贾汪分局交通警察大队法制股', '320305170000', 'jwfjjyjddfzg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305171000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305171100', '贾汪分局交通警察大队机动中队', '320305170000', 'jwfjjyjddjdzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305171100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305171200', '贾汪分局交通警察大队塔山中队', '320305170000', 'jwfjjyjddtszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305171200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305171300', '贾汪分局交通警察大队青山泉中队', '320305170000', 'jwfjjyjddqsqzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305171300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305180000', '贾汪分局法制室', '320305000000', 'jwfjfzdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305180000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305190000', '贾汪分局外事科', '320305000000', 'jwfjwsk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305190000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305200000', '贾汪分局财务管理科', '320305000000', 'jwfjcwglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305200000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305240000', '贾汪分局审计科', '320305000000', 'jwfjsjk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305240000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305250000', '贾汪分局行政管理科', '320305000000', 'jwfjxzglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305250000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305280000', '江苏省徐州市公安局贾汪分局巡防大队', '320305000000', 'jwfjyfdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305280000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305310000', '贾汪分局办公室', '320305000000', 'jwfjzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305310000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305320000', '贾汪分局纪委', '320305000000', 'jwfjjw', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305320000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305320100', '贾汪分局纪委监督室', '320305320000', 'jwfjjwjds', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305320100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305330000', '贾汪分局指挥室', '320305000000', 'jwfjzhzx', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305330000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305330100', '贾汪分局指挥室档案室', '320305330000', 'jwfjzhsdas', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305330100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305330200', '贾汪分局指挥室通讯科', '320305330000', 'jwfjzhstyk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305330200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305330300', '贾汪分局指挥室信息调研科', '320305330000', 'jwfjzhsxxdyk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305330300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305330400', '贾汪分局情报信息中心', '320305330000', 'jwfjqbxxzx', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305330400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305340000', '贾汪分局督察大队', '320305000000', 'jwfjdcdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305340000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305350000', '贾汪分局政治处', '320305000000', 'jwfjzzc', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305350000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305410000', '江苏省徐州市公安局贾汪分局保安大队', '320305000000', 'jwfjbadd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305410000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510000', '贾汪分局大泉派出所', '320305000000', 'jwfjdqpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305510000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510100', '贾汪分局大泉派出所社区民警中队', '320305510000', 'jwfjdqpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305510100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510101', '贾汪分局大泉派出所社区民警中队工业园区庄庄村责任区', '320305510100', 'jwfjdqpcssqmjzdgyyqzzczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305510101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510102', '贾汪分局大泉派出所社区民警中队工业园区岗子村责任区', '320305510100', 'jwfjdqpcssqmjzdgyyqgzczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305510102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303WB9432', '徐州市云龙区人民检察院', '320303WB9400', 'xzsylqrmjcy', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303WB9432', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305000000', '徐州市公安局贾汪分局', '320300000000', 'jwfj', 3, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305000000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305010000', '贾汪分局国内安全保卫大队', '320305000000', 'jwfjgbdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305010000', '0', '1', null);
commit;
prompt 100 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305020000', '贾汪分局经侦大队', '320305000000', 'jwfjjzdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305020000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305020100', '贾汪分局经侦大队办公室', '320305020000', 'jwfjjzddbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305020100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305020200', '贾汪分局经侦大队一中队', '320305020000', 'jwfjjzddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305020200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305020300', '贾汪分局经侦大队二中队', '320305020000', 'jwfjjzddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305020300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305030000', '贾汪分局治安大队', '320305000000', 'jwfjzadd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305030000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305030100', '贾汪分局治安大队办公室', '320305030000', 'jwfjzaddbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305030100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305030200', '贾汪分局治安大队户政科', '320305030000', 'jwfjzaddhzk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305030200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305030300', '贾汪分局治安大队危办室', '320305030000', 'jwfjzaddwbs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305030300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305030400', '贾汪分局治安大队治安股', '320305030000', 'jwfjzaddzag', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305030400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305050000', '贾汪分局刑警大队', '320305000000', 'jwfjxjdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305050000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305050100', '贾汪分局刑警大队办公室', '320305050000', 'jwfjxjddbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305050100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305050200', '贾汪分局刑警大队法制股', '320305050000', 'jwfjxjddfzg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305050200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305050300', '贾汪分局刑警大队大案中队', '320305050000', 'jwfjxjdddazd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305050300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305050400', '贾汪分局刑警大队技术中队', '320305050000', 'jwfjxjddjszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305050400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305050500', '贾汪分局刑警大队情报中队', '320305050000', 'jwfjxjddqbzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305050500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305050600', '贾汪分局刑警大队城区中队', '320305050000', 'jwfjxjddcqzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305050600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305050700', '贾汪分局刑警大队二中队', '320305050000', 'jwfjxjddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305050700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305050800', '贾汪分局刑警大队禁毒中队', '320305050000', 'jwfjxjddjdzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305050800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305070000', '徐州市公安消防支队贾汪区消防大队', '320305000000', 'xzsgaxfzdjwqxfdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305070000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305070100', '徐州市公安消防支队贾汪区大队贾汪中队', '320305070000', 'xzsgaxfzdjwqddjwzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305070100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305070200', '徐州市公安消防支队贾汪区大队天工路中队', '320305070000', 'xzsgaxfzdjwqddtglzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305070200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305090000', '贾汪分局经保科', '320305000000', 'jwfjjbk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305090000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305110000', '贾汪分局信息网络安全监察科', '320305000000', 'jwfjwadd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305110000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305130000', '贾汪区看守所', '320305000000', 'jwqkss', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305130000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305130100', '贾汪区行政拘留所', '320305130000', 'jwqxzjls', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305130100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305150000', '贾汪分局信访科', '320305000000', 'jwfjxfk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305150000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305170000', '贾汪分局交通警察大队', '320305000000', 'jwfjjjdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305170000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305170100', '贾汪分局交通警察大队办公室', '320305170000', 'jwfjjyjddbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305170100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305170200', '贾汪分局交通警察大队秩序股', '320305170000', 'jwfjjyjddzxg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305170200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305170300', '贾汪分局交通警察大队事故科', '320305170000', 'jwfjjyjddsgk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305170300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305170400', '贾汪分局交通警察大队城区中队', '320305170000', 'jwfjjyjddcqzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305170400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305170500', '贾汪分局交通警察大队鹿庄中队', '320305170000', 'jwfjjyjddlzzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305170500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305170600', '贾汪分局交通警察大队汴塘中队', '320305170000', 'jwfjjyjddtzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305170600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510107', '贾汪分局大泉派出所社区民警中队龙门村责任区', '320305510100', 'jwfjdqpcssqmjzdlmczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305510107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580119', '云龙分局彭城派出所社区民警中队户南责任区', '320303580100', 'ylfjpcpcssqmjzdhnzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580119', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580200', '云龙分局彭城派出所治安民警中队', '320303580000', 'ylfjpcpcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580201', '云龙分局彭城派出所巡逻处警中队', '320303580200', 'ylfjpcpcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580300', '云龙分局彭城派出所刑警中队', '320303580000', 'ylfjpcpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590000', '云龙分局狮子山派出所', '320303000000', 'ylfjszspcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590100', '云龙分局狮子山派出所社区民警中队', '320303590000', 'ylfjszspcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590101', '云龙分局狮子山派出所社区民警中队骆驼山、机场路地区责任区', '320303590100', 'ylfjszspcssqmjzdltsjcldqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590102', '云龙分局狮子山派出所社区民警中队骆驼山小区责任区', '320303590100', 'ylfjszspcssqmjzdltsxqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590103', '云龙分局狮子山派出所社区民警中队铁新街1－144号责任区', '320303590100', 'ylfjszspcssqmjzdtxj1144hzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590104', '云龙分局狮子山派出所社区民警中队梅园社区责任区', '320303590100', 'ylfjszspcssqmjzdmysqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590105', '云龙分局狮子山派出所社区民警中队狮子山村责任区', '320303590100', 'ylfjszspcssqmjzdszsczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590106', '云龙分局狮子山派出所社区民警中队狮南责任区', '320303590100', 'ylfjszspcssqmjzdsnzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590107', '云龙分局狮子山派出所社区民警中队铝厂、建化厂宿舍责任区', '320303590100', 'ylfjszspcssqmjzdlcjhcsszrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590108', '云龙分局狮子山派出所社区民警中队安泰、A区B区责任区', '320303590100', 'ylfjszspcssqmjzdataqbqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590109', '云龙分局狮子山派出所社区民警中队黄山新村责任区', '320303590100', 'ylfjszspcssqmjzdhsxczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590110', '云龙分局狮子山派出所社区民警中队民健责任区', '320303590100', 'ylfjszspcssqmjzdmjzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590111', '云龙分局狮子山派出所社区民警中队育园责任区', '320303590100', 'ylfjszspcssqmjzdyyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590112', '云龙分局狮子山派出所社区民警中队馨园小区责任区', '320303590100', 'ylfjszspcssqmjzdyxqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590113', '云龙分局狮子山派出所社区民警中队民强、东华园小区责任区', '320303590100', 'ylfjszspcssqmjzdmqdhyxqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590113', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590114', '云龙分局狮子山派出所社区民警中队黄山垅责任区', '320303590100', 'ylfjszspcssqmjzdhszrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590114', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590200', '云龙分局狮子山派出所治安民警中队', '320303590000', 'ylfjszspcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590201', '云龙分局狮子山派出所巡逻处警中队', '320303590200', 'ylfjszspcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303590300', '云龙分局狮子山派出所刑警中队', '320303590000', 'ylfjszspcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303590300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600000', '云龙分局新生派出所', '320303000000', 'ylfjxspcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600100', '云龙分局新生派出所社区民警中队', '320303600000', 'ylfjxspcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600101', '云龙分局新生派出所社区民警中队庆新责任区', '320303600100', 'ylfjxspcssqmjzdqxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600102', '云龙分局新生派出所社区民警中队兴隆责任区', '320303600100', 'ylfjxspcssqmjzdxlzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600103', '云龙分局新生派出所社区民警中队广大责任区', '320303600100', 'ylfjxspcssqmjzdgdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600104', '云龙分局新生派出所社区民警中队丰储责任区', '320303600100', 'ylfjxspcssqmjzdfczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600105', '云龙分局新生派出所社区民警中队袁桥责任区', '320303600100', 'ylfjxspcssqmjzdyqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600106', '云龙分局新生派出所社区民警中队燎原责任区', '320303600100', 'ylfjxspcssqmjzdlyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600108', '云龙分局新生派出所社区民警中队堤东责任区', '320303600100', 'ylfjxspcssqmjzdddzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600109', '云龙分局新生派出所社区民警中队新生责任区', '320303600100', 'ylfjxspcssqmjzdxszrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600110', '云龙分局新生派出所社区民警中队建南责任区', '320303600100', 'ylfjxspcssqmjzdjnzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600111', '云龙分局新生派出所社区民警中队养育责任区', '320303600100', 'ylfjxspcssqmjzdyyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600201', '云龙分局新生派出所巡逻处警中队', '320303600200', 'ylfjxspcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600300', '云龙分局新生派出所刑警中队', '320303600000', 'ylfjxspcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303610000', '云龙分局黄山派出所', '320303000000', 'ylfjhspcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303610000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303610100', '云龙分局黄山派出所社区民警中队', '320303610000', 'ylfjhspcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303610100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303610101', '云龙分局黄山派出所社区民警中队民富责任区', '320303610100', 'ylfjhspcssqmjzdmfzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303610101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303610103', '云龙分局黄山派出所社区民警中队民怡园责任区', '320303610100', 'ylfjhspcssqmjzdmyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303610103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303610105', '云龙分局黄山派出所社区民警中队土山寺和工业园区责任区', '320303610100', 'ylfjhspcssqmjzdtsshgyyqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303610105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303610106', '云龙分局黄山派出所社区民警中队长山村责任区', '320303610100', 'ylfjhspcssqmjzdcsczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303610106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303610107', '云龙分局黄山派出所社区民警中队乔家湖村责任区', '320303610100', 'ylfjhspcssqmjzdqjhczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303610107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580107', '云龙分局彭城派出所社区民警中队溢洪责任区', '320303580100', 'ylfjpcpcssqmjzdyhzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303580113', '云龙分局彭城派出所社区民警中队晓东责任区', '320303580100', 'ylfjpcpcssqmjzdxdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303580113', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303600200', '云龙分局新生派出所治安民警中队', '320303600000', 'ylfjxspcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303600200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510108', '贾汪分局大泉派出所社区民警中队宗庄村责任区', '320305510100', 'jwfjdqpcssqmjzdzzczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305510108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510109', '贾汪分局大泉派出所社区民警中队闫村责任区', '320305510100', 'jwfjdqpcssqmjzdczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305510109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510110', '贾汪分局大泉派出所社区民警中队柴沃村责任区', '320305510100', 'jwfjdqpcssqmjzdcwczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305510110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510111', '贾汪分局大泉派出所社区民警中队小山子村责任区', '320305510110', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320305510111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510112', '贾汪分局大泉派出所社区民警中队鹿楼村责任区', '320305510110', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320305510112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510113', '贾汪分局大泉派出所社区民警中队新泉居委会责任区', '320305510110', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320305510113', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305510114', '贾汪分局大泉派出所社区民警中队新夏居委会责任区', '320305510110', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320305510114', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305520000', '贾汪分局塔山派出所', '320305000000', 'jwfjtspcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305520000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320305520100', '贾汪分局塔山派出所社区民警中队', '320305520000', 'jwfjtspcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320305520100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303620000', '云龙分局翠屏山派出所', '320303000000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303610108', '云龙分局黄山派出所社区民警中队绿地南责任区', '320303610100', 'ylfjhspcssqmjzdldzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303610108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303610109', '云龙分局黄山派出所社区民警中队民祥园责任区', '320303610100', 'ylfjhspcssqmjzdmxyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303610109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303610110', '云龙分局黄山派出所社区民警中队东方美地责任区', '320303610100', 'ylfjhspcssqmjzddfmdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303610110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550110', '云龙分局王杰派出所社区民警中队子房责任区', '320303550100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560108', '鼓楼分局东站派出所社区民警中队镇平责任区', '320302560100', 'glfjdzpcssqmjzdzpzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560109', '鼓楼分局东站派出所社区民警中队迎春责任区', '320302560100', 'glfjdzpcssqmjzdyczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560110', '鼓楼分局东站派出所社区民警中队丰财责任区', '320302560100', 'glfjdzpcssqmjzdfczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303620200', '云龙分局翠屏山派出所治安民警中队', '320303620000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303620201', '云龙分局翠屏山派出所巡逻处警中队', '320303620200', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
commit;
prompt 200 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303a00000', '云龙分局档案室', '320303000000', 'ylfjdas', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320303a00000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303a10000', '云龙分局政治处', '320303000000', 'ylfjzzc', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320303a10000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303a20000', '云龙分局出入境大队', '320303000000', 'ylfjcrjdd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320303a20000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303a30000', '云龙分局计财科', '320303000000', 'ylfjjck', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320303a30000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303a40000', '云龙分局保安公司', '320303000000', 'ylfjbags', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320303a40000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303a50000', '云龙分局作风办', '320303000000', 'ylfjzfb', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320303a50000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303a60000', '云龙分局维稳办', '320303000000', 'ylfjwwb', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320303a60000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303WB9431', '徐州市云龙区人民法院', '320303WB9400', 'xzsylqrmfy', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303WB9431', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303051400', '云龙分局刑警大队六中队', '320303050000', 'ylfjxjddlzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303051400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303051600', '云龙分局刑警大队便衣队', '320303050000', 'ylfjxjddbyd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303051600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303070000', '徐州市公安消防支队云龙区消防大队', '320303000000', 'ylfjxfk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303070000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303090000', '云龙分局经济文化保卫科', '320303000000', 'ylfjnbdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303090000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303150000', '云龙分局信访科', '320303000000', 'ylfjxfk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303150000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303180000', '云龙分局法制科', '320303000000', 'ylfjfzk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303180000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303230000', '云龙分局通信科', '320303000000', 'ylfjtxk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303230000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303310000', '云龙分局办公室', '320303000000', 'ylfjbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303310000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303310100', '云龙分局情报信息中心', '320303310000', 'ylfjqbxxzx', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303310100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303320000', '云龙分局纪委', '320303000000', 'ylfjjw', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303320000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303330000', '云龙分局指挥中心', '320303000000', 'ylfjqbzx', 1, 0, 0, '20150126手动创建', '30032', '20150126154229', null, null, '320300000000', null, '320303330000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303350000', '云龙分局政工科', '320303000000', 'ylfjzgk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303350000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303390000', '云龙分局工会', '320303000000', 'ylfjgh', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303390000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303510000', '云龙分局大郭庄派出所', '320303000000', 'ylfjdgzpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303510000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303510100', '云龙分局大郭庄派出所社区民中队', '320303510000', 'ylfjdgzpcssqmzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303510100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303510101', '云龙分局大郭庄派出所社区民中队李庄村责任区', '320303510100', 'ylfjdgzpcssqmzdlzczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303510101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303510102', '云龙分局大郭庄派出所社区民中队上河头村责任区', '320303510100', 'ylfjdgzpcssqmzdshtczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303510102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303510103', '云龙分局大郭庄派出所社区民中队下河头责任区', '320303510100', 'ylfjdgzpcssqmzdxhtzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303510103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303510104', '云龙分局大郭庄派出所社区民中队骆驼山工业园责任区', '320303510100', 'ylfjdgzpcssqmzdltsgyyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303510104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303510105', '云龙分局大郭庄派出所社区民中队市场责任区', '320303510100', 'ylfjdgzpcssqmzdsczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303510105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303510106', '云龙分局大郭庄派出所社区民中队机场部队责任区', '320303510100', 'ylfjdgzpcssqmzdjcbdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303510106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303510300', '云龙分局大郭庄派出所刑警中队', '320303510000', 'ylfjdgzpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303510300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303520000', '云龙分局天桥派出所', '320303000000', 'ylfjtqpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303520000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303520100', '云龙分局天桥派出所社区民警中队', '320303520000', 'ylfjtqpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303520100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303520101', '云龙分局天桥派出所社区民警中队利群责任区', '320303520100', 'ylfjtqpcssqmjzdlqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303520101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303520102', '云龙分局天桥派出所社区民警中队梁庄责任区', '320303520100', 'ylfjtqpcssqmjzdlzzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303520102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303520103', '云龙分局天桥派出所社区民警中队下洪责任区', '320303520100', 'ylfjtqpcssqmjzdxhzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303520103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303520105', '云龙分局天桥派出所社区民警中队铁工责任区', '320303520100', 'ylfjtqpcssqmjzdtgzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303520105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303520106', '云龙分局天桥派出所社区民警中队铁运责任区', '320303520100', 'ylfjtqpcssqmjzdtyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303520106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303520107', '云龙分局天桥派出所社区民警中队铁花责任区', '320303520100', 'ylfjtqpcssqmjzdthzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303520107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303520108', '云龙分局天桥派出所社区民警中队铁桥责任区', '320303520100', 'ylfjtqpcssqmjzdtqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303520108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303520200', '云龙分局天桥派出所治安民警中队', '320303520000', 'ylfjtqpcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303520200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303520201', '云龙分局天桥派出所巡逻处警中队', '320303520200', 'ylfjtqpcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303520201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303520300', '云龙分局天桥派出所刑警中队', '320303520000', 'ylfjtqpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303520300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303540000', '云龙分局店子派出所', '320303000000', 'ylfjdzpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303540000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303540100', '云龙分局店子派出所社区民警中队', '320303540000', 'ylfjdzpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303540100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303540101', '云龙分局店子派出所社区民警中队坝山责任区', '320303540100', 'ylfjdzpcssqmjzdbszrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303540101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303540103', '云龙分局店子派出所社区民警中队工院责任区', '320303540100', 'ylfjdzpcssqmjzdgyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303540103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303540104', '云龙分局店子派出所社区民警中队店子责任区', '320303540100', 'ylfjdzpcssqmjzddzzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303540104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303540105', '云龙分局店子派出所社区民警中队科苑责任区', '320303540100', 'ylfjdzpcssqmjzdkyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303540105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303540200', '云龙分局店子派出所治安民警中队', '320303540000', 'ylfjdzpcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303540200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303540201', '云龙分局店子派出所巡逻处警中队', '320303540200', 'ylfjdzpcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303540201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303540300', '云龙分局店子派出所刑警中队', '320303540000', 'ylfjdzpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303540300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550000', '云龙分局王杰派出所', '320303000000', 'ylfjwjpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303550000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303610111', '云龙分局黄山派出所社区民警中队绿地北责任区', '320303610110', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320303610111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070307', '徐州市公安消防支队后勤处生产基地', '320300070300', 'xzsgaxfzdhqcscjd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070307', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174704', '徐州市公安局交通警察支队高速公路五大队一中队', '320300174700', 'jyjzdgsglwddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174704', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590103', '鼓楼分局铜沛派出所社区民警中队沈东责任区', '320302590100', 'glfjtppcssqmjzdsdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590104', '鼓楼分局铜沛派出所社区民警中队沈西责任区', '320302590100', 'glfjtppcssqmjzdsxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590105', '鼓楼分局铜沛派出所社区民警中队苏堤责任区', '320302590100', 'glfjtppcssqmjzdsdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590106', '鼓楼分局铜沛派出所社区民警中队铜东责任区', '320302590100', 'glfjtppcssqmjzdtdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590107', '鼓楼分局铜沛派出所社区民警中队铜西责任区', '320302590100', 'glfjtppcssqmjzdtxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302a70000', '鼓楼分局巡逻防范大队', '320302000000', 'glfjxlffdd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320302a70000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302a80000', '鼓楼分局保安公司', '320302000000', 'glfjbags', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320302a80000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302WB9431', '徐州市鼓楼区人民法院', '320302WB9400', 'xzsglqrmfy', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302WB9431', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300240000', '徐州市公安局审计处', '320300000000', 'sjc', 46, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300240000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300240100', '徐州市公安局审计处秘书科', '320300240000', 'sjcmsk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300240100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300240200', '徐州市公安局审计处审计科', '320300240000', 'sjcsjk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300240200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300250000', '徐州市公安局后勤管理处', '320300000000', 'hqglc', 47, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300250000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300250100', '徐州市公安局后勤管理处秘书科', '320300250000', 'hqglcmsk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300250100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300250200', '徐州市公安局后勤管理处行管科', '320300250000', 'hqglcxgk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300250200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300250300', '徐州市公安局后勤管理处车队', '320300250000', 'hqglccd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300250300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300250400', '徐州市公安局后勤管理处装备科', '320300250000', 'hqglczbk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300250400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300250500', '徐州市公安局后勤管理处房管科', '320300250000', 'hqglcfgk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300250500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300250600', '江苏省徐州市公安局后勤管理处国有资产管理科', '320300250000', 'hqglcgyzcglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300250600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300270000', '徐州市公安局反恐怖工作处', '320300000000', 'fkbgzzd', 36, 0, 0, '20140224新增组织机构代码。', null, null, null, null, null, null, '320300270000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300340300', '徐州市公安局警务督察室二中队', '320300340000', 'ywdczdezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300340300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300340400', '徐州市公安局警务督察室三中队', '320300340000', 'jwdczdszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300340400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300340500', '徐州市公安局警务督察室四中队', '320300340000', 'jwdczdszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300340500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030034a000', '警务督察支队五中队', '320300340000', 'jwdczdwzd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030034a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300350000', '徐州市公安局政治部', '320300000000', 'zzb', 53, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300350000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '3203003594', 'cscs2', '320300060000', 'cscs2', 1, 0, 0, 'yjghjgh', '30032', '20141108102123', '30032', '20141108102135', '320300000000', '320300000000', '3203003594', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300360000', '徐州市公安局政治部人事处', '320300350000', 'zzbrsc', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300360000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030308', '徐州市公安局治安支队综合科法制股', '320300030300', 'zazdzhkfzg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030308', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030400', '徐州市公安局治安支队政工科', '320300030000', 'zazdzgk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030500', '徐州市公安局治安支队案件查处一大队', '320300030000', 'zzzdydd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070102', '徐州市公安消防支队司令部战训科', '320300070100', 'xzsgaxfzdslbzyk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070103', '徐州市公安消防支队司令部警务科', '320300070100', 'xzsgaxfzdslbjwk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070104', '徐州市公安消防支队司令部通信科', '320300070100', 'xzsgaxfzdslbtxk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070105', '徐州市公安消防支队司令部专职队指导科', '320300070100', 'xzsgaxfzdslbzzdzdk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070106', '徐州市公安消防支队司令部调度指挥室', '320300070100', 'xzsgaxfzdslbddzhs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070107', '徐州市公安消防支队司令部特勤中队', '320300070100', 'xzsgaxfzdslbtqzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070200', '徐州市公安消防支队政治处', '320300070000', 'xzsgaxfzdzzc', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070201', '徐州市公安消防支队政治处组干科', '320300070200', 'xzsgaxfzdzzczgk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070202', '徐州市公安消防支队政治处宣传科', '320300070200', 'xzsgaxfzdzzcxck', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070203', '徐州市公安消防支队政治处纪检保卫科', '320300070200', 'xzsgaxfzdzzcjjbwk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070203', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070300', '徐州市公安消防支队后勤处', '320300070000', 'xzsgaxfzdhqc', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070301', '徐州市公安消防支队后勤处财务科', '320300070300', 'xzsgaxfzdhqccwk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070301', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070302', '徐州市公安消防支队后勤处供给装备科', '320300070300', 'xzsgaxfzdhqcggzbk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070302', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070303', '徐州市公安消防支队后勤处管理科', '320300070300', 'xzsgaxfzdhqcglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070303', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070304', '徐州市公安消防支队后勤处生产科', '320300070300', 'xzsgaxfzdhqcsck', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070304', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070305', '徐州市公安消防支队后勤处轮训队', '320300070300', 'xzsgaxfzdhqclyd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070305', '0', '1', null);
commit;
prompt 300 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070306', '徐州市公安消防支队后勤处卫生队', '320300070300', 'xzsgaxfzdhqcwsd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070306', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173402', '徐州市公安局交通警察支队车管所办公室', '320300173400', 'jyjzdcgsbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173404', '徐州市公安局交通警察支队车管所牌证股', '320300173400', 'jyjzdcgspzg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173406', '徐州市公安局交通警察支队车管所档案股', '320300173400', 'jyjzdcgsdag', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173406', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300360100', '徐州市公安局政治部人事处干部管理科', '320300360000', 'zzbrscgbglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300360100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300360200', '徐州市公安局政治部人事处工资管理科', '320300360000', 'zzbrscgzglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300360200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300360300', '徐州市公安局政治部人事处警衔管理科', '320300360000', 'zzbrscjxglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300360300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300370000', '徐州市公安局政治部组织教育处', '320300350000', 'zzbzzjyc', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300370000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300370100', '徐州市公安局政治部组织教育处表彰奖励科', '320300370000', 'zzbzzjycbzjlk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300370100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300370200', '徐州市公安局政治部组织教育处组织训练科', '320300370000', 'zzbzzjyczzylk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300370200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300380000', '徐州市公安局政治部宣传处', '320300350000', 'zzbxcc', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300380000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300150200', '徐州市公安局信访处接待科', '320300150000', 'xfcjdk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300150200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030015a000', '信访处办信室', '320300150000', 'xfcbxs', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030015a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160000', '徐州市公安局特警支队', '320300000000', 'txjzd', 32, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160200', '徐州市公安局特警支队综合科', '320300160000', 'txjzdzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160202', '徐州市公安局特警支队综合科秘书股', '320300160200', 'tjzdzhkmsg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170804', '徐州市公安局交通警察支队交通秩序管理科秩序股', '320300170800', 'jyjzdjtzxglkzxg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171200', '徐州市公安局交通警察支队法制科', '320300170000', 'jjzdfzk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171202', '徐州市公安局交通警察支队法制科法制监督股', '320300171200', 'jyjzdfzkfzjdg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172500', '徐州市公安局交通警察支队三堡公安检查站', '320300170000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171204', '徐州市公安局交通警察支队法制科审核股', '320300171200', 'jyjzdfzkshg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171206', '徐州市公安局交通警察支队法制科案件复议股', '320300171200', 'jyjzdfzkajfyg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171400', '徐州市公安局交通警察支队科技装备科', '320300170000', 'jjzdkjzbk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171402', '徐州市公安局交通警察支队科技装备科科技股', '320300171400', 'jyjzdkjzbkkjg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171404', '徐州市公安局交通警察支队科技装备科装备股', '320300171400', 'jyjzdkjzbkzbg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171600', '徐州市公安局交通警察支队云龙大队', '320300170000', 'jjzdyldd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171601', '徐州市公安局交通警察支队云龙大队政工纪检', '320300171600', 'jyjzdylddzgjj', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171601', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171602', '徐州市公安局交通警察支队云龙大队综合股', '320300171600', 'jyjzdylddzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171604', '徐州市公安局交通警察支队云龙大队业务股', '320300171600', 'jyjzdylddywg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173408', '徐州市公安局交通警察支队车管所考试股', '320300173400', 'jyjzdcgsksg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173408', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173410', '徐州市公安局交通警察支队车管所车检股', '320300173400', 'jyjzdcgscjg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173410', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173412', '徐州市公安局交通警察支队车管所车管股', '320300173400', 'jyjzdcgscgg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173412', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173414', '徐州市公安局交通警察支队车管所非机动车股', '320300173400', 'jyjzdcgsfjdcg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173414', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173600', '徐州市公安局交通警察支队培训中心', '320300170000', 'jjzdpxzx', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173601', '徐州市公安局交通警察支队培训中心政工纪检干事', '320300173600', 'jyjzdpyzxzgjjgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173601', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173602', '徐州市公安局交通警察支队培训中心办公室', '320300173600', 'jyjzdpyzxbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173604', '徐州市公安局交通警察支队培训中心教研室', '320300173600', 'jyjzdpyzxjys', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173606', '徐州市公安局交通警察支队培训中心一中队', '320300173600', 'jyjzdpyzxyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173606', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173608', '徐州市公安局交通警察支队培训中心二中队', '320300173600', 'jyjzdpyzxezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173608', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173610', '徐州市公安局交通警察支队培训中心三中队', '320300173600', 'jyjzdpyzxszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173610', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173800', '徐州市公安局交通警察支队检测中心', '320300170000', 'jjzdjczx', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173802', '徐州市公安局交通警察支队检测中心办公室', '320300173800', 'jyjzdjczxbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173803', '徐州市公安局交通警察支队检测中心政工纪检', '320300173800', 'jyjzdjczxzgjj', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173803', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173804', '徐州市公安局交通警察支队检测中心检测一股', '320300173800', 'jyjzdjczxjcyg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173806', '徐州市公安局交通警察支队检测中心检测二股', '320300173800', 'jyjzdjczxjceg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173806', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173808', '徐州市公安局交通警察支队检测中心调试股', '320300173800', 'jyjzdjczxdsg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173808', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174000', '徐州市公安局交通警察支队高速公路一大队', '320300170000', 'jjzdgsglydd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174002', '徐州市公安局交通警察支队高速公路一大队综合股', '320300174000', 'jyjzdgsglyddzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174004', '徐州市公安局交通警察支队高速公路一大队一中队', '320300174000', 'jyjzdgsglyddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174004', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174006', '徐州市公安局交通警察支队高速公路一大队二中队', '320300174000', 'jyjzdgsglyddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174006', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174008', '徐州市公安局交通警察支队高速公路一大队三中队', '320300174000', 'jyjzdgsglyddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174008', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174010', '徐州市公安局交通警察支队高速公路一大队政工纪检', '320300174000', 'jyjzdgsglyddzgjj', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174010', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174011', '徐州市公安局交通警察支队高速公路一大队四中队', '320300174000', 'jyjzdgsglyddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174011', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174100', '徐州市公安局交通警察支队高速公路二大队', '320300170000', 'jjzdgsgledd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174102', '徐州市公安局交通警察支队高速公路二大队综合股', '320300174100', 'jyjzdgsgleddzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174104', '徐州市公安局交通警察支队高速公路二大队一中队', '320300174100', 'jyjzdgsgleddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174106', '徐州市公安局交通警察支队高速公路二大队二中队', '320300174100', 'jyjzdgsgleddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174108', '徐州市公安局交通警察支队高速公路二大队政工纪检', '320300174100', 'jyjzdgsgleddzgjj', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174200', '徐州市公安局交通警察支队高速公路三大队', '320300170000', 'jjzdgsglsdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174202', '徐州市公安局交通警察支队高速公路三大队综合股', '320300174200', 'jyjzdgsglsddzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174204', '徐州市公安局交通警察支队高速公路三大队一中队', '320300174200', 'jyjzdgsglsddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174206', '徐州市公安局交通警察支队高速公路三大队二中队', '320300174200', 'jyjzdgsglsddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174208', '徐州市公安局交通警察支队高速公路三大队三中队', '320300174200', 'jyjzdgsglsddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174208', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174211', '徐州市公安局交通警察支队高速公路三大队四中队', '320300174200', 'jyjzdgsglsddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174211', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300300000', '徐州市公安局档案处', '320300000000', 'dac', 49, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300300000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300300100', '徐州市公安局档案处业务指导科', '320300300000', 'dacywzdk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300300100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300300200', '徐州市公安局档案处档案管理科', '320300300000', 'dacdaglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300300200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300310000', '徐州市公安局办公室', '320300000000', 'bgs', 50, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300310000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300310100', '徐州市公安局办公室秘书科', '320300310000', 'bgsmsk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300310100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172810', '江苏省徐州市公安局交通警察支队机动大队四中队', '320300172800', 'jyjzdjdddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172810', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173000', '徐州市公安局交通警察支队治安卡口大队', '320300170000', 'jjzdzakkdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173001', '徐州市公安局交通警察支队治安卡口大队纪检干事', '320300173000', 'jyjzdzakkddjjgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173001', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173002', '徐州市公安局交通警察支队治安卡口大队综合股', '320300173000', 'jyjzdzakkddzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173004', '徐州市公安局交通警察支队治安卡口大队出租车管理处', '320300173000', 'jyjzdzakkddczcglc', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173004', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173006', '徐州市公安局交通警察支队治安卡口大队七里沟中队', '320300173000', 'jyjzdzakkddplgzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173006', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173008', '徐州市公安局交通警察支队治安卡口大队东店子中队', '320300173000', 'jyjzdzakkddddzzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173008', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173010', '徐州市公安局交通警察支队治安卡口大队石桥中队', '320300173000', 'jyjzdzakkddsqzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173010', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173012', '徐州市公安局交通警察支队治安卡口大队秦洪桥中队', '320300173000', 'jyjzdzakkddqhqzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173012', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173014', '徐州市公安局交通警察支队治安卡口大队李沃中队', '320300173000', 'jyjzdzakkddlwzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173014', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173016', '徐州市公安局交通警察支队治安卡口大队南岗中队', '320300173000', 'jyjzdzakkddngzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173016', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173018', '徐州市公安局交通警察支队治安卡口大队火花中队', '320300173000', 'jyjzdzakkddhhzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173018', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173020', '徐州市公安局交通警察支队治安卡口大队韩山中队', '320300173000', 'jyjzdzakkddhszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173020', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173022', '徐州市公安局交通警察支队治安卡口大队茶棚中队', '320300173000', 'jyjzdzakkddcpzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173022', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173024', '徐州市公安局交通警察支队治安卡口大队翟山中队', '320300173000', 'jyjzdzakkdddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173024', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300310200', '徐州市公安局办公室调研科', '320300310000', 'bgsdyk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300310200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300310300', '徐州市公安局办公室信息科', '320300310000', 'bgsxxk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300310300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300310400', '徐州市公安局办公室机要科', '320300310000', 'bgsjyk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300310400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300310500', '徐州市公安局办公室督导科', '320300310000', 'bgsdyekddk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300310500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300310600', '江苏省徐州市公安局办公室统计科', '320300310000', 'bgstjk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300310600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300310700', '江苏省徐州市公安局办公室网站管理科', '320300310000', 'bgswzglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300310700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030031a000', '办公室网络舆论引导科', '320300310000', 'bgswlylydk', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030031a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300320000', '徐州市公安局纪委', '320300000000', 'jw', 51, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300320000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300320100', '徐州市公安局纪委综合处', '320300320000', 'jwzhc', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300320100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300320200', '徐州市公安局纪委案件检查处', '320300320000', 'jwajjcc', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300320200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300320300', '徐州市公安局纪委案件审理处', '320300320000', 'jwajslc', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300320300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300330000', '徐州市公安局指挥中心', '320300000000', 'zhzx', 0, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300330000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300330100', '徐州市公安局指挥中心综合科', '320300330000', 'zhzxzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300330100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300330200', '徐州市公安局指挥中心指挥调度科', '320300330000', 'zhzxzhddk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300330200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300330202', '徐州市公安局指挥中心指挥调度科一股', '320300330200', 'zhzxzhddkyg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300330202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300330204', '徐州市公安局指挥中心指挥调度科二股', '320300330200', 'zhzxzhddkeg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300330204', '0', '1', null);
commit;
prompt 400 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300330206', '徐州市公安局指挥中心指挥调度科三股', '320300330200', 'zhzxzhddksg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300330206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300330208', '徐州市公安局指挥中心指挥调度科四股', '320300330200', 'zhzxzhddksg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300330208', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300330300', '指挥中心巡防指导科', '320300330000', 'zhzxxfzzdk', 1, 0, 0, '20130626新增', null, null, null, null, null, null, '320300330300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300000000', '徐州市公安局', '-1', 'xzsgaj', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300000000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300010000', '国内安全保卫支队', '320300000000', 'gbzd', 22, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300010000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300010100', '徐州市公安局国内安全保卫处综合科', '320300010000', 'gbzdzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300010100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300010200', '徐州市公安局国内安全保卫处一科', '320300010000', 'gbzdydd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300010200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300010300', '徐州市公安局国内安全保卫处二科', '320300010000', 'gbzdedd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300010300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300010400', '徐州市公安局国内安全保卫处三科', '320300010000', 'gbzdsdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300010400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300010500', '徐州市公安局国内安全保卫处四科', '320300010000', 'gnaqbwcsk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300010500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300010600', '徐州市公安局国内安全保卫处五科', '320300010000', 'gbzdwdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300010600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300010700', '徐州市公安局国内安全保卫处六科', '320300010000', 'gnaqbwclk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300010700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300020000', '徐州市公安局经侦支队', '320300000000', 'jzzd', 23, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300020000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300020200', '徐州市公安局经侦支队综合科', '320300020000', 'jzzdzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300020200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300020204', '徐州市公安局经侦支队综合科秘书股', '320300020200', 'jzzdzhkmsg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300020204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300020206', '徐州市公安局经侦支队综合科法制股', '320300020200', 'jzzdzhkfzg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300020206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300020400', '徐州市公安局经侦支队一大队', '320300020000', 'jzzdydd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300020400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300020402', '徐州市公安局经侦支队一大队一中队', '320300020400', 'jzzdyddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300020402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300020404', '徐州市公安局经侦支队一大队二中队', '320300020400', 'jzzdyddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300020404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300020600', '徐州市公安局经侦支队二大队', '320300020000', 'jzzdedd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300020600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300020602', '徐州市公安局经侦支队二大队一中队', '320300020600', 'jzzdeddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300020602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300020604', '徐州市公安局经侦支队二大队二中队', '320300020600', 'jzzdeddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300020604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300020800', '徐州市公安局经侦支队三大队', '320300020000', 'jzzdsdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300020800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300020802', '徐州市公安局经侦支队三大队一中队', '320300020800', 'jzzdsddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300020802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300020804', '徐州市公安局经侦支队三大队二中队', '320300020800', 'jzzdsddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300020804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300021000', '徐州市公安局经侦支队四大队', '320300020000', 'jzzdsdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300021000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300021002', '徐州市公安局经侦支队四大队一中队', '320300021000', 'jzzdsddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300021002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300021004', '徐州市公安局经侦支队四大队二中队', '320300021000', 'jzzdsddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300021004', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300021200', '江苏省徐州市公安局经侦支队五大队', '320300020000', 'jzzdwdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300021200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302WB9432', '徐州市鼓楼区人民检察院', '320302WB9400', 'xzsglqrmjcy', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302WB9432', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303000000', '徐州市公安局云龙分局', '320300000000', 'ylfj', 2, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303000000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303010000', '云龙分局国内安全保卫科', '320303000000', 'ylfjgbdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303010000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303020000', '云龙分局经侦大队', '320303000000', 'ylfjjadd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303020000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303030000', '云龙分局治安大队', '320303000000', 'ylfjzadd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303030000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303030100', '江苏省徐州市公安局云龙分局治安大队巡防一中队', '320303030000', 'ylfjzaddyfyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303030100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303030200', '江苏省徐州市公安局云龙分局治安大队巡防二中队', '320303030000', 'ylfjzaddyfezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303030200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030502', '徐州市公安局治安支队案件查处一大队一中队', '320300030500', 'zazdajccyddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030502', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030504', '徐州市公安局治安支队案件查处一大队二中队', '320300030500', 'zazdajccyddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030504', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030600', '徐州市公安局治安支队案件查处二大队', '320300030000', 'zazdajccedd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030602', '徐州市公安局治安支队案件查处二大队一中队', '320300030600', 'zazdajcceddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030604', '徐州市公安局治安支队案件查处二大队二中队', '320300030600', 'zazdajcceddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030800', '徐州市公安局治安支队治安科', '320300030000', 'zzzdsdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030802', '徐州市公安局治安支队治安科特行管理股', '320300030800', 'zazdzaktxglg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171606', '徐州市公安局交通警察支队云龙大队一中队', '320300171600', 'jyjzdylddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171606', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171608', '徐州市公安局交通警察支队云龙大队二中队', '320300171600', 'jyjzdylddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171608', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171610', '徐州市公安局交通警察支队云龙大队三中队', '320300171600', 'jyjzdylddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171610', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300380100', '徐州市公安局政治部宣传处秘书科', '320300380000', 'zzbxccmsk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300380100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300380200', '徐州市公安局政治部宣传处对外宣传科', '320300380000', 'zzbxccdwxck', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300380200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300380300', '徐州市公安局政治部宣传处信息调研科', '320300380000', 'zzbxccxxdyk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300380300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030804', '徐州市公安局治安支队治安科公共场所管理股', '320300030800', 'zazdzakggcsglg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030806', '徐州市公安局治安支队治安科秘书股', '320300030800', 'zazdzakmsg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030806', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030808', '江苏省徐州市公安局治安支队治安科犬类管理办公室', '320300030800', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320300030808', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030900', '徐州市公安局治安支队户政科', '320300030000', 'zzzdwdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030900', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030901', '徐州市公安局治安支队户政科秘书股', '320300030900', 'zazdhzkmsg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030901', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030902', '徐州市公安局治安支队户政科户籍股', '320300030900', 'zazdhzkhjg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030902', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030904', '徐州市公安局治安支队户政科基础股', '320300030900', 'zazdhzkjcg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030904', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030906', '徐州市公安局治安支队户政科边境证办公室', '320300030900', 'zazdhzkbjzbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030906', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030908', '徐州市公安局治安支队户政科保安管理股', '320300030900', 'zazdhzkbaglg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030908', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300031000', '公安局治安支队治安科犬类管理办公室', '320300030000', 'gajzazdzakqlglbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300031000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300031200', '徐州市公安局治安支队危险物品管理科', '320300030000', 'zzzdldd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300031200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300031202', '徐州市公安局治安支队危险物品管理科爆炸物品管理股', '320300031200', 'zazdwxwpglkbzwpglg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300031202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300031204', '徐州市公安局治安支队危险物品管理科枪械管理股', '320300031200', 'zazdwxwpglkqxglg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300031204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300031206', '徐州市公安局治安支队危险物品管理科剧毒物品管理股', '320300031200', 'zazdwxwpglkjdwpglg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300031206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300031400', '徐州市公安局治安支队技术预防办公室', '320300030000', 'zazdjsyfbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300031400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300031500', '徐州市公安局治安支队身份证制作所', '320300030000', 'zazdsfzzzs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300031500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300031502', '徐州市公安局治安支队身份证制作所制作股', '320300031500', 'zazdsfzzzszzg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300031502', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300031504', '徐州市公安局治安支队身份证制作所管理股', '320300031500', 'zazdsfzzzsglg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300031504', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300031600', '江苏省徐州市公安局治安支队三大队', '320300030000', 'gajzazdsdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300031600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300031602', '江苏省徐州市公安局治安支队三大队一中队', '320300031600', 'jzazdsddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300031602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300031604', '江苏省徐州市公安局治安支队三大队二中队', '320300031600', 'zazdsddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300031604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300040000', '徐州边防检查站', '320300000000', null, 40, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320300040000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300041000', '徐州边防检查站综合办公室', '320300040000', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320300041000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300041010', '徐州边防检查站执勤业务科', '320300041000', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320300041010', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300041020', '徐州边防检查站机要查控科', '320300041000', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320300041020', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300041030', '徐州边防检查站信息中心', '320300041000', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320300041030', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300041040', '徐州边防检查站指挥中心', '320300041000', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320300041040', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300045010', '徐州边防检查站勤务中队', '320300040000', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320300045010', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300050000', '徐州市公安局刑警支队', '320300000000', 'xjzd', 25, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300050000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300050200', '徐州市公安局刑警支队纪委', '320300050000', 'xjzdjw', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300050200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300050400', '徐州市公安局刑警支队综合科', '320300050000', 'xjzdzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300050400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300050402', '徐州市公安局刑警支队综合科后勤管理股', '320300050400', 'xjzdzhkhqglg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300050402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300050404', '徐州市公安局刑警支队综合科秘书股', '320300050400', 'xjzdzhkmsg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300050404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300050600', '徐州市公安局刑警支队政工科', '320300050000', 'xjzdzgk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300050600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300050800', '徐州市公安局刑警支队法制科', '320300050000', 'xjzdfzk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300050800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051000', '徐州市公安局刑警支队一大队', '320300050000', 'xjzdydd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160204', '徐州市公安局特警支队综合科业务股', '320300160200', 'tjzdzhkywg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160400', '徐州市公安局特警支队一大队', '320300160000', 'txjzdydd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160402', '徐州市公安局特警支队一大队一中队', '320300160400', 'tjzdyddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160404', '徐州市公安局特警支队一大队二中队', '320300160400', 'tjzdyddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160406', '江苏省徐州市公安局特警支队一大队三中队', '320300160400', 'tjzdyddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160406', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160600', '徐州市公安局特警支队二大队', '320300160000', 'txjzdedd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160602', '徐州市公安局特警支队二大队一中队', '320300160600', 'tjzdeddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171612', '徐州市公安局交通警察支队云龙大队四中队', '320300171600', 'jyjzdylddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171612', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171614', '徐州市公安局交通警察支队云龙大队五中队', '320300171600', 'jyjzdylddwzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171614', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171616', '徐州市公安局交通警察支队云龙大队六中队', '320300171600', 'jyjzdylddlzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171616', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171618', '徐州市公安局交通警察支队云龙大队事故处理中队', '320300171600', 'jyjzdylddsgclzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171618', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171620', '江苏省徐州市公安局交通警察支队鼓楼大队七中队', '320300171600', 'jyjzdglddpzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171620', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171800', '徐州市公安局交通警察支队鼓楼大队', '320300170000', 'jjzdgldd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171801', '徐州市公安局交通警察支队鼓楼大队政工干事', '320300171800', 'jyjzdglddzggs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171801', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171802', '徐州市公安局交通警察支队鼓楼大队综合股', '320300171800', 'jyjzdglddzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171802', '0', '1', null);
commit;
prompt 500 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171804', '徐州市公安局交通警察支队鼓楼大队业务股', '320300171800', 'jyjzdglddywg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171806', '徐州市公安局交通警察支队鼓楼大队一中队', '320300171800', 'jyjzdglddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171806', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171808', '徐州市公安局交通警察支队鼓楼大队二中队', '320300171800', 'jyjzdglddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171808', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171810', '徐州市公安局交通警察支队鼓楼大队三中队', '320300171800', 'jyjzdglddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171810', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171812', '徐州市公安局交通警察支队鼓楼大队四中队', '320300171800', 'jyjzdglddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171812', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171814', '徐州市公安局交通警察支队鼓楼大队五中队', '320300171800', 'jyjzdglddwzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171814', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171816', '徐州市公安局交通警察支队鼓楼大队六中队', '320300171800', 'jyjzdglddlzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171816', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171818', '徐州市公安局交通警察支队鼓楼大队事故处理中队', '320300171800', 'jyjzdglddsgclzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171818', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300171820', '江苏省徐州市公安局交通警察支队云龙大队七中队', '320300171800', 'jyjzdylddpzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300171820', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172000', '徐州市公安局交通警察支队泉山大队', '320300170000', 'jjzdqsdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172001', '徐州市公安局交通警察支队泉山大队政工干事', '320300172000', 'jyjzdqsddzggs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172001', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172002', '徐州市公安局交通警察支队泉山大队综合股', '320300172000', 'jyjzdqsddzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172004', '徐州市公安局交通警察支队泉山大队业务股', '320300172000', 'jyjzdqsddywg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172004', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172006', '徐州市公安局交通警察支队泉山大队一中队', '320300172000', 'jyjzdqsddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172006', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172008', '徐州市公安局交通警察支队泉山大队二中队', '320300172000', 'jyjzdqsddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172008', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172010', '徐州市公安局交通警察支队泉山大队三中队', '320300172000', 'jyjzdqsddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172010', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172012', '徐州市公安局交通警察支队泉山大队四中队', '320300172000', 'jyjzdqsddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172012', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172014', '徐州市公安局交通警察支队泉山大队五中队', '320300172000', 'jyjzdqsddwzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172014', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172016', '徐州市公安局交通警察支队泉山大队六中队', '320300172000', 'jyjzdqsddlzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172016', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172018', '徐州市公安局交通警察支队泉山大队七中队', '320300172000', 'jyjzdqsddpzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172018', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172020', '徐州市公安局交通警察支队泉山大队八中队', '320300172000', 'jyjzdqsddbzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172020', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172022', '徐州市公安局交通警察支队泉山大队事故处理中队', '320300172000', 'jyjzdqsddsgclzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172022', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172200', '徐州市公安局交通警察支队九里大队', '320300170000', 'jjzdjldd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172201', '徐州市公安局交通警察支队九里大队政工干事', '320300172200', 'jyjzdjlddzggs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172202', '徐州市公安局交通警察支队九里大队综合股', '320300172200', 'jyjzdjlddzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172204', '徐州市公安局交通警察支队九里大队业务股', '320300172200', 'jyjzdjlddywg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173026', '徐州市公安局交通警察支队治安卡口大队巡逻一中队', '320300173000', 'jyjzdzakkddylyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173026', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173028', '徐州市公安局交通警察支队治安卡口大队巡逻二中队', '320300173000', 'jyjzdzakkddylezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173028', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173300', '徐州市公安局交警支队指挥中心', '320300170000', 'xzsgajjjzdzhzx', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320300173300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172408', '徐州市公安局交通警察支队事故处理大队二中队', '320300172400', 'jyjzdsgclddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172408', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172410', '江苏省徐州市公安局交通警察支队事故处理大队三中队', '320300172400', 'jyjzdsgclddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172410', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172412', '徐州市公安局交通警察支队事故处理大队四中队', '320300172400', 'jyjzdsgclddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172412', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172414', '徐州市公安局交通警察支队事故处理大队五中队', '320300172400', 'jyjzdsgclddwzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172414', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172416', '徐州市公安局交通警察支队事故处理大队六中队', '320300172400', 'jyjzdsgclddlzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172416', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172600', '徐州市公安局交通警察支队设施大队', '320300170000', 'jjzdssdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172602', '徐州市公安局交通警察支队设施大队综合股', '320300172600', 'jyjzdssddzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172604', '徐州市公安局交通警察支队设施大队工程中队', '320300172600', 'jyjzdssddgczd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172606', '徐州市公安局交通警察支队设施大队标线中队', '320300172600', 'jyjzdssddbxzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172606', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172700', '徐州市公安局交通警察支队京台公安检查站', '320300170000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172800', '徐州市公安局交通警察支队机动大队', '320300170000', 'jjzdjddd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172802', '徐州市公安局交通警察支队机动大队综合股', '320300172800', 'jyjzdjdddzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172804', '徐州市公安局交通警察支队机动大队一中队', '320300172800', 'jyjzdjdddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172806', '徐州市公安局交通警察支队机动大队二中队', '320300172800', 'jyjzdjdddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172806', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172808', '江苏省徐州市公安局交通警察支队机动大队三中队', '320300172800', 'jyjzdjdddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172808', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172900', '徐州市公安局交通警察支队红花埠公安检查站', '320300170000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300330400', '指挥中心情报信息科', '320300330000', 'zhzxqbxxk', 1, 0, 0, '20130626新增', null, null, null, null, null, null, '320300330400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300340000', '徐州市公安局警务督察支队', '320300000000', 'jwddzd', 37, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300340000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300340100', '徐州市公安局警务督察室秘书科', '320300340000', 'jwdczdzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300340100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300340200', '徐州市公安局警务督察室一中队', '320300340000', 'jwdczdyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300340200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160604', '徐州市公安局特警支队二大队二中队', '320300160600', 'tjzdeddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160800', '徐州市公安局特警支队三大队', '320300160000', 'txjzdsdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160802', '徐州市公安局特警支队三大队一中队', '320300160800', 'tjzdsddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300160804', '徐州市公安局特警支队三大队二中队', '320300160800', 'tjzdsddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300160804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300161000', '徐州市公安局特警支队四大队', '320300160000', 'txjzdsdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300161000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300161002', '徐州市公安局特警支队四大队一中队', '320300161000', 'tjzdsddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300161002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300161004', '徐州市公安局特警支队四大队二中队', '320300161000', 'tjzdsddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300161004', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030016a000', '特巡警支队政工科', '320300160000', 'txjzdzgk', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030016a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030016a100', '特巡警支队巡防指导科', '320300160000', 'txjzdxfzdk', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030016a100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030016a200', '特巡警支队五大队', '320300160000', 'txjzdwdd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030016a200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170000', '徐州市公安局交通警察支队', '320300000000', 'jjzd', 33, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170200', '徐州市公安局交通警察支队纪委', '320300170000', 'jjzdjw', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170400', '徐州市公安局交通警察支队工会', '320300170000', 'jjzdgh', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170600', '徐州市公安局交通警察支队综合科', '320300170000', 'jjzdzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170602', '徐州市公安局交通警察支队综合科秘书股', '320300170600', 'jyjzdzhkmsg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170606', '徐州市公安局交通警察支队综合科后勤管理股', '320300170600', 'jyjzdzhkhqglg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170606', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170607', '徐州市公安局交通警察支队综合科装备股', '320300170600', 'jyjzdzhkzbg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170607', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170608', '徐州市公安局交通警察支队综合科小车队', '320300170600', 'jyjzdzhkxcd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170608', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170700', '徐州市公安局交通警察支队政工科', '320300170000', 'jjzdzgk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170702', '徐州市公安局交通警察支队政工科人事管理股', '320300170700', 'jyjzdzgkrsglg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170702', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170704', '徐州市公安局交通警察支队政工科宣传股', '320300170700', 'jyjzdzgkxcg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170704', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170706', '徐州市公安局交通警察支队政工科教育股', '320300170700', 'jyjzdzgkjyg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170706', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170800', '徐州市公安局交通警察支队交通秩序管理科', '320300170000', 'jjzdjtzxglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300170802', '徐州市公安局交通警察支队交通秩序管理科综合股', '320300170800', 'jyjzdjtzxglkzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300170802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300390000', '徐州市公安局机关党委', '320300000000', 'jgdw', 54, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300390000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300390200', '徐州市公安局工会', '320300390000', 'gh', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300390200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300390400', '徐州市公安局团委', '320300390000', 'tw', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300390400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300400000', '徐州市公安局老干部处', '320300350000', 'zzbltxgbc', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300400000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300430000', '徐州市劳动教养管理委员会', '320300000000', 'xzsldjyglwyh', 63, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300430000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300440000', '徐州市公安局人民警察培训学校', '320300000000', 'rmjcpyyx', 56, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300440000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300440400', '徐州市公安局人民警察培训学校综合科', '320300440000', 'rmjcpyyxzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300440400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300440600', '徐州市公安局人民警察培训学校教务科', '320300440000', 'rmjcpyyxjwk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300440600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300440601', '徐州市公安局人民警察培训学校教务科科技股', '320300440600', 'rmjcpyyxjwkkjg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300440601', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300440603', '徐州市公安局人民警察培训学校教务科政教股', '320300440600', 'rmjcpyyxjwkzjg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300440603', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300440605', '徐州市公安局人民警察培训学校教务科法制股', '320300440600', 'rmjcpyyxjwkfzg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300440605', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300440607', '徐州市公安局人民警察培训学校教务科业务股', '320300440600', 'rmjcpyyxjwkywg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300440607', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300440700', '徐州市公安局人民警察培训学校培训科', '320300440000', 'rmjcpyyxpyk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300440700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300440701', '江苏省徐州市公安局人民警察培训学校培训科警务技能教研股', '320300440700', 'rmjcpyyxpykjwjnjyg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300440701', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173400', '徐州市公安局交通警察支队车管所', '320300170000', 'jjzdcgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300173401', '徐州市公安局交通警察支队车管所政工纪检', '320300173400', 'jyjzdcgszgjj', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300173401', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030027a000', '反恐怖工作支队综合科', '320300270000', 'fkbgzzdzhk', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030027a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174300', '徐州市公安局交通警察支队大屯大队', '320300170000', 'jjzddtdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174400', '徐州市公安局交通警察支队高速公路四大队', '320300170000', 'jjzdgsglsdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174402', '徐州市公安局交通警察支队高速公路四大队综合股', '320300174400', 'jyjzdgsglsddzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174404', '徐州市公安局交通警察支队高速公路四大队一中队', '320300174400', 'jyjzdgsglsddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174406', '徐州市公安局交通警察支队高速公路四大队二中队', '320300174400', 'jyjzdgsglsddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174406', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174500', '徐州市公安局交通警察支队高速公路管理科', '320300170000', 'jjzdgsglglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174600', '徐州市公安局交通警察支队高速公路六大队', '320300170000', 'jjzdgsglldd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174700', '徐州市公安局交通警察支队高速公路五大队', '320300170000', 'jjzdgsglwdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174702', '徐州市公安局交通警察支队高速公路五大队综合股', '320300174700', 'jyjzdgsglwddzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174702', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174706', '徐州市公安局交通警察支队高速公路五大队二中队', '320300174700', 'jyjzdgsglwddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300174706', '0', '1', null);
commit;
prompt 600 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174800', '徐州市公安局交警支队高速公路七大队', '320300170000', 'jjzdgsqdd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320300174800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174802', '徐州市公安局交警支队高速公路七大队一中队', '320300174800', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174804', '徐州市公安局交警支队高速公路七大队二中队', '320300174800', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174806', '徐州市公安局交警支队高速公路七大队三中队', '320300174800', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174808', '徐州市公安局交警支队高速公路七大队四中队', '320300174800', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174900', '徐州市公安局交通警察支队高架快速路大队', '320300170000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174902', '徐州市公安局交通警察支队高架快速路大队业务股', '320300174900', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174904', '徐州市公安局交通警察支队高架快速路大队一中队', '320300174900', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174906', '徐州市公安局交通警察支队高架快速路大队二中队', '320300174900', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303030300', '江苏省徐州市公安局云龙分局治安大队巡防三中队', '320303030000', 'ylfjzaddyfszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303030300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303030400', '江苏省徐州市公安局云龙分局治安大队巡防四中队', '320303030000', 'ylfjzaddyfszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303030400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303050000', '云龙分局刑警大队', '320303000000', 'ylfjxjdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303050000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303050200', '云龙分局刑警大队办公室', '320303050000', 'ylfjxjddbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303050200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303050400', '云龙分局刑警大队一中队', '320303050000', 'ylfjxjddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303050400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174908', '徐州市公安局交通警察支队高架快速路大队三中队', '320300174900', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300174910', '徐州市公安局交通警察支队高架快速路大队事故中队', '320300174900', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030017a000', '交警支队公共交通大队', '320300170000', 'jjzdggjtdd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030017a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030017a100', '交警支队高架快速路大队', '320300170000', 'jjzdgjksldd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030017a100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300180000', '徐州市公安局法制处', '320300000000', 'fzzd', 34, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300180000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300180100', '徐州市公安局法制处秘书科', '320300180000', 'jjzdzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300180100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300180200', '徐州市公安局法制处复议应诉科', '320300180000', 'jjzdedfyys', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300180200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300180300', '徐州市公安局法制处案件审核科', '320300180000', 'jjzdwdajsh', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300180300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300180400', '徐州市公安局法制处执法监督科', '320300180000', 'jjzdydfzjg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300180400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300180500', '徐州市公安局法制处劳教审批科', '320300180000', 'jjzdsdajfk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300180500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300180600', '徐州市公安局法制处法规科', '320300180000', 'jjzdsdgf', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300180600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300200000', '徐州市公安局计划财务处', '320300000000', 'jhcwc', 43, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300200000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300200100', '徐州市公安局计划财务处秘书科', '320300200000', 'jhcwcmsk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300200100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300200200', '徐州市公安局计划财务处财务一科', '320300200000', 'jhcwccwyk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300200200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300200300', '徐州市公安局计划财务处财务二科', '320300200000', 'jhcwccwek', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300200300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300200400', '徐州市公安局计划财务处云龙分局财务股', '320300200000', 'jhcwcylfjcwg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300200400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300200500', '徐州市公安局计划财务处鼓楼分局财务股', '320300200000', 'jhcwcglfjcwg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300200500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300200600', '徐州市公安局计划财务处泉山分局财务股', '320300200000', 'jhcwcqsfjcwg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300200600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300200700', '徐州市公安局计划财务处九里分局财务股', '320300200000', 'jhcwcjlfjcwg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300200700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300200800', '徐州市公安局计划财务处广场分局财务股', '320300200000', 'jhcwcgcfjcwg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300200800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300200900', '徐州市公安局计划财务处警校财务股', '320300200000', 'jhcwcjxcwg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300200900', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300201000', '徐州市公安局计划财务处治安支队财务股', '320300200000', 'jhcwczazdcwg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300201000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303550108', '云龙分局王杰派出所社区民警中队子房山责任区', '320303550100', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300201100', '徐州市公安局计划财务处交通警察支队财务股', '320300200000', 'jhcwcjyjzdcwg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300201100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300201200', '徐州市公安局计划财务处刑警支队财务股', '320300200000', 'jhcwcxjzdcwg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300201200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300210000', '徐州市公安局禁毒支队', '320300000000', 'jdzd', 35, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300210000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300210100', '徐州市公安局禁毒处秘书科', '320300210000', 'jdzdzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300210100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300210200', '徐州市公安局禁毒处禁毒科', '320300210000', 'jdcjdk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300210200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300210300', '徐州市公安局禁毒处缉毒队', '320300210000', 'jdcjdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300210300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300220000', '江苏省徐州市公安局科技处', '320300000000', 'kjc', 62, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300220000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300230000', '徐州市公安局信息通信处', '320300000000', 'xxtxc', 45, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300230000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300230200', '徐州市公安局信息通信处计算机应用科', '320300230000', 'xxtxcyykfk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300230200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300230400', '徐州市公安局信息通信处无线科', '320300230000', 'xxtxcwxglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300230400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300230600', '徐州市公安局信息通信处有线科', '320300230000', 'xxtxcwlglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300230600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300230800', '徐州市公安局信息通信处信管科', '320300230000', 'xxtxcxxglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300230800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300231000', '徐州市公安局信息通信处秘书科', '320300230000', 'xxtxcmsk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300231000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051002', '徐州市公安局刑警支队一大队一中队', '320300051000', 'xjzdyddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070308', '徐州市公安消防支队后勤处修理所', '320300070300', 'xzsgaxfzdhqcxls', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070308', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070309', '徐州市公安消防支队后勤处机关食堂', '320300070300', 'xzsgaxfzdhqcjgst', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070309', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070310', '徐州市公安消防支队后勤处招待所', '320300070300', 'xzsgaxfzdhqczds', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070310', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070400', '徐州市公安消防支队防火处', '320300070000', 'xzsgaxfzdfhc', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070401', '徐州市公安消防支队防火处监督管理科', '320300070400', 'xzsgaxfzdfhcjdglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070401', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070402', '徐州市公安消防支队防火处建筑审核科', '320300070400', 'xzsgaxfzdfhcjzshk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070403', '徐州市公安消防支队防火处法制科', '320300070400', 'xzsgaxfzdfhcfzk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070403', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070404', '徐州市公安消防支队防火处重点保卫科', '320300070400', 'xzsgaxfzdfhczdbwk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070405', '徐州市公安消防支队防火处验收科', '320300070400', 'xzsgaxfzdfhcysk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070405', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070406', '徐州市公安消防支队防火处火灾原因调查科', '320300070400', 'xzsgaxfzdfhchzyydck', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070406', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070407', '徐州市公安消防支队防火处宣传中心', '320300070400', 'xzsgaxfzdfhcxczx', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070407', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070500', '徐州市公安消防支队特勤大队', '320300070000', 'xzsgaxfzdtqdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070501', '徐州市公安消防支队特勤大队一中队', '320300070500', 'xzsgaxfzdtqddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070501', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070502', '徐州市公安消防支队特勤大队二中队', '320300070500', 'xzsgaxfzdtqddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070502', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300080000', '徐州市公安局警卫处', '320300000000', 'jwc', 61, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300080000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300090000', '单位内部安全保卫支队', '320300000000', 'dwnbaqbwzd', 28, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300090000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300090100', '徐州市公安局经济文化保卫处秘书科', '320300090000', 'jjwhbwcmsk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300090100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300440702', '江苏省徐州市公安局人民警察培训学校培训科学员管理股', '320300440700', 'rmjcpyyxpykyyglg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300440702', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300440800', '徐州市公安局人民警察培训学校总务科', '320300440000', 'rmjcpyyxzwk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300440800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300440801', '徐州市公安局人民警察培训学校总务科行政股', '320300440800', 'rmjcpyyxzwkxzg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300440801', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300440803', '徐州市公安局人民警察培训学校总务科膳食股', '320300440800', 'rmjcpyyxzwkssg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300440803', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300460000', '徐州市公安局有组织犯罪侦查支队', '320300000000', 'yzzfzzczd', 38, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300460000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300460200', '徐州市公安局有组织犯罪侦查支队侦查一队', '320300460000', 'yzzfzzczdzcyd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300460200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172206', '徐州市公安局交通警察支队九里大队一中队', '320300172200', 'jyjzdjlddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172208', '徐州市公安局交通警察支队九里大队二中队', '320300172200', 'jyjzdjlddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172208', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172210', '徐州市公安局交通警察支队九里大队三中队', '320300172200', 'jyjzdjlddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172210', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172212', '徐州市公安局交通警察支队九里大队四中队', '320300172200', 'jyjzdjlddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172212', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172214', '徐州市公安局交通警察支队九里大队事故处理中队', '320300172200', 'jyjzdjlddsgclzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172214', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172300', '徐州市公安局交通警察支队经济技术开发区大队', '320300170000', 'jjzdjjjskfqdd', 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172301', '徐州市公安局交通警察支队经济技术开发区大队业务股', '320300172300', null, 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172301', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172302', '徐州市公安局交通警察支队经济技术开发区大队综合股', '320300172300', null, 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172302', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300460400', '徐州市公安局有组织犯罪侦查支队侦查二队', '320300460000', 'yzzfzzczdzced', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300460400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300460600', '徐州市公安局有组织犯罪侦查支队情报队', '320300460000', 'yzzfzzczdqbd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300460600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300460800', '徐州市公安局有组织犯罪侦查支队综合科', '320300460000', 'yzzfzzczdzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300460800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030046a000', '有组织犯罪侦查支队侦查三队', '320300460000', 'yzzfzzczdzcsd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030046a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300a00000', '行政许可服务处', '320300000000', 'xzxkfwc', 64, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320300a00000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300a10000', '徐州市第二看守所', '320300000000', 'xzsdekss', 65, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320300a10000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300a20000', '基建办', '320300000000', 'jjb', 66, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320300a20000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300a30000', '保安公司', '320300000000', 'bags', 67, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320300a30000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300a40000', '武警支队', '320300000000', 'wjzd', 60, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320300a40000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300a50000', '政治部综合处', '320300350000', 'zzbzhk', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320300a50000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300WB9431', '徐州市中级人民法院', '320300WB9400', 'xzszjrmfy', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300WB9431', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300WB9432', '徐州市人民检察院', '320300WB9400', 'xzsrmjcy', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300WB9432', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302000000', '徐州市公安局鼓楼分局', '320300000000', 'glfj', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302000000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302010000', '鼓楼分局国内安全保卫科', '320302000000', 'glfjgbdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302010000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302020000', '鼓楼分局经侦大队', '320302000000', 'glfjjzdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302020000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302030000', '鼓楼分局治安大队', '320302000000', 'glfjzadd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302030000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302030100', '江苏省徐州市公安局鼓楼分局治安大队巡防一中队', '320302030000', 'glfjzaddyfyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302030100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302030200', '江苏省徐州市公安局鼓楼分局治安大队巡防二中队', '320302030000', 'glfjzaddyfezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302030200', '0', '1', null);
commit;
prompt 700 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302030300', '江苏省徐州市公安局鼓楼分局治安大队巡防三中队', '320302030000', 'glfjzaddyfszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302030300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302030400', '江苏省徐州市公安局鼓楼分局治安大队巡防四中队', '320302030000', 'glfjzaddyfszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302030400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302050000', '鼓楼分局刑警大队', '320302000000', 'glfjxjdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302050000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302050200', '鼓楼分局刑警大队办公室', '320302050000', 'glfjxjddbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302050200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302050400', '鼓楼分局刑警大队一中队', '320302050000', 'glfjxjddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302050400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302050600', '鼓楼分局刑警大队二中队', '320302050000', 'glfjxjddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302050600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302050800', '鼓楼分局刑警大队三中队', '320302050000', 'glfjxjddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302050800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302051000', '鼓楼分局刑警大队四中队', '320302050000', 'glfjxjddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302051000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302051200', '鼓楼分局刑警大队五中队', '320302050000', 'glfjxjddwzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302051200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302051400', '鼓楼分局刑警大队六中队', '320302050000', 'glfjxjddlzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302051400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302060000', '鼓楼分局出入境管理科', '320302000000', 'glfjcrjglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302060000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302070000', '徐州市公安消防支队鼓楼区消防大队', '320302000000', 'xzsgaxfzdglqxfdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302070000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302070100', '徐州市公安消防支队鼓楼区大队孟家沟中队', '320302070000', 'xzsgaxfzdglqddmjgzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302070100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560111', '鼓楼分局东站派出所社区民警中队坝子责任区', '320302560100', 'glfjdzpcssqmjzdbzzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560200', '鼓楼分局东站派出所治安民警中队', '320302560000', 'glfjdzpcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560201', '鼓楼分局东站派出所巡逻处警中队', '320302560200', 'glfjdzpcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560300', '鼓楼分局东站派出所刑警中队', '320302560000', 'glfjdzpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570000', '鼓楼分局丰财派出所', '320302000000', 'glfjfcpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303050600', '云龙分局刑警大队二中队', '320303050000', 'ylfjxjddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303050600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303050800', '云龙分局刑警大队三中队', '320303050000', 'ylfjxjddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303050800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303051000', '云龙分局刑警大队四中队', '320303050000', 'ylfjxjddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303051000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303051200', '云龙分局刑警大队五中队', '320303050000', 'ylfjxjddwzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320303051200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570100', '鼓楼分局丰财派出所社区民警中队', '320302570000', 'glfjfcpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570101', '鼓楼分局丰财派出所社区民警中队建东责任区', '320302570100', 'glfjfcpcssqmjzdjdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570102', '鼓楼分局丰财派出所社区民警中队怡园亭责任区', '320302570100', 'glfjfcpcssqmjzdytzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570103', '鼓楼分局丰财派出所社区民警中队香园阁责任区', '320302570100', 'glfjfcpcssqmjzdxygzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570104', '鼓楼分局丰财派出所社区民警中队新征责任区', '320302570100', 'glfjfcpcssqmjzdxzzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570105', '鼓楼分局丰财派出所社区民警中队三角线责任区', '320302570100', 'glfjfcpcssqmjzdsjxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570106', '鼓楼分局丰财派出所社区民警中队新兴责任区', '320302570100', 'glfjfcpcssqmjzdxxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570107', '鼓楼分局丰财派出所社区民警中队新建责任区', '320302570100', 'glfjfcpcssqmjzdxjzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570108', '鼓楼分局丰财派出所社区民警中队白下责任区', '320302570100', 'glfjfcpcssqmjzdbxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570109', '鼓楼分局丰财派出所社区民警中队铁东责任区', '320302570100', 'glfjfcpcssqmjzdtdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570110', '鼓楼分局丰财派出所社区民警中队兴东责任区', '320302570100', 'glfjfcpcssqmjzdxdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570111', '鼓楼分局丰财派出所社区民警中队红旗责任区', '320302570100', 'glfjfcpcssqmjzdhpzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570112', '鼓楼分局丰财派出所社区民警中队铁兴责任区', '320302570100', 'glfjfcpcssqmjzdtxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570114', '鼓楼分局丰财派出所社区民警中队二七责任区', '320302570100', 'glfjfcpcssqmjzdepzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570114', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570115', '鼓楼分局丰财派出所社区民警中队铁建责任区', '320302570100', 'glfjfcpcssqmjzdtjzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570115', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570116', '鼓楼分局丰财派出所社区民警中队二坝北责任区', '320302570100', 'glfjfcpcssqmjzdebbzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570116', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570117', '鼓楼分局丰财派出所社区民警中队复北责任区', '320302570100', 'glfjfcpcssqmjzdfbzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570117', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570118', '鼓楼分局丰财派出所社区民警中队沙河责任区', '320302570100', 'glfjfcpcssqmjzdshzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570118', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570200', '鼓楼分局丰财派出所治安民警中队', '320302570000', 'glfjfcpcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570201', '鼓楼分局丰财派出所巡逻处警中队', '320302570200', 'glfjfcpcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302570300', '鼓楼分局丰财派出所刑警中队', '320302570000', 'glfjfcpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302570300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302580000', '鼓楼分局杨庄派出所', '320302000000', 'glfjyzpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302580000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302580100', '鼓楼分局杨庄派出所社区民警中队', '320302580000', 'glfjyzpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302580100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302580101', '鼓楼分局杨庄派出所社区民警中队瓦房责任区', '320302580100', 'glfjyzpcssqmjzdwfzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302580101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302580102', '鼓楼分局杨庄派出所社区民警中队煤机东村责任区', '320302580100', 'glfjyzpcssqmjzdmjdczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302580102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302580103', '鼓楼分局杨庄派出所社区民警中队煤机西村责任区', '320302580100', 'glfjyzpcssqmjzdmjxczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302580103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302580104', '鼓楼分局杨庄派出所社区民警中队徐钢责任区', '320302580100', 'glfjyzpcssqmjzdxgzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302580104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302580105', '鼓楼分局杨庄派出所社区民警中队下淀责任区', '320302580100', 'glfjyzpcssqmjzdxdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302580105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302580106', '鼓楼分局杨庄派出所社区民警中队二九小区责任区', '320302580100', 'glfjyzpcssqmjzdejxqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302580106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302580200', '鼓楼分局杨庄派出所治安民警中队', '320302580000', 'glfjyzpcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302580200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302580201', '鼓楼分局杨庄派出所巡逻处警中队', '320302580200', 'glfjyzpcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302580201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302580300', '鼓楼分局杨庄派出所刑警中队', '320302580000', 'glfjyzpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302580300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590000', '鼓楼分局铜沛派出所', '320302000000', 'glfjtppcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590100', '鼓楼分局铜沛派出所社区民警中队', '320302590000', 'glfjtppcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590101', '鼓楼分局铜沛派出所社区民警中队沈场村、闫沃村责任区', '320302590100', 'glfjtppcssqmjzdsccwczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590108', '鼓楼分局铜沛派出所社区民警中队铜建责任区', '320302590100', 'glfjtppcssqmjzdtjzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590109', '鼓楼分局铜沛派出所社区民警中队兵工责任区', '320302590100', 'glfjtppcssqmjzdbgzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590110', '鼓楼分局铜沛派出所社区民警中队西阁责任区', '320302590100', 'glfjtppcssqmjzdxgzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590111', '鼓楼分局铜沛派出所社区民警中队机场责任区', '320302590100', 'glfjtppcssqmjzdjczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590112', '鼓楼分局铜沛派出所社区民警中队花园责任区', '320302590100', 'glfjtppcssqmjzdhyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590113', '鼓楼分局铜沛派出所社区民警中队道北责任区', '320302590100', 'glfjtppcssqmjzddbzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590113', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590114', '鼓楼分局铜沛派出所社区民警中队港南责任区', '320302590100', 'glfjtppcssqmjzdgnzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590114', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590200', '鼓楼分局铜沛派出所治安民警中队', '320302590000', 'glfjtppcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590201', '鼓楼分局铜沛派出所巡逻处警中队', '320302590200', 'glfjtppcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302590300', '鼓楼分局铜沛派出所刑警中队', '320302590000', 'glfjtppcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302590300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600000', '鼓楼分局九里派出所', '320302000000', 'glfjgspcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600100', '鼓楼分局九里派出所社区民警中队', '320302600000', 'glfjgspcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600101', '鼓楼分局九里派出所社区民警中队天齐村责任区', '320302600100', 'glfjgspcssqmjzdtpczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600102', '鼓楼分局九里派出所社区民警中队刘楼村责任区', '320302600100', 'glfjgspcssqmjzdllczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600103', '鼓楼分局九里派出所社区民警中队九里村责任区', '320302600100', 'glfjgspcssqmjzdjlczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600104', '鼓楼分局九里派出所社区民警中队省煤建公司机场责任区', '320302600100', 'glfjgspcssqmjzdsmjgsjczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600105', '鼓楼分局九里派出所社区民警中队三河尖矿基地西院责任区', '320302600100', 'glfjgspcssqmjzdshjkjdxyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600106', '鼓楼分局九里派出所社区民警中队三河尖矿基地东院责任区', '320302600100', 'glfjgspcssqmjzdshjkjddyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600107', '鼓楼分局九里派出所社区民警中队三河尖矿龙固工人村责任区', '320302600100', 'glfjgspcssqmjzdshjklggrczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600108', '鼓楼分局九里派出所社区民警中队孤山村责任区', '320302600100', 'glfjgspcssqmjzdgsczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600109', '鼓楼分局九里派出所社区民警中队李屯村责任区', '320302600100', 'glfjgspcssqmjzdltczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600110', '鼓楼分局九里派出所社区民警中队美尔责任区', '320302600100', 'glfjgspcssqmjzdmezrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600111', '鼓楼分局九里派出所社区民警中队勘探二队责任区', '320302600100', 'glfjgspcssqmjzdktedzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302600300', '鼓楼分局九里派出所刑警中队', '320302600000', 'glfjgspcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302600300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302610000', '鼓楼分局孟家沟水上派出所', '320302000000', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320302610000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302620000', '鼓楼分局万寨水上派出所', '320302000000', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320302620000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302a00000', '鼓楼分局派出所消防指导办', '320302000000', 'glfjpcsxfzdb', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320302a00000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302a10000', '鼓楼分局科信科', '320302000000', 'glfjkxk', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320302a10000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302a20000', '鼓楼分局档案室', '320302000000', 'glfjdas', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320302a20000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302a30000', '鼓楼分局维稳办', '320302000000', 'glfjwwb', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320302a30000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302a40000', '鼓楼分局作风办', '320302000000', 'glfjzfb', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320302a40000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302a50000', '鼓楼分局计财科', '320302000000', 'glfjjck', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320302a50000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302a60000', '鼓楼分局网安大队', '320302000000', 'glfjwadd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '320302a60000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030027a100', '反恐怖工作支队一队', '320300270000', 'fkbgzzdyd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030027a100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030027a200', '反恐怖工作支队二队', '320300270000', 'fkbgzzded', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030027a200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300290000', '徐州市公安局维护稳定工作领导小组办公室', '320300000000', 'wwb', 48, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300290000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030029a000', '维稳办信息调研处', '320300290000', 'wwbxxdyc', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030029a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030029a100', '维稳办联络督办处', '320300290000', 'wwblldbc', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030029a100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030029a200', '维稳办稳评指导处', '320300290000', 'wwbwpzdc', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030029a200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300090200', '徐州市公安局经济文化保卫处经济保卫科', '320300090000', 'jjwhbwcjjbwk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300090200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300090300', '徐州市公安局经济文化保卫处机关保卫科', '320300090000', 'jjwhbwcjgbwk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300090300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300090400', '徐州市公安局经济文化保卫处大学保卫科', '320300090000', 'jjwhbwcdybwk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300090400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300090500', '徐州市公安局经济文化保卫处金融保卫科', '320300090000', 'jjwhbwcjrbwk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300090500', '0', '1', null);
commit;
prompt 800 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300090600', '徐州市公安局经济文化保卫处案件查处科', '320300090000', 'jjwhbwcajcck', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300090600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030002a000', '经侦支队六大队', '320300020000', 'jzzdldd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030002a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030000', '徐州市公安局治安支队', '320300000000', 'zazd', 24, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030200', '徐州市公安局治安支队纪委', '320300030000', 'zazdjw', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030300', '徐州市公安局治安支队综合科', '320300030000', 'zazdzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030302', '徐州市公安局治安支队综合科秘书股', '320300030300', 'zazdzhkmsg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030302', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300030306', '徐州市公安局治安支队综合科后勤管理股', '320300030300', 'zazdzhkhqglg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300030306', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051004', '徐州市公安局刑警支队一大队二中队', '320300051000', 'xjzdyddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051004', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051006', '徐州市公安局刑警支队一大队三中队', '320300051000', 'xjzdyddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051006', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051008', '徐州市公安局刑警支队一大队四中队', '320300051000', 'xjzdyddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051008', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051200', '徐州市公安局刑警支队二大队', '320300050000', 'xjzdedd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051202', '徐州市公安局刑警支队二大队一中队', '320300051200', 'xjzdeddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051202', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300090700', '徐州市公安局经济文化保卫处保卫队伍管理科', '320300090000', 'jjwhbwcbwdwglk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300090700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172307', '徐州市公安局交警支队经济技术开发区大队高铁中队', '320300172300', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300110000', '徐州市公安局信息网络安全监察处', '320300000000', 'wlaqbwzd', 29, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300110000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300110100', '徐州市公安局信息网络安全监察处安全监察科', '320300110000', 'xxwlaqjccaqjck', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300110100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300110200', '徐州市公安局信息网络安全监察处案件查处科', '320300110000', 'xxwlaqjccajcck', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300110200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300110300', '徐州市公安局信息网络安全监察处秘书科', '320300110000', 'xxwlaqjccmsk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300110300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300110400', '江苏省徐州市公安局网络警察支队情报侦察队', '320300110000', 'wljczdqbzcd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300110400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300110500', '江苏省徐州市公安局网络警察支队网络治安队', '320300110000', 'wljczdwlzad', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300110500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300110600', '江苏省徐州市公安局网络警察支队技术对策队', '320300110000', 'wljczdjsdcd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300110600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300110700', '江苏省徐州市公安局网络警察支队综合科', '320300110000', 'wljczdzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300110700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300120000', '徐州市公安局行动技术处', '320300000000', 'jszczd', 30, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300120000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300120100', '徐州市公安局行动技术处综合科', '320300120000', 'xdjsczhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300120100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300120200', '徐州市公安局行动技术处国际情报队', '320300120000', 'xdjscgjqbd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300120200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300120300', '徐州市公安局行动技术处国内情报队', '320300120000', 'xdjscgnqbd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300120300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300120400', '徐州市公安局行动技术处电信侦控队', '320300120000', 'xdjscdxzkd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300120400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300120500', '徐州市公安局行动技术处综合侦察一队', '320300120000', 'xdjsczhzcyd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300120500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300120600', '徐州市公安局行动技术处综合侦察二队', '320300120000', 'xdjsczhzced', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300120600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300120700', '江苏省徐州市公安局行动技术处受案查询队', '320300120000', 'xdjscsacyd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300120700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '3203001235', 'cscs1', '320300040000', 'cscs1', 1, 0, 0, 'sdfsdfsdf', '30032', '20141108100647', '30032', '20141108102045', '320300000000', '320300000000', '3203001235', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130000', '徐州市公安局监管支队', '320300000000', 'jgzd', 31, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130100', '徐州市公安局监所管理处办公室', '320300130000', 'jsglcbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130200', '徐州市公安局监所管理处业务指导股', '320300130000', 'jgzdywzdk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130300', '徐州市公安局监所管理处一股', '320300130000', 'jsglcyg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130400', '徐州市公安局监所管理处二股', '320300130000', 'jsglceg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130500', '徐州市公安局监所管理处三股', '320300130000', 'jsglcsg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130500', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130600', '徐州市公安局监所管理处四股', '320300130000', 'jsglcsg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130700', '徐州市看守所', '320300130000', 'xzskss', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130700', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130701', '徐州市看守所办公室', '320300130700', 'xzskssbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130701', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130702', '徐州市看守所一中队', '320300130700', 'xzskssyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130702', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130703', '徐州市看守所二中队', '320300130700', 'xzskssezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130703', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130704', '徐州市看守所三中队', '320300130700', 'xzskssszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130704', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130705', '徐州市看守所四中队', '320300130700', 'xzskssszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130705', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '3203001307a0', '徐州市看守所五中队', '320300130700', 'xxsksswzd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '3203001307a0', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '3203001307a1', '徐州市看守所六中队', '320300130700', 'xxsksslzd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '3203001307a1', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130800', '徐州市公安局收容教育所', '320300130000', 'srjys', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130801', '徐州市公安局收容教育所办公室', '320300130800', 'srjysbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130801', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130802', '徐州市公安局收容教育所一中队', '320300130800', 'srjysyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130803', '徐州市公安局收容教育所二中队', '320300130800', 'srjysezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130803', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130804', '徐州市公安局收容教育所三中队', '320300130800', 'srjysszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130805', '徐州市公安局收容教育所四中队', '320300130800', 'srjysszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130805', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300130900', '徐州市行政拘留所', '320300130000', 'xzsxzjls', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300130900', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300131000', '徐州市公安局戒毒所', '320300130000', 'qzgljds', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300131000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300131100', '徐州市公安局拘役所', '320300130000', 'jys', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300131100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300131101', '徐州市公安局拘役所办公室', '320300131100', 'jysbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300131101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300131102', '徐州市公安局拘役所狱政股', '320300131100', 'jysyzg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300131102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300131103', '徐州市公安局拘役所一中队', '320300131100', 'jysyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300131103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300131104', '徐州市公安局拘役所二中队', '320300131100', 'jysezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300131104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300131105', '徐州市公安局拘役所三中队', '320300131100', 'jysszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300131105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300150000', '徐州市公安局信访处', '320300000000', 'xfc', 42, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300150000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300150100', '徐州市公安局信访处秘书科', '320300150000', 'xfcmsk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300150100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051204', '徐州市公安局刑警支队二大队二中队', '320300051200', 'xjzdeddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051204', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051206', '徐州市公安局刑警支队二大队三中队', '320300051200', 'xjzdeddszd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051206', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051400', '徐州市公安局刑警支队三大队', '320300050000', 'xjzdsdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051402', '徐州市公安局刑警支队三大队一中队', '320300051400', 'xjzdsddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051404', '徐州市公安局刑警支队三大队二中队', '320300051400', 'xjzdsddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051404', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051600', '徐州市公安局刑警支队四大队', '320300050000', 'xjzdsdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051600', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051602', '徐州市公安局刑警支队四大队一中队', '320300051600', 'xjzdsddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051602', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051604', '徐州市公安局刑警支队四大队二中队', '320300051600', 'xjzdsddezd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051604', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051608', '江苏省徐州市公安局刑警支队四大队有组织犯罪案件侦查中队', '320300051600', 'xjzdsddyzzfzajzczd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051608', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051610', '江苏省徐州市公安局刑警支队四大队便衣行动中队', '320300051600', 'xjzdsddbyxdzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051610', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051800', '徐州市公安局刑警支队五大队', '320300050000', 'xjzdwdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051800', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051802', '徐州市公安局刑警支队五大队法化室', '320300051800', 'xjzdwddfhs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051802', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051804', '徐州市公安局刑警支队五大队文检室', '320300051800', 'xjzdwddwjs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051804', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051806', '徐州市公安局刑警支队五大队痕检室', '320300051800', 'xjzdwddhjs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051806', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051808', '徐州市公安局刑警支队五大队警犬队', '320300051800', 'xjzdwddjqd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051808', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300051810', '徐州市公安局刑警支队五大队指纹室', '320300051800', 'xjzdwddzws', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300051810', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300052000', '徐州市公安局刑警支队六大队', '320300050000', 'xjzdldd', 1, 0, 0, '省规范（大平台）20120413', null, null, '3003622', '20160615102050', null, '320300000000', '320300052000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300052002', '江苏省徐州市公安局刑警支队六大队情报资料中队', '320300052000', 'xjzdlddqbzlzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300052002', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300052200', '江苏省徐州市公安局刑警支队七大队', '320300050000', 'xjzdpdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300052200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030005a000', '刑警支队八大队', '320300050000', 'xjzdbdd', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030005a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320303620300', '云龙分局翠屏山派出所刑警中队', '320303620000', null, null, null, null, null, null, null, null, null, null, null, null, '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300060000', '徐州市公安局出入境管理处', '320300000000', 'crjglzd', 26, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300060000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300060100', '徐州市公安局出入境管理处秘书科', '320300060000', 'crjglzdmsk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300060100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300060200', '徐州市公安局出入境管理处外管科', '320300060000', 'crjglzdwgk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300060200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300060300', '江苏省徐州市公安局出入境管理处出入境管理科', '320300060000', 'crjglzdcrgjk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300060300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030006a000', '出入境管理支队口岸科', '320300060000', 'crjglzdkak', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030006a000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '32030006a100', '出入境管理支队发证室', '320300060000', 'crjglzdfzs', 1, 0, 0, '手工添加20150210', null, null, null, null, null, null, '32030006a100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070000', '徐州市公安消防支队', '320300000000', 'xzsgaxfzd', 27, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070100', '徐州市公安消防支队司令部', '320300070000', 'xzsgaxfzdslb', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300070101', '徐州市公安消防支队司令部办公室', '320300070100', 'xzsgaxfzdslbbgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300070101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172303', '徐州市公安局交通警察支队经济技术开发区大队一中队', '320300172300', null, 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172303', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172304', '徐州市公安局交通警察支队经济技术开发区大队二中队', '320300172300', null, 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172304', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172305', '徐州市公安局交通警察支队经济技术开发区大队三中队', '320300172300', null, 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172305', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172306', '徐州市公安局交通警察支队经济技术开发区大队事故中队', '320300172300', null, 1, 0, 0, '20130626', null, null, null, null, null, null, '320300172306', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172400', '徐州市公安局交通警察支队事故处理大队', '320300170000', 'jjzdsgcldd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172400', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172401', '徐州市公安局交通警察支队事故处理大队政工纪检干事', '320300172400', 'jyjzdsgclddzgjjgs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172401', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172402', '徐州市公安局交通警察支队事故处理大队综合股', '320300172400', 'jyjzdsgclddzhg', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172402', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172404', '徐州市公安局交通警察支队事故处理大队事故复议', '320300172400', 'jyjzdsgclddsgfy', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172404', '0', '1', null);
commit;
prompt 900 records committed...
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320300172406', '徐州市公安局交通警察支队事故处理大队一中队', '320300172400', 'jyjzdsgclddyzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320300172406', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302180000', '鼓楼分局法制科', '320302000000', 'glfjfzdd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302180000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302230000', '鼓楼分局通信科', '320302000000', 'glfjtxk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302230000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302310000', '鼓楼分局办公室', '320302000000', 'glfjzhk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302310000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302320000', '鼓楼分局纪委', '320302000000', 'glfjjw', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302320000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302330000', '鼓楼分局指挥中心', '320302000000', 'glfjqbzhs', 1, 0, 0, '20150126手动创建', '30032', '20150126153829', null, null, '320300000000', null, '320302330000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302350000', '鼓楼分局政工科', '320302000000', 'glfjzgk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302350000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302390000', '鼓楼分局工会', '320302000000', 'glfjgh', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302390000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510000', '鼓楼分局环城派出所', '320302000000', 'glfjhcpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510100', '鼓楼分局环城派出所社区民警中队', '320302510000', 'glfjhcpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510101', '鼓楼分局环城派出所社区民警中队堤北村责任区', '320302510100', 'glfjhcpcssqmjzddbczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510102', '鼓楼分局环城派出所社区民警中队环城责任区', '320302510100', 'glfjhcpcssqmjzdhczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510103', '鼓楼分局环城派出所社区民警中队东华责任区', '320302510100', 'glfjhcpcssqmjzddhzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510104', '鼓楼分局环城派出所社区民警中队坝子责任区', '320302510100', 'glfjhcpcssqmjzdbzzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510105', '鼓楼分局环城派出所社区民警中队闸口责任区', '320302510100', 'glfjhcpcssqmjzdzkzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510106', '鼓楼分局环城派出所社区民警中队闸东责任区', '320302510100', 'glfjhcpcssqmjzdzdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510107', '鼓楼分局环城派出所社区民警中队闸北责任区', '320302510100', 'glfjhcpcssqmjzdzbzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510108', '鼓楼分局环城派出所社区民警中队煤港责任区', '320302510100', 'glfjhcpcssqmjzdmgzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510109', '鼓楼分局环城派出所社区民警中队堤北责任区', '320302510100', 'glfjhcpcssqmjzddbzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510110', '鼓楼分局环城派出所社区民警中队二坝窝责任区', '320302510100', 'glfjhcpcssqmjzdebwzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510111', '鼓楼分局环城派出所社区民警中队堤顶责任区', '320302510100', 'glfjhcpcssqmjzdddzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510112', '鼓楼分局环城派出所社区民警中队四道街责任区', '320302510100', 'glfjhcpcssqmjzdsdjzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510200', '鼓楼分局环城派出所治安民警中队', '320302510000', 'glfjhcpcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510201', '鼓楼分局环城派出所巡逻处警中队', '320302510200', 'glfjhcpcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302510300', '鼓楼分局环城派出所刑警中队', '320302510000', 'glfjhcpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302510300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520000', '鼓楼分局牌楼派出所', '320302000000', 'glfjplpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520100', '鼓楼分局牌楼派出所社区民警中队', '320302520000', 'glfjplpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520101', '鼓楼分局牌楼派出所社区民警中队6414宿舍责任区', '320302520100', 'glfjplpcssqmjzd6414sszrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520102', '鼓楼分局牌楼派出所社区民警中队惠工小区责任区', '320302520100', 'glfjplpcssqmjzdhgxqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520103', '鼓楼分局牌楼派出所社区民警中队北窑责任区', '320302520100', 'glfjplpcssqmjzdbyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520104', '鼓楼分局牌楼派出所社区民警中队庆云小区责任区', '320302520100', 'glfjplpcssqmjzdqyxqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520105', '鼓楼分局牌楼派出所社区民警中队北站责任区', '320302520100', 'glfjplpcssqmjzdbzzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520106', '鼓楼分局牌楼派出所社区民警中队华夏花园责任区', '320302520100', 'glfjplpcssqmjzdhxhyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520107', '鼓楼分局牌楼派出所社区民警中队恒昌花园责任区', '320302520100', 'glfjplpcssqmjzdhchyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520108', '鼓楼分局牌楼派出所社区民警中队马场责任区', '320302520100', 'glfjplpcssqmjzdmczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520109', '鼓楼分局牌楼派出所社区民警中队绿健责任区', '320302520100', 'glfjplpcssqmjzdljzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520110', '鼓楼分局牌楼派出所社区民警中队鼓楼花园责任区', '320302520100', 'glfjplpcssqmjzdglhyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520111', '鼓楼分局牌楼派出所社区民警中队荆南小区责任区', '320302520100', 'glfjplpcssqmjzdjnxqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520112', '鼓楼分局牌楼派出所社区民警中队锦园责任区', '320302520100', null, 1, 0, 0, '手工添加20130114', null, null, null, null, null, null, '320302520112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520200', '鼓楼分局牌楼派出所治安民警中队', '320302520000', 'glfjplpcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520201', '鼓楼分局牌楼派出所巡逻处警中队', '320302520200', 'glfjplpcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302520300', '鼓楼分局牌楼派出所刑警中队', '320302520000', 'glfjplpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302520300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530000', '鼓楼分局王场派出所', '320302000000', 'glfjwcpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530100', '鼓楼分局王场派出所社区民警中队', '320302530000', 'glfjwcpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530101', '鼓楼分局王场派出所社区民警中队红梅责任区', '320302530100', 'glfjwcpcssqmjzdhmzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530102', '鼓楼分局王场派出所社区民警中队紫薇责任区', '320302530100', 'glfjwcpcssqmjzdzzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530103', '鼓楼分局王场派出所社区民警中队常青责任区', '320302530100', 'glfjwcpcssqmjzdcqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530104', '鼓楼分局王场派出所社区民警中队朱庄村责任区', '320302530100', 'glfjwcpcssqmjzdzzczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530105', '鼓楼分局王场派出所社区民警中队祥和责任区', '320302530100', 'glfjwcpcssqmjzdxhzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530106', '鼓楼分局王场派出所社区民警中队二环北路责任区', '320302530100', 'glfjwcpcssqmjzdehblzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530107', '鼓楼分局王场派出所社区民警中队苏电公寓责任区', '320302530100', 'glfjwcpcssqmjzdsdgyzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530108', '鼓楼分局王场派出所社区民警中队王场村责任区', '320302530100', 'glfjwcpcssqmjzdwcczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530109', '鼓楼分局王场派出所社区民警中队建西责任区', '320302530100', 'glfjwcpcssqmjzdjxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530110', '鼓楼分局王场派出所社区民警中队珠苑里一村责任区', '320302530100', 'glfjwcpcssqmjzdzylyczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530111', '鼓楼分局王场派出所社区民警中队珠苑里二村责任区', '320302530100', 'glfjwcpcssqmjzdzyleczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530111', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530112', '鼓楼分局王场派出所社区民警中队集体户责任区', '320302530100', 'glfjwcpcssqmjzdjthzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530112', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530200', '鼓楼分局王场派出所治安民警中队', '320302530000', 'glfjwcpcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530201', '鼓楼分局王场派出所巡逻处警中队', '320302530200', 'glfjwcpcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302530300', '鼓楼分局王场派出所刑警中队', '320302530000', 'glfjwcpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302530300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302540000', '鼓楼分局朱庄派出所', '320302000000', 'glfjzzpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302540000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302540100', '鼓楼分局朱庄派出所社区民警中队', '320302540000', 'glfjzzpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302540100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302540101', '鼓楼分局朱庄派出所社区民警中队八里责任区', '320302540100', 'glfjzzpcssqmjzdblzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302540101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302540102', '鼓楼分局朱庄派出所社区民警中队殷庄责任区', '320302540100', 'glfjzzpcssqmjzdyzzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302540102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302540103', '鼓楼分局朱庄派出所社区民警中队琵琶责任区', '320302540100', 'glfjzzpcssqmjzdppzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302540103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302540104', '鼓楼分局朱庄派出所社区民警中队孟家沟责任区', '320302540100', 'glfjzzpcssqmjzdmjgzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302540104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302540105', '鼓楼分局朱庄派出所社区民警中队李沃责任区', '320302540100', 'glfjzzpcssqmjzdlwzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302540105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302540106', '鼓楼分局朱庄派出所社区民警中队台子责任区', '320302540100', 'glfjzzpcssqmjzdtzzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302540106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302540107', '鼓楼分局朱庄派出所社区民警中队万寨港责任区', '320302540100', 'glfjzzpcssqmjzdwzgzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302540107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302540108', '鼓楼分局朱庄派出所社区民警中队万寨责任区', '320302540100', 'glfjzzpcssqmjzdwzzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302540108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302540200', '鼓楼分局朱庄派出所治安民警中队', '320302540000', 'glfjzzpcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302540200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302540201', '鼓楼分局朱庄派出所巡逻处警中队', '320302540200', 'glfjzzpcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302540201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302540300', '鼓楼分局朱庄派出所刑警中队', '320302540000', 'glfjzzpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302540300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550000', '鼓楼分局黄楼派出所', '320302000000', 'glfjhlpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550100', '鼓楼分局黄楼派出所社区民警中队', '320302550000', 'glfjhlpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550101', '鼓楼分局黄楼派出所社区民警中队洪学巷责任区', '320302550100', 'glfjhlpcssqmjzdhyxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550102', '鼓楼分局黄楼派出所社区民警中队电北巷责任区', '320302550100', 'glfjhlpcssqmjzddbxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550103', '鼓楼分局黄楼派出所社区民警中队三中责任区', '320302550100', 'glfjhlpcssqmjzdszzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550104', '鼓楼分局黄楼派出所社区民警中队民主责任区', '320302550100', 'glfjhlpcssqmjzdmzzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550105', '鼓楼分局黄楼派出所社区民警中队镇河责任区', '320302550100', 'glfjhlpcssqmjzdzhzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550106', '鼓楼分局黄楼派出所社区民警中队临河责任区', '320302550100', 'glfjhlpcssqmjzdlhzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550107', '鼓楼分局黄楼派出所社区民警中队镇河责任区', '320302550100', 'glfjhlpcssqmjzdzhzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550108', '鼓楼分局黄楼派出所社区民警中队大马责任区', '320302550100', 'glfjhlpcssqmjzddmzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550108', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550109', '鼓楼分局黄楼派出所社区民警中队更新责任区', '320302550100', 'glfjhlpcssqmjzdgxzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550109', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550110', '鼓楼分局黄楼派出所社区民警中队河清责任区', '320302550100', 'glfjhlpcssqmjzdhqzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550110', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550200', '鼓楼分局黄楼派出所治安民警中队', '320302550000', 'glfjhlpcszamjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550201', '鼓楼分局黄楼派出所巡逻处警中队', '320302550200', 'glfjhlpcsylcjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550201', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302550300', '鼓楼分局黄楼派出所刑警中队', '320302550000', 'glfjhlpcsxjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302550300', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560000', '鼓楼分局东站派出所', '320302000000', 'glfjdzpcs', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560100', '鼓楼分局东站派出所社区民警中队', '320302560000', 'glfjdzpcssqmjzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560100', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560101', '鼓楼分局东站派出所社区民警中队东阁责任区', '320302560100', 'glfjdzpcssqmjzddgzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560101', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560102', '鼓楼分局东站派出所社区民警中队河东责任区', '320302560100', 'glfjdzpcssqmjzdhdzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560102', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560103', '鼓楼分局东站派出所社区民警中队地藏责任区', '320302560100', 'glfjdzpcssqmjzddczrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560103', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560104', '鼓楼分局东站派出所社区民警中队大坝责任区', '320302560100', 'glfjdzpcssqmjzddbzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560104', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560105', '鼓楼分局东站派出所社区民警中队陇海责任区', '320302560100', 'glfjdzpcssqmjzdlhzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560105', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560106', '鼓楼分局东站派出所社区民警中队永安责任区', '320302560100', 'glfjdzpcssqmjzdyazrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560106', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302560107', '鼓楼分局东站派出所社区民警中队顺河责任区', '320302560100', 'glfjdzpcssqmjzdshzrq', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302560107', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302070200', '徐州市公安消防支队鼓楼区大队大马路中队', '320302070000', 'xzsgaxfzdglqdddmlzd', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302070200', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302090000', '鼓楼分局经济文化保卫科', '320302000000', 'glfjjjwhbwk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302090000', '0', '1', null);
insert into SYS_DIC_BUSINESS (DICNO, DICNAME, DICCODE, DICITEM, PID, DICSPY, ORDERID, ISVALID, ISMODIFY, MEMO, CREATEUSER, CREATETIME, MODIFYUSER, MODIFYTIME, CREATEORG, MODIFYORG, OLDCODE, DEL_FLAG, YN_ENABLE, ORG_ID)
values ('2', '单位代码', '320302150000', '鼓楼分局信访科', '320302000000', 'glfjxfk', 1, 0, 0, '省规范（大平台）20120413', null, null, null, null, null, null, '320302150000', '0', '1', null);
commit;
prompt 999 records loaded
prompt Loading SYS_DIC_CFG...
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('1', '0', '否', '-1', null, '判断', '2', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('1', '1', '是', '-1', null, '判断', '1', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('2', '1', '男', '-1', null, '性别', '1', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('2', '2', '女', '-1', null, '性别', '2', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('2', '3', '不详', '-1', null, '性别', '3', null, null, null, null, null, null, null, '0', '0', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('100', '1', '普通用户', '-1', null, '用户类型', '1', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('100', '2', '系统管理员', '-1', null, '用户类型', '2', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('100', '3', '超级管理员', '-1', null, '用户类型', '3', null, null, null, null, null, null, null, '0', '1', null, null);
insert into SYS_DIC_CFG (DIC_NO, DIC_ID, DIC_ID_NAME, DIC_PID, DIC_SPELL, DIC_NO_NAME, SORT_ID, OWN_DESC, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('100', '4', '监管管理员', '-1', null, '用户类型', '4', null, null, null, null, null, null, null, '0', '1', null, null);
commit;
prompt 9 records loaded
prompt Loading SYS_LOG...
prompt Table is empty
prompt Loading SYS_MENU...
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802241710563860', '系统设置', '0', null, '1', null, '1', '0', '2', 'layui-icon-shezhi', '1', '20180224171106', 'ec0729ee1a084900be9aed9ad1da9223', '20180226143556', '320305000000', '320300000000', '0', '1', null, null);
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802241711129609', '用户管理', '201802241710563860', '/sysUser/toSysUserList', '1', null, '1', '1', '1', null, '1', '20180224171158', 'ec0729ee1a084900be9aed9ad1da9223', '20180226143751', '320305000000', '320300000000', '0', '1', null, null);
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802241712082875', '角色管理', '201802241710563860', '/sysRole/toSysRoleList', '1', null, '1', '1', '2', null, '1', '20180224171229', null, null, '320305000000', null, '0', '1', null, null);
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802241712316776', '菜单管理', '201802241710563860', '/sysMenu/toSysMenuList', '1', null, '1', '1', '3', null, '1', '20180224171248', '1', '20180224171614', '320305000000', '320305000000', '0', '1', null, null);
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802241712544607', '机构管理', '201802241710563860', '/sysOrg/toSysOrgList', '1', null, '1', '1', '4', null, '1', '20180224171329', null, null, '320305000000', null, '0', '1', null, null);
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802241741218759', '案件管理', '0', null, '1', null, '1', '0', '1', 'layui-icon-read', '1', '20180224174137', 'ec0729ee1a084900be9aed9ad1da9223', '20180226143857', '320305000000', '320300000000', '0', '1', null, null);
insert into SYS_MENU (ID, MENU_NAME, PID, MENU_URL, MENU_TYPE, MENU_FUN, DEV_MODE, MENU_LEV, SORT_ID, ICON, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, GROUP_ID, MEMO)
values ('201802251314558709', '案件信息', '201802241741218759', '/sysUser/toSysUserList', '1', null, '1', '1', '1', null, '1', '20180225131527', 'ec0729ee1a084900be9aed9ad1da9223', '20180226143250', '320305000000', '320300000000', '0', '1', null, null);
commit;
prompt 7 records loaded
prompt Loading SYS_ROLE...
insert into SYS_ROLE (ID, NAME, YN_MODIFY, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, ORG_ID, MEMO)
values ('95e608035511439ea72645d3f2b2aa22', '普通用户', null, '1', '20180224172210', null, null, '320305000000', null, '0', '1', null, null);
insert into SYS_ROLE (ID, NAME, YN_MODIFY, CREATE_USER, CREATE_TIME, UPDATE_USER, UPDATE_TIME, CREATAE_DEPT, UPDATE_DEPT, DEL_FLAG, YN_ENABLE, ORG_ID, MEMO)
values ('2071a824a8d34cf787e195643ff14487', '系统管理员', null, '1', '20180224172146', null, null, '320305000000', null, '0', '1', null, '系统管理员');
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
values ('ec0729ee1a084900be9aed9ad1da9223', 'lt', '梁涛', '1', '1', null, null, null, '2018-02-03', '1', null, '320300000000', '320300000000', '320300', '1', null, null, '2018-02-01', '1', null, null, null, '1', '20180225105221', 'ec0729ee1a084900be9aed9ad1da9223', '20180227155839', '320305000000', '320300000000', '0', '1', null, null);
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
