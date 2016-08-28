package com.aibibang.web.generator.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;

import com.aibibang.web.generator.entity.BuildCodeConfig;
import com.aibibang.web.generator.entity.CgColumnConfig;

import freemarker.template.Template;
import freemarker.template.TemplateException;

public class CodeGenerateUtils extends CodePathUtils {

	private BuildCodeConfig config;
	private Map<String,Object> data;
	
	public CodeGenerateUtils(BuildCodeConfig config) {
		
		this.config = config;
		this.data = initData(config);
	}

	public void generateFile() throws Exception {
		
		if("angularjs".equals(this.config.getPageModel())){
	    	
	    	if(this.config.isPageFlag()){
	    		invoke("angularjs_jspTemplate.ftl", "jsp");
	        	invoke("angularjs_jspListTemplate.ftl", "jspList");
	        }
	    	if(this.config.isEntityFlag()){
	    		invoke("angularjs_entityTemplate.ftl", "entity");
	    	}
	    	if(this.config.isDaoFlag()){
	    		invoke("angularjs_daoTemplate.ftl", "dao");
		        invoke("angularjs_sqlxmlTemplate.ftl", "sqlxml");
	    	}
	        if(this.config.isServiceFlag()){
	        	invoke("angularjs_serviceImplTemplate.ftl", "serviceImpl");
	        	invoke("angularjs_serviceImplTemplate.ftl", "serviceImpl");
	        }
	        if (this.config.isControllerFlag()) {
	        	invoke("angularjs_controllerTemplate.ftl", "controller");
	        }
	    }	
	    else{
	    	
	    	if(this.config.isPageFlag()){
	    		invoke("jspTemplate.ftl", "jsp");
	        	invoke("jspListTemplate.ftl", "jspList");
	        	invoke("jspSearchTemplate.ftl", "jspSearch");
	        }
	    	if(this.config.isEntityFlag()){
	    		invoke("entityTemplate.ftl", "entity");
	    	}
	    	if(this.config.isDaoFlag()){
	    		invoke("daoTemplate.ftl", "dao");
		        invoke("sqlxmlTemplate.ftl", "sqlxml");
	    	}
	        if(this.config.isServiceFlag()){
	        	invoke("serviceTemplate.ftl", "service");
	        	invoke("serviceImplTemplate.ftl", "serviceImpl");
	        }
	        if (this.config.isControllerFlag()) {
	        	invoke("controllerTemplate.ftl", "controller");
	        }
	    }
		
	}
	
	public void invoke(String templateFileName,String type) throws TemplateException, IOException {
		String filePath = null;
		if("project".equals(type)){
			filePath = getCodePathProjectStyle(this.config, type);
		}
		else{
			filePath = getCodePathServiceStyle(this.config, type);
		}
		String fileDir = StringUtils.substringBeforeLast(filePath, "/");
		FileUtils.forceMkdir(new File(fileDir + "/"));
		
		Template template = getConfiguration(this.config.getPageModel()).getTemplate(templateFileName);
		Writer out = new OutputStreamWriter(new FileOutputStream(filePath), "utf-8");
		template.process(data, out);
		out.close();
	}
	
	private Map<String, Object> initData(BuildCodeConfig buildCodeConfig){
		Map<String,Object> data = new HashMap<String,Object>();
		
		data.put("sourceBasePackage", buildCodeConfig.getSourceBasePackage());
		data.put("webBasePackage", buildCodeConfig.getWebBasePackage());
		data.put("entityPackage", buildCodeConfig.getEntityPackage());
		data.put("packageStyle", buildCodeConfig.getPackageStyle());
		
		data.put("tableName", buildCodeConfig.getTableConfig().getTableName());
		data.put("className", buildCodeConfig.getTableConfig().getClassName());
		data.put("description", buildCodeConfig.getDescription());
		
		data.put("tableConfig", buildCodeConfig.getTableConfig());
		data.put("columns", buildCodeConfig.getTableConfig().getColumns());
		
		data.put("createDate", FormatDate(new Date(), "yyyy-MM-dd HH:mm"));
		data.put("author", buildCodeConfig.getAuthor());
		
		for(CgColumnConfig column : buildCodeConfig.getTableConfig().getColumns()){
			if("Y".equals(column.getIsKey())){
				data.put("pkField", column.getFieldName());
				data.put("pkType", column.getFieldType());
				data.put("pkColumn", column.getColumnName());
				break;
			}
		}
		
		return data;
	}
	
	
	private String FormatDate(Date date, String sf){
	    if (date == null){
	    	return "";
	    }
	    SimpleDateFormat dateformat = new SimpleDateFormat(sf);
	    return dateformat.format(date);
	}
}
