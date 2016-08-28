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
import com.aibibang.web.system.entity.SysOrg;
import com.aibibang.web.system.service.SysOrgService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/org")
public class SysOrgController extends BaseController {

	private Logger logger = Logger.getLogger(SysOrgController.class);
	
	@Resource
	private SysOrgService sysOrgService;
	
	/**
	 * 查询页面初始化
	 * @param request
	 * @return
	 */
	@RequestMapping("/init")
	public String init(HttpServletRequest request){
		
		return "system/org/orgSearch";
	}
	
	/**
	 * 查询顶级菜单
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public String list(HttpServletRequest request){
		
		try {
			
			request.setAttribute("orgList", sysOrgService.findForTreeTable(0L));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return "system/org/orgList";
	}
	
	/**
	 * 查询下级组织
	 * @param parentId
	 * @return
	 */
	@RequestMapping("/treeTable")
	@ResponseBody
	public String treeTable(Long parentId){
		JSONArray json = new JSONArray();
		
		try {
			json.addAll(sysOrgService.findForTreeTable(parentId));
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
	@RequestMapping("/org")
	public String org(Long id,HttpServletRequest request){
		
		try {
			
			if(ValidateUtils.isNotEmpty(id)){
				request.setAttribute("org", sysOrgService.getById(id));
			}			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return "system/org/org";
	}
	
	/**
	 * 获取组织树状结构
	 * @return
	 */
	@RequestMapping("/getOrgForTree")
	@ResponseBody
	public String getOrgForTree(Long currentId){
		JSONArray json = new JSONArray();
		
		List<SysOrg> orgList = sysOrgService.find(new SysOrg());
		
		if(orgList != null && orgList.size() > 0){
			for(SysOrg org : orgList){
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", org.getId());
				map.put("name", org.getOrgName());
				map.put("pId", org.getParentId());
				json.add(map);
			}
		}
		
		return json.toString();
	}
	
	/**
	 * 保存数据
	 * @param org
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String save(SysOrg org){
		JSONObject json = new JSONObject();
		
		try {
			
			if(ValidateUtils.isEmpty(org.getParentId())){
				org.setParentId(0L);
			}
			
			// 修改
			if(ValidateUtils.isNotEmpty(org.getId())){
				sysOrgService.update(org);
			}
			// 新增
			else{
				sysOrgService.add(org);
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
			
			sysOrgService.delete(id);
			json.put("result", "delete_success");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			json.put("result", "delete_fail");
		}
		
		return json.toString();
	}
}
