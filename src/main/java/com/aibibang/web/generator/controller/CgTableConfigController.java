package com.aibibang.web.generator.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aibibang.common.base.BaseController;
import com.aibibang.common.persistence.Page;
import com.aibibang.web.generator.entity.CgDataSource;
import com.aibibang.web.generator.entity.CgTableConfig;
import com.aibibang.web.generator.service.CgDataSourceService;
import com.aibibang.web.generator.service.CgTableConfigService;
import com.aibibang.web.generator.util.ReadTableUtils;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/tableConfig")
public class CgTableConfigController extends BaseController {

	private static Logger logger = Logger.getLogger(CgTableConfigController.class);
	
	@Resource
	private CgDataSourceService cgDataSourceService;
	@Resource
	private CgTableConfigService cgTableConfigService;
	
	@RequestMapping("/init")
	public String init(){
		
		return "generator/table/tableConfigSearch";
	}
	
	@RequestMapping("/list")
	public String list(CgTableConfig tableConfig,Page<CgTableConfig> page,HttpServletRequest request){
		
		request.setAttribute("page", cgTableConfigService.findByPage(tableConfig, page));
		
		return "generator/table/tableConfigList";
	}
	
	@RequestMapping("/tableInit")
	public String tableInit(HttpServletRequest request){
	
		try {
			
			List<CgDataSource> dataSourceList = cgDataSourceService.findBySearch(new CgDataSource());
			request.setAttribute("dataSourceList", dataSourceList);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return "generator/table/buildConfig";
	}
	
	@RequestMapping("/getTables")
	@ResponseBody
	public String getTables(Long dataSourceId){
		JSONObject json = new JSONObject();
		
		try {
			
			CgDataSource dataSource = cgDataSourceService.getById(dataSourceId);
			List<String> tables = new ReadTableUtils().readAllTableNames(dataSource);
			json.put("result", tables);
		} catch (Exception e) {
			json.put("result", "error");
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
	
	@RequestMapping("/tableConfig")
	public String tableConfig(Long id,HttpServletRequest request){
		
		try {
			
			CgTableConfig tableConfig = cgTableConfigService.getById(id);
			request.setAttribute("tableConfig", tableConfig);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return "generator/table/tableConfig";
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public String update(CgTableConfig tableConfig){
		JSONObject json = new JSONObject();
		
		try {
			
			tableConfig.setUpdateUser(getCurrentUser().getId());
			tableConfig.setUpdateDate(new Date());
			cgTableConfigService.update(tableConfig);
			json.put("result", "save_success");
		} catch (Exception e) {
			json.put("result", "save_fail");
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(Long id){
		JSONObject json = new JSONObject();
		
		try {
			
			cgTableConfigService.delete(id);
			json.put("result", "delete_success");
		} catch (Exception e) {
			json.put("result", "delete_fail");
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
}
