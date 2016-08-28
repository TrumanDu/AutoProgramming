package com.aibibang.web.generator.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aibibang.common.base.BaseController;
import com.aibibang.common.persistence.Page;
import com.aibibang.common.util.ValidateUtils;
import com.aibibang.web.generator.entity.CgDataSource;
import com.aibibang.web.generator.service.CgDataSourceService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/dataSource")
public class CgDataSourceController extends BaseController {

	private static Logger logger = Logger.getLogger(CgDataSourceController.class);
	
	@Resource
	private CgDataSourceService cgDataSourceService;
	
	@RequestMapping("/init")
	public String init(HttpServletRequest request){
		
		return "generator/datasource/dataSourceSearch";
	}
	
	@RequestMapping("/list")
	public String list(CgDataSource dataSource,Page<CgDataSource> page,HttpServletRequest request){
		
		request.setAttribute("page", cgDataSourceService.findByPage(dataSource, page));
		
		return "generator/datasource/dataSourceList";
	}
	
	@RequestMapping("/dataSource")
	public String database(Long id,HttpServletRequest request){
		
		if(ValidateUtils.isNotEmpty(id)){
			
			CgDataSource dataSource = cgDataSourceService.getById(id);
			request.setAttribute("dataSource", dataSource);
		}
		
		return "generator/datasource/dataSource";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public String save(CgDataSource dataSource){
		JSONObject json = new JSONObject();
		
		try {
			
			if(ValidateUtils.isNotEmpty(dataSource.getId())){
				cgDataSourceService.update(dataSource);
			}
			else{
				cgDataSourceService.add(dataSource);
			}
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
			
			if(ValidateUtils.isNotEmpty(id)){
				cgDataSourceService.delete(id);
				json.put("result", "delete_success");
			}
		} catch (Exception e) {
			json.put("result", "delete_fail");
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
}
