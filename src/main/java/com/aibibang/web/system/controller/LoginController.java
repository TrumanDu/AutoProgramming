package com.aibibang.web.system.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aibibang.common.base.BaseController;
import com.aibibang.common.constant.SessionAttr;
import com.aibibang.common.util.MenuUtils;
import com.aibibang.web.system.entity.SysMenu;
import com.aibibang.web.system.entity.SysUser;
import com.aibibang.web.system.service.SysMenuService;
import com.aibibang.web.system.service.SysUserService;

import net.sf.json.JSONObject;

@Controller 
@RequestMapping("/login")
public class LoginController extends BaseController {

	private Logger logger = Logger.getLogger(LoginController.class);
	
	@Resource
	private SysUserService sysUserService;
	@Resource
	private SysMenuService sysMenuService;
	
	/**
	 * 验证用户
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/checkUser")
	@ResponseBody
	public String checkUser(SysUser user,HttpServletRequest request){
		JSONObject json = new JSONObject();
		
		try {
			SysUser u = sysUserService.findByUsername(user);
			if(u != null){
				if(!u.getPassword().equals(user.getPassword())){
					return json.toString();
				}
				HttpSession session = request.getSession();
				session.setAttribute(SessionAttr.USER_LOGIN.getValue(), u);
				List<Long> userMenus = sysUserService.findMenuIdByUserId(u.getId());
				List<SysMenu> menuList = sysMenuService.getByParentId(0L);
				session.setAttribute(SessionAttr.USER_MENUS.getValue(), MenuUtils.getMenu(menuList, userMenus));
				
				logger.info("login success");
				json.put("result", "login_success");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
	
	/**
	 * 登出
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		session.removeAttribute(SessionAttr.USER_LOGIN.getValue());
		session.removeAttribute(SessionAttr.USER_ROLES.getValue());
		session.removeAttribute(SessionAttr.USER_MENUS.getValue());
		
		return "login/login";
	}
	
}
