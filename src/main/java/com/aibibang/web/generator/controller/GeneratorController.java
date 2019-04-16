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
import com.aibibang.web.generator.entity.BuildCodeConfig;
import com.aibibang.web.generator.entity.CgColumnConfig;
import com.aibibang.web.generator.entity.CgDataSource;
import com.aibibang.web.generator.entity.CgTableConfig;
import com.aibibang.web.generator.service.CgDataSourceService;
import com.aibibang.web.generator.service.CgTableConfigService;
import com.aibibang.web.generator.util.CodeGenerateUtils;
import com.aibibang.web.generator.util.FieldUtils;
import com.aibibang.web.generator.util.ReadTableUtils;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/generator")
public class GeneratorController extends BaseController {

	private static Logger logger = Logger.getLogger(GeneratorController.class);
	
	@Resource
	private CgDataSourceService cgDataSourceService;
	@Resource
	private CgTableConfigService cgTableConfigService;
	
	@RequestMapping("/buildConfig")
	@ResponseBody
	public String buildConfig(Long dataSourceId,String tableName){
		JSONObject json = new JSONObject();
		
		try {
			
			CgTableConfig table = new CgTableConfig();
			table.setTableName(tableName);
			table.setClassName(FieldUtils.formatFieldCapital(tableName));
			table.setIsCheckbox("N");
			table.setIsPage("Y");
			table.setIsTree("N");
			table.setCreateUser(getCurrentUser().getId());
			table.setCreateDate(new Date());
			
			CgDataSource dataSource = cgDataSourceService.getById(dataSourceId);
			List<CgColumnConfig> columns =  new ReadTableUtils().readTableColumn(dataSource, tableName);
			table.setColumns(columns);
			cgTableConfigService.add(table);
			json.put("result", "build_config_success");
		} catch (Exception e) {
			json.put("result", "error");
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
	
	@RequestMapping("/goBuild")
	public String goBuild(Long id,HttpServletRequest request){
		
		try {
			
			CgTableConfig tableConfig = cgTableConfigService.getById(id);
			request.setAttribute("tableConfig", tableConfig);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return "generator/table/buildCode";
	}
	
	
	@RequestMapping("/buildCode")
	@ResponseBody
	public String buildCode(BuildCodeConfig buildCodeConfig){
		JSONObject json = new JSONObject();
		
		try {
			
			CgTableConfig tableConfig = cgTableConfigService.getById(buildCodeConfig.getTableId());
			buildCodeConfig.setTableConfig(tableConfig);
			//buildCodeConfig.setPageModel("default");
			//buildCodeConfig.setPageModel("springboot");
			// 生成代码
			CodeGenerateUtils generate = new CodeGenerateUtils(buildCodeConfig);
			generate.generateFile();
			
			json.put("result", "build_code_success");
		} catch (Exception e) {
			json.put("result", "error");
			logger.error(e.getMessage(), e);
		}
		
		return json.toString();
	}
}
