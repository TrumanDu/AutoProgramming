package com.aibibang.web.system.entity;
import java.io.Serializable;

import com.aibibang.common.base.BaseEntity;

/**
 * 
 * 用户角色实体类.
 * 
 * <pre>
 * 	历史记录：
 * 	2016-08-02 22:43 King
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
public class SysUserRole extends BaseEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	/**userId*/
	private Long userId;
	/**roleId*/
	private Long roleId;
	
	/**
	 *方法: 取得Long
	 *@return: Long  userId
	 */
	public Long getUserId(){
		return this.userId;
	}

	/**
	 *方法: 设置Long
	 *@param: Long  userId
	 */
	public void setUserId(Long userId){
		this.userId = userId;
	}
	
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
	
}
