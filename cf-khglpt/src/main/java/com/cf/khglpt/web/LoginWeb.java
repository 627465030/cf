package com.cf.khglpt.web;

import com.cf.core.base.mybatis.cf_base.*;
import com.cf.core.base.service.*;
import com.cf.core.base.web.BaseWeb;
import com.cf.core.cache.CacheUtil;
import com.cf.core.common.constant.GlobleConstant;
import com.cf.core.common.session.SessionInfo;
import com.cf.core.util.MenuUtil;
import com.cf.core.util.ToolUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Project : cf
 * @Package Name : com.cf.hczz.web
 * @Description : TODO
 * @Author : chenfeng
 * @Creation Date : 2018年01月22日 9:06
 * @ModificationHistory Who When What
 * _________ ________________ ____________________________________________
 */

@Controller
public class LoginWeb extends BaseWeb {

    private static Logger log = LoggerFactory.getLogger(LoginWeb.class);

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysDicBusinessService sysDicBusinessService;

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysMenuService sysMenuService;

    //@Autowired
    //private SysRoleService sysRoleService;

    //@Autowired
    //private SysMenuService sysMenuService;

    /**
     * method_name:toLogin
     * param: 
     * describe: 跳转到通用登录页
     * create_user: chenfeng
     * create_date: 2018/2/26 
     * create_time: 16:43
     **/
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    /**
     * method_name: toIndex
     * param:
     * describe: 跳转到传统后台
     * create_user: chenfeng
     * create_date: 2018/2/26 
     * create_time: 16:43
     **/
    @RequestMapping("/toIndex")
    public String toIndex(){
        return "index";
    }

    /**
     * method_name: login
     * param: [session, sysUser]
     * describe: 用户登录
     * create_user: chenfeng
     * create_date: 2018/2/20
     * create_time: 14:33
     **/
    @RequestMapping("login")
    @ResponseBody
    public Map<String,Object> login(HttpSession session, SysUser sysUser){

        Map<String,Object> dtoMap = new HashMap<>();
        SessionInfo sessionInfo = new SessionInfo();
        try {
            //验证用户信息 true 验证通过  false 验证失败
            if(!validateLogin(sysUser, dtoMap)){
                return responeDto(ERROR_CODE,dtoMap.get(ERROR_CODE).toString());
            }

            //用户授权
            authorizationLogin((SysUser) dtoMap.get(SUCCESS_CODE),sessionInfo);
            //授权验证
            // 用户没有角色
            List<SysRole> sysRoleList = sessionInfo.getRoleList();
            if(ToolUtil.isEmpty(sysRoleList) || 0 == sysRoleList.size()){
                return responeDto(ERROR_CODE,"登录用户没有角色");
            }
            // 角色没有功能
            List<SysMenu> sysMenuList = sessionInfo.getMenuList();
            if(ToolUtil.isEmpty(sysMenuList) || 0 == sysMenuList.size()){
                return responeDto(ERROR_CODE,"登录用户没有功能");
            }
        } catch (Exception e) {
            //e.printStackTrace();
            log.error(e.getMessage());
            return responeDto(ERROR_CODE,ERROR_MSG);

        }
        //加载SESSIONINFO
        session.setAttribute(GlobleConstant.SESSION_INFO,sessionInfo);
        //重置SESSION过期时间
        session.setMaxInactiveInterval(Integer.parseInt(GlobleConstant.SESSION_INACTIVETIME));
        return responeDto(SUCCESS_CODE,SUCCESS_MSG);
    }

    /**
     * method_name: loginOut
     * param: 
     * describe: 登出
     * create_user: chenfeng
     * create_date: 2018/2/26 
     * create_time: 16:44
     **/
    @RequestMapping("/")
    public String loginOut(HttpSession session, HttpServletRequest request,HttpServletResponse response){
        session.setMaxInactiveInterval(0);
        session.setAttribute(GlobleConstant.SESSION_INFO,null);
        response.setHeader("REDIRECT", "REDIRECT");
        return "login";
    }


    /**
     * method_name: toLoginDesktop
     * param: 
     * describe: 跳转到桌面后台
     * create_user: chenfeng
     * create_date: 2018/2/26 
     * create_time: 16:45
     **/
    @RequestMapping("/toLoginDesktop")
    public String toLoginDesktop(){

        return "theme/desktop/index";
    }

    //桌面左右拉伸DEMO1
    @RequestMapping("/toDemo1")
    public String toDemo1(){

        return "theme/desktop/demo1";
    }

    //桌面左右收缩DEME2
    @RequestMapping("/toDemo2")
    public String toDemo2(){

        return "theme/desktop/demo2";
    }



    /**
     * method_name: validateLogin
     * param: [sysUser, dtoMap]
     * describe: 用户登录信息验证
     * create_user: chenfeng
     * create_date: 2018/2/20
     * create_time: 15:04
     **/
    private boolean validateLogin(SysUser sysUser,Map<String,Object> dtoMap){

        //判断用户密码是否为空
        String loginName = sysUser.getLoginName();
        String password = sysUser.getPassword();
        if(ToolUtil.isEmpty(loginName) || ToolUtil.isEmpty(password)){
            dtoMap.put(ERROR_CODE,"用户密码不能为空");
            return false;
        }
        //获取用户信息  sysUser  参数可以根据id loginName idCard 查询 ，查询时请将其他参数改为空或NULL
        SysUser user = sysUserService.selectSysUser(sysUser);
        //判断用户是否存在
        if(ToolUtil.isEmpty(user)){
            dtoMap.put(ERROR_CODE,"用户不存在");
            return false;
        }
        //判断用户密码是否正确
        if(!password.equals(user.getPassword())){
            dtoMap.put(ERROR_CODE,"密码错误");
            return false;
        }
        //TODO 其他验证，根据需要处理


        dtoMap.put(SUCCESS_CODE,user);
        return true;
    }

    /**
     * method_name: authorizationLogin
     * param: [user, sessionInfo]
     * describe: 用户授权
     * create_user: chenfeng
     * create_date: 2018/2/20
     * create_time: 15:09
     **/
    private void authorizationLogin(SysUser user, SessionInfo sessionInfo){

        //license 系统授权验证

        //用户拥有的角色
        List<SysRole> sysRoleList = sysRoleService.selectUserRoleListByUserId(user);
        sessionInfo.setRoleList(sysRoleList);
        sessionInfo.setRoleIdStr(sysRoleListToString(sysRoleList));

        //角色具备的功能 菜单
        List<SysMenu> sysMenuList = sysMenuService.selectRoleMenuListByRoleId(sysRoleList);
        sessionInfo.setMenuList(sysMenuList);
        sessionInfo.setMenuIdStr(sysMenuListToString(sysMenuList));
        sessionInfo.setMenuMapTree(MenuUtil.leftMenuMap(sysMenuList));
        //菜单转JSON，格式
        sessionInfo.setMenuJson(MenuUtil.leftMenuJson(sysMenuList));


        //监管单位授权 公安特有，用于过滤数据权限，XML中使用ORG_ID like '${orgId}%'
        sessionInfo.setRegulatoryOrg(getRegulatoryOrg(user));

        //单位名称转换
        sessionInfo.setUserOrgName(CacheUtil.getSysDicBusinessByDicNoAndDicCode("2",user.getOrgId()));
        sessionInfo.setUserRegulatoryOrgName(CacheUtil.getSysDicBusinessByDicNoAndDicCode("2",user.getRegulatoryOrg()));

        //机构树加载
        SysDicBusiness dicBiz = new SysDicBusiness();
        dicBiz.setDiccode(sessionInfo.getRegulatoryOrg());
        List<SysDicBusiness> sysDicBusinessesList = sysDicBusinessService.selectSysDicBusinessOrgList(dicBiz);
        sessionInfo.setOrgJsonTree(ToolUtil.listToJson(sysDicBusinessesList));
        //组织权限，企业用，预留


        //SESSIONINFO 信息加载 系统中所有数据都存放在SESSIONINFO中
        //载入用户对象
        sessionInfo.setSysUser(user);
        //载入缓存信息
        sessionInfo.setAppTitleName(GlobleConstant.APP_TITLE_NAME);
        sessionInfo.setSysDicCfgMap(CacheUtil.getSysDictionary(GlobleConstant.EH_CACHE_DICCFG));
        sessionInfo.setSysDicCfgJson(CacheUtil.getSysDictionary(GlobleConstant.EH_CACHE_DICCFG_JSON));
        sessionInfo.setSysDicCfgJsonTree(CacheUtil.getSysDictionary(GlobleConstant.EH_CACHE_DICCFG_JSON_TREE,true));
        sessionInfo.setSysDicBusinessMap(CacheUtil.getSysDictionary(GlobleConstant.EH_CACHE_GABIZDIC));
        sessionInfo.setSysDicBusinessJson(CacheUtil.getSysDictionary(GlobleConstant.EH_CACHE_GABIZDIC_JSON));
        sessionInfo.setSysDicBusinessJsonTree(CacheUtil.getSysDictionary(GlobleConstant.EH_CACHE_GABIZDIC_JSON_TREE,true));

    }
}
