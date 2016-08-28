package com.aibibang.common.util;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.aibibang.web.system.entity.SysMenu;

public class MenuUtils {

	
	public static String getMenu(List<SysMenu> menuList,List<Long> userMenus){
		
		StringBuilder sb = new StringBuilder();
		
		if(menuList != null && menuList.size() > 0){
			
			for(SysMenu menu : menuList){
				
				if(userMenus.contains(menu.getId())){
					int childNum = menu.getChildren().size();
					
					sb.append("<li>\n")
					.append("<a href=\"javascript:;\" ");
					if(StringUtils.isNotEmpty(menu.getMenuUrl()) && childNum == 0){
						sb.append("onclick=\"menu(this,'"+menu.getMenuUrl()+"')\"");
					}
					sb.append(">\n")
					.append("<i class=\""+menu.getMenuIcon()+"\"></i>\n")
					.append("<span class=\"title\">"+menu.getMenuName()+"</span>\n");
					if(childNum > 0){
						sb.append("<span class=\"arrow\"></span>\n");
					}
					sb.append("</a>\n");
					if(childNum > 0){
						sb.append(getChildren(menu.getChildren(),userMenus));
					}
					sb.append("</li>\n");
				}
			}
		}
		
		return sb.toString();
	}
	
	public static String getChildren(List<SysMenu> menuList,List<Long> userMenus){
		StringBuilder sb = new StringBuilder();
		
		sb.append("<ul class=\"sub-menu\">\n");
		
		for(SysMenu menu : menuList){
			
			if(userMenus.contains(menu.getId())){
				int childNum = menu.getChildren().size();
				
				sb.append("<li>\n")
				.append("<a href=\"javascript:;\" ");
				if(StringUtils.isNotEmpty(menu.getMenuUrl()) && childNum == 0){
					sb.append("onclick=\"menu(this,'"+menu.getMenuUrl()+"')\"");
				}
				sb.append(">\n")
				.append("<i class=\""+menu.getMenuIcon()+"\"></i>\n")
				.append("<span class=\"title\">"+menu.getMenuName()+"</span>\n");
				if(childNum > 0){
					sb.append("<span class=\"arrow\"></span>\n");
				}
				sb.append("</a>\n");
				if(childNum > 0){
					sb.append(getChildren(menu.getChildren(),userMenus));
				}
				sb.append("</li>\n");
			}
		}
		
		sb.append("</ul>");
		
		return sb.toString();
	}
}
