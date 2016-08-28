package com.aibibang.web.generator.entity;

import java.io.Serializable;

import com.aibibang.common.base.BaseEntity;

public class CgColumnConfig extends BaseEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Long tableId;
	private String columnName;
	private String columnType;
	private Integer columnLength;
	private String description;
	private String fieldName;
	private String fieldType;
	private String nullable;
	private String relationTable;
	private String relationColumnId;
	private String relationColumnText;
	private String sort;
	private String isKey;
	private String showType;
	private String isQuery;
	private String queryModel;
	private String queryType;
	private String isShowList;
	private String isShowForm;
	private String formValidType;
	private Integer orderNum;
	
	public Long getTableId() {
		return tableId;
	}
	public void setTableId(Long tableId) {
		this.tableId = tableId;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getColumnType() {
		return columnType;
	}
	public void setColumnType(String columnType) {
		this.columnType = columnType;
	}
	public Integer getColumnLength() {
		return columnLength;
	}
	public void setColumnLength(Integer columnLength) {
		this.columnLength = columnLength;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getFieldType() {
		return fieldType;
	}
	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}
	public String getNullable() {
		return nullable;
	}
	public void setNullable(String nullable) {
		this.nullable = nullable;
	}
	public String getRelationTable() {
		return relationTable;
	}
	public void setRelationTable(String relationTable) {
		this.relationTable = relationTable;
	}
	public String getRelationColumnId() {
		return relationColumnId;
	}
	public void setRelationColumnId(String relationColumnId) {
		this.relationColumnId = relationColumnId;
	}
	public String getRelationColumnText() {
		return relationColumnText;
	}
	public void setRelationColumnText(String relationColumnText) {
		this.relationColumnText = relationColumnText;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getIsKey() {
		return isKey;
	}
	public void setIsKey(String isKey) {
		this.isKey = isKey;
	}
	public String getShowType() {
		return showType;
	}
	public void setShowType(String showType) {
		this.showType = showType;
	}
	public String getIsQuery() {
		return isQuery;
	}
	public void setIsQuery(String isQuery) {
		this.isQuery = isQuery;
	}
	public String getQueryModel() {
		return queryModel;
	}
	public void setQueryModel(String queryModel) {
		this.queryModel = queryModel;
	}
	public String getQueryType() {
		return queryType;
	}
	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}
	public String getIsShowList() {
		return isShowList;
	}
	public void setIsShowList(String isShowList) {
		this.isShowList = isShowList;
	}
	public String getIsShowForm() {
		return isShowForm;
	}
	public void setIsShowForm(String isShowForm) {
		this.isShowForm = isShowForm;
	}
	public String getFormValidType() {
		return formValidType;
	}
	public void setFormValidType(String formValidType) {
		this.formValidType = formValidType;
	}
	public Integer getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
	
}
