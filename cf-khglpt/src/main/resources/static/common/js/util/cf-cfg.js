/**
 * describe: 平台前端配置
 * create_user: chenfeng
 * create_date: 2018/2/9 
 * create_time: 11:13
 **/

_appTitleName = "";
/************权限控制配置*************/
var _button_method = 'disabled'; //按钮控制方法 'disabled'禁用 'hide'隐藏 'remove' 删除  默认禁用 'normal' 正常使用
/************访问路径配置 一般不需要使用*************/
var basePath = ''; //客户端返回项目路径 不支持带项目名 如:http://127.0.0.1:8080
var _basePath = ''; //服务器返回项目访问路径 支持带项目名 如:http://127.0.0.1:8080 //127.0.0.1:8080/hczz

/************增删改查参数标识，后台变量对应 前缀SYS_ADD*************/
var sys_operation_flag="cfOptFlag";
var sys_add = 'add';
var sys_del = 'del';
var sys_mod = 'mod';
var sys_det = 'det';

/************前端映射服务器用户对象*************/
var _userInfo = {};

/************缓存字典*************/
var _cacheInfo={};

/************全局分页*************/
var sys_page_size=10;




