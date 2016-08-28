package com.aibibang.web.generator.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.aibibang.common.base.BaseEntity;

public class CgTableConfig extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String tableName;
	private String className;
	private String description;
	private String isCheckbox;
	private String isPage;
	private String isTree;
	
	private List<CgColumnConfig> columns = new ArrayList<CgColumnConfig>();
	
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIsCheckbox() {
		return isCheckbox;
	}
	public void setIsCheckbox(String isCheckbox) {
		this.isCheckbox = isCheckbox;
	}
	public String getIsPage() {
		return isPage;
	}
	public void setIsPage(String isPage) {
		this.isPage = isPage;
	}
	public String getIsTree() {
		return isTree;
	}
	public void setIsTree(String isTree) {
		this.isTree = isTree;
	}
	public List<CgColumnConfig> getColumns() {
		return columns;
	}
	public void setColumns(List<CgColumnConfig> columns) {
		this.columns = columns;
	}
	
}
