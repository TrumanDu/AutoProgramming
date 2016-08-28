package com.aibibang.web.generator.util;

import java.io.IOException;
import java.util.Locale;

import org.apache.commons.lang.StringUtils;

import com.aibibang.common.util.ContextHolderUtil;
import com.aibibang.web.generator.entity.BuildCodeConfig;

import freemarker.template.Configuration;

public class CodePathUtils {

	private static final String SOURCE_ROOT_PACKAGE = "src.main.java";
	private static final String WEB_ROOT_PACKAGE = "src.main.webapp";

	private String getSourceRootPath(String sourceBasePackage){
		
		return (SOURCE_ROOT_PACKAGE + "/" +sourceBasePackage).replace(".", "/");
	}
	
	private String getWebRootPath(String webBasePackage){
		
		return (WEB_ROOT_PACKAGE + "/" + webBasePackage).replace(".", "/");
	}
	
	protected Configuration getConfiguration(String templateFolder) throws IOException {
	    Configuration cfg = new Configuration();
	    //cfg.setClassForTemplateLoading(this.getClass(), ResourceUtil.getConfigByName("template_path"));
	    //cfg.setDirectoryForTemplateLoading(new File(""));
	    cfg.setServletContextForTemplateLoading(ContextHolderUtil.getRequest().getServletContext(), "template/"+templateFolder);
	    cfg.setLocale(Locale.CHINA);
	    cfg.setDefaultEncoding("UTF-8");
	    return cfg;
	}

	protected String getCodePathServiceStyle(BuildCodeConfig config,String type){
	    StringBuilder str = new StringBuilder();
	    if (StringUtils.isNotBlank(type)) {
	    	
	    	String codeType = ((CodeType)Enum.valueOf(CodeType.class, type)).getValue();
	    	
	    	str.append(config.getProjectPath());
	    	str.append("/");
	      
	    	if (type.contains("jsp") || type.contains("html") || type.contains("js") || type.contains("css")){
	    		
	    		str.append(getWebRootPath(config.getWebBasePackage()));
  
	    		str.append("/");
	    		str.append(StringUtils.lowerCase(config.getEntityPackage()));
	    		str.append("/");
	  
	    	}
	    	else{
	    		
	    		str.append(getSourceRootPath(config.getSourceBasePackage()));
	  
	    		str.append("/");
	    		str.append(StringUtils.lowerCase(config.getEntityPackage()));
	    		str.append("/");
  
	    		if ("serviceImpl".equalsIgnoreCase(type)){
	    			str.append(StringUtils.lowerCase("service/impl"));
	    		}
	    		else if("entity".equalsIgnoreCase(type)){
	    			str.append(StringUtils.lowerCase("entity"));
	    		}
	    		else if("sqlxml".equals(type)){
	    			str.append(StringUtils.lowerCase("sql"));
	    		}
	    		else{
	    			str.append(StringUtils.lowerCase(codeType));
	    		}
  
	    		str.append("/");
	    	}

	    	if (type.contains("html")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".html");
	    	} 
	    	else if (type.contains("jsp")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".jsp");
	    	} 
	    	else if (type.contains("js")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".js");
	    	} 
	    	else if (type.contains("xml")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".xml");
	    	} 
	    	else {
	    		str.append(config.getTableConfig().getClassName());
		    	str.append(codeType);
	    		str.append(".java");
	    	}
	    } 
	    else {
	    	
	      throw new IllegalArgumentException("type is null");
	    }
	    
	    return str.toString();
	}

	protected String getCodePathProjectStyle(BuildCodeConfig config,String type){
	    StringBuilder str = new StringBuilder();
	    if (StringUtils.isNotBlank(type)) {
	    	
	    	String codeType = ((CodeType)Enum.valueOf(CodeType.class, type)).getValue();
	    	
	    	str.append(config.getProjectPath());
	    	str.append("/");
		      
	    	if (type.contains("jsp") || type.contains("html") || type.contains("js") || type.contains("css")){
	    		
	    		str.append(getWebRootPath(config.getWebBasePackage()));
  
	    		str.append("/");
	    		str.append(StringUtils.lowerCase(config.getEntityPackage()));
	    		str.append("/");
	  
	    	}
	    	else{
	    		
	    		str.append(getSourceRootPath(config.getSourceBasePackage()));
	  
	    		str.append("/");
  
	    		if ("serviceImpl".equalsIgnoreCase(type)){
	    			str.append(StringUtils.lowerCase("service/impl"));
	    		}
	    		else if("entity".equalsIgnoreCase(type)){
	    			str.append(StringUtils.lowerCase("entity"));
	    		}
	    		else if("sqlxml".equals(type)){
	    			str.append(StringUtils.lowerCase("sql"));
	    		}
	    		else{
	    			str.append(StringUtils.lowerCase(codeType));
	    		}
  
	    		str.append("/");
	    		str.append(StringUtils.lowerCase(config.getEntityPackage()));
	    		str.append("/");
	    	}

	    	if (type.contains("html")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".html");
	    	} 
	    	else if (type.contains("jsp")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".jsp");
	    	} 
	    	else if (type.contains("js")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".js");
	    	} 
	    	else if (type.contains("xml")) {
	    		str.append(FieldUtils.getInitialSmall(config.getTableConfig().getClassName()));
		    	str.append(codeType);
	    		str.append(".xml");
	    	} 
	    	else {
	    		str.append(config.getTableConfig().getClassName());
		    	str.append(codeType);
	    		str.append(".java");
	    	}
	    } 
	    else {
	    	
	      throw new IllegalArgumentException("type is null");
	    }
	    
	    return str.toString();
	}

	public static enum CodeType{
		  
		controller("Controller"),
		service("Service"), 
		serviceImpl("ServiceImpl"), 
		dao("Dao"),
		entity(""),
		xml(""),
		sqlxml("-sql"),
 
		jsp(""), 
		jsp_add("-add"), 
		jsp_update("-update"), 
		jspList("List"),
		jspSearch("Search"),
  
		js(""),
		css(""),
  
		html(""),
		htmlList("List");

	    private String type;

	    private CodeType(String type){
	    	this.type = type;
	    }

	    public String getValue() {
	    	return this.type;
	    }
	}
}
