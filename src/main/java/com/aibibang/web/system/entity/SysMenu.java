package com.aibibang.web.system.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.aibibang.common.base.BaseEntity;

public class SysMenu extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 菜单名称 */
	private String menuName;
	/** 菜单路径 */
	private String menuUrl;
	/** 菜单图标 */
	private String menuIcon;
	/** 父级菜单ID */
	private Long parentId;
	/** 排序 */
	private Integer sort;
	
	/** 记录下级菜单的数量 */
	private Integer childNum;
	/** 父级菜单 */
	private SysMenu parentMenu;
	/** 子菜单集合 */
	private List<SysMenu> children = new ArrayList<SysMenu>();
	
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getMenuIcon() {
		return menuIcon;
	}
	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	public Integer getChildNum() {
		return childNum;
	}
	public void setChildNum(Integer childNum) {
		this.childNum = childNum;
	}
	
	public SysMenu getParentMenu() {
		return parentMenu;
	}
	public void setParentMenu(SysMenu parentMenu) {
		this.parentMenu = parentMenu;
	}
	public List<SysMenu> getChildren() {
		return children;
	}
	public void setChildren(List<SysMenu> children) {
		this.children = children;
	}
	
}
