package com.aibibang.web.system.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aibibang.common.base.BaseController;
import com.aibibang.common.constant.SessionAttr;

@Controller
@RequestMapping("/index")
public class IndexController extends BaseController {

	private Logger logger = Logger.getLogger(IndexController.class);
	
	@RequestMapping("")
	public String login(String theme,HttpServletRequest request){
		
		String userMenu = (String)request.getSession().getAttribute(SessionAttr.USER_MENUS.getValue());
		request.setAttribute("menus", userMenu);
		
		logger.info("login success");
		
		if(StringUtils.isNotEmpty(theme)){
			return "main/theme"+theme;
		}
		
		return "main/theme";
	}
	
	
	@RequestMapping("/icon")
	public String icon(HttpServletRequest request){
		
		return "system/icon/icon";
	}
	
	@RequestMapping("/home")
	public String home(HttpServletRequest request){
		
		return "system/home/home";
	}
}
