package com.aibibang.common.base;

import java.io.Serializable;
import java.util.Date;

import com.aibibang.common.constant.Globals;

/**
 * Entity基础类
 * 
 * @author King
 *
 */
public class BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 主键ID */
	private Long id;
	/** 创建人 */
	private Long createUser;
	/** 创建日期 */
	private Date createDate;
	/** 修改人 */
	private Long updateUser;
	/** 修改日期 */
	private Date updateDate;
	/** 删除标识(0:正常；1：删除)默认正常 */
	private String delFlag = Globals.USER_TYPE_NORMAL;
	
	/** 创建人名称 */
	private String createUserName;
	/** 修改人名称 */
	private String updateUserName;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getCreateUser() {
		return createUser;
	}
	public void setCreateUser(Long createUser) {
		this.createUser = createUser;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Long getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(Long updateUser) {
		this.updateUser = updateUser;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public String getCreateUserName() {
		return createUserName;
	}
	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}
	public String getUpdateUserName() {
		return updateUserName;
	}
	public void setUpdateUserName(String updateUserName) {
		this.updateUserName = updateUserName;
	}
	
}
