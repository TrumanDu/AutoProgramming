package com.aibibang.web.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aibibang.common.base.BaseController;
import com.aibibang.common.util.ValidateUtils;
import com.aibibang.web.system.entity.SysMenu;
import com.aibibang.web.system.service.SysMenuService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 菜单管理
 * 
 * @author King
 *
 */
@Controller
@RequestMapping("/menu")
public class SysMenuController extends BaseController {

	private Logger logger = Logger.getLogger(SysMenuController.class);
	
	@Resource
	private SysMenuService sysMenuService;
	
	
	/**
	 * 初始化查询页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/init")
	public String init(HttpServletRequest request){
		
		return "system/menu/menuSearch";
	}
	
	/**
	 * 查询顶级菜单
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public String list(HttpServletRequest request){
		
		try {
			
			request.setAttribute("menuList", sysMenuService.findForTreeTable(0L));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return "system/menu/menuList";
	}
	
	/**
	 * 查询下级菜单
	 * @param parentId
	 * @return
	 */
	@RequestMapping("/treeTable")
	@ResponseBody
	public String treeTable(Long parentId){
		JSONArray json = new JSONArray();
		
		try {
			
			json.addAll(sysMenuService.findForTreeTable(parentId));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
	
	/**
	 * 维护页面跳转
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/menu")
	public String menu(Long id,HttpServletRequest request){
		
		try {
			
			if(ValidateUtils.isNotEmpty(id)){
				request.setAttribute("menu", sysMenuService.getById(id));
			}			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return "system/menu/menu";
	}
	
	/**
	 * 获取菜单树状结构
	 * @return
	 */
	@RequestMapping("/getMenuForTree")
	@ResponseBody
	public String getMenuForTree(Long currentId){
		JSONArray json = new JSONArray();
		
		List<SysMenu> menuList = sysMenuService.find(new SysMenu());
		
		if(menuList != null && menuList.size() > 0){
			for(SysMenu menu : menuList){
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", menu.getId());
				map.put("name", menu.getMenuName());
				map.put("pId", menu.getParentId());
				json.add(map);
			}
		}
		
		return json.toString();
	}
	
	/**
	 * 保存数据
	 * @param menu
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String save(SysMenu menu){
		JSONObject json = new JSONObject();
		
		try {
			
			if(ValidateUtils.isEmpty(menu.getParentId())){
				menu.setParentId(0L);
			}
			
			// 修改
			if(ValidateUtils.isNotEmpty(menu.getId())){
				sysMenuService.update(menu);
			}
			// 新增
			else{
				sysMenuService.add(menu);
			}
			json.put("result", "save_success");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			json.put("result", "save_fail");
		}
		
		return json.toString();
	}
	
	/**
	 * 删除数据
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(Long id){
		JSONObject json = new JSONObject();
		
		try {
			
			sysMenuService.delete(id);
			json.put("result", "delete_success");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			json.put("result", "delete_fail");
		}
		
		return json.toString();
	}
}
