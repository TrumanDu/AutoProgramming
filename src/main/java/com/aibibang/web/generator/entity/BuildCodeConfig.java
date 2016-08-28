package com.aibibang.web.generator.entity;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

public class BuildCodeConfig implements Serializable {

	private static final long serialVersionUID = 1L;

	private String projectPath;
	private String sourceBasePackage;
	private String webBasePackage;
	private String entityPackage;
	private String packageStyle;
	private String description;
	private String pageModel;
	private String author;
	
	private String[] flags;
	private boolean pageFlag = false;
	private boolean entityFlag = false;
	private boolean daoFlag = false;
	private boolean serviceFlag = false;
	private boolean controllerFlag = false;
	
	private Long tableId;
	private CgTableConfig tableConfig;
	
	public String getProjectPath() {
		return projectPath;
	}
	public void setProjectPath(String projectPath) {
		this.projectPath = projectPath;
	}
	public String getSourceBasePackage() {
		return sourceBasePackage;
	}
	public void setSourceBasePackage(String sourceBasePackage) {
		this.sourceBasePackage = sourceBasePackage;
	}
	public String getWebBasePackage() {
		return webBasePackage;
	}
	public void setWebBasePackage(String webBasePackage) {
		this.webBasePackage = webBasePackage;
	}
	public String getEntityPackage() {
		return entityPackage;
	}
	public void setEntityPackage(String entityPackage) {
		this.entityPackage = entityPackage;
	}
	public String getPackageStyle() {
		return packageStyle;
	}
	public void setPackageStyle(String packageStyle) {
		this.packageStyle = packageStyle;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPageModel() {
		return pageModel;
	}
	public void setPageModel(String pageModel) {
		this.pageModel = pageModel;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Long getTableId() {
		return tableId;
	}
	public void setTableId(Long tableId) {
		this.tableId = tableId;
	}
	public CgTableConfig getTableConfig() {
		return tableConfig;
	}
	public void setTableConfig(CgTableConfig tableConfig) {
		this.tableConfig = tableConfig;
	}
	public String[] getFlags() {
		return flags;
	}
	public void setFlags(String[] flags) {
		this.flags = flags;
		List<String> list = Arrays.asList(flags);
		if(list.contains("page")){
			this.pageFlag = true;
		}
		if(list.contains("entity")){
			this.entityFlag = true;
		}
		if(list.contains("dao")){
			this.daoFlag = true;
		}
		if(list.contains("service")){
			this.serviceFlag = true;
		}
		if(list.contains("controller")){
			this.controllerFlag = true;
		}
	}
	public boolean isPageFlag() {
		return pageFlag;
	}
	public void setPageFlag(boolean pageFlag) {
		this.pageFlag = pageFlag;
	}
	public boolean isEntityFlag() {
		return entityFlag;
	}
	public void setEntityFlag(boolean entityFlag) {
		this.entityFlag = entityFlag;
	}
	public boolean isDaoFlag() {
		return daoFlag;
	}
	public void setDaoFlag(boolean daoFlag) {
		this.daoFlag = daoFlag;
	}
	public boolean isServiceFlag() {
		return serviceFlag;
	}
	public void setServiceFlag(boolean serviceFlag) {
		this.serviceFlag = serviceFlag;
	}
	public boolean isControllerFlag() {
		return controllerFlag;
	}
	public void setControllerFlag(boolean controllerFlag) {
		this.controllerFlag = controllerFlag;
	}
	
	
	
	
}
