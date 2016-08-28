package com.aibibang.web.system.entity;
import java.io.Serializable;

import com.aibibang.common.base.BaseEntity;

/**
 * 
 * 角色菜单实体类.
 * 
 * <pre>
 * 	历史记录：
 * 	2016-08-02 22:42 King
 * 	新建文件
 * </pre>
 * 
 * @author 
 * <pre>
 * SD
 * 	King
 * PG
 *	King
 * UT
 *
 * MA
 * </pre>
 * @version $Rev$
 *
 * <p/> $Id$
 *
 */
public class SysRoleMenu extends BaseEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;

	/**roleId*/
	private Long roleId;
	/**menuId*/
	private Long menuId;
	

	/**
	 *方法: 取得Long
	 *@return: Long  roleId
	 */
	public Long getRoleId(){
		return this.roleId;
	}

	/**
	 *方法: 设置Long
	 *@param: Long  roleId
	 */
	public void setRoleId(Long roleId){
		this.roleId = roleId;
	}
	
	/**
	 *方法: 取得Long
	 *@return: Long  menuId
	 */
	public Long getMenuId(){
		return this.menuId;
	}

	/**
	 *方法: 设置Long
	 *@param: Long  menuId
	 */
	public void setMenuId(Long menuId){
		this.menuId = menuId;
	}
	
}
