package com.aibibang.web.system.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.aibibang.common.base.BaseEntity;

public class SysUser extends BaseEntity implements Serializable {

	private static final long serialVersionUID = -802158862722106613L;

	/** 用户账号 */
	private String username;
	/** 用户密码 */
	private String password;
	/** 姓名 */
	private String name;
	/** 组织ID */
	private Long orgId;
	/** 出生日期 */
	private Date birthday;
	/** 电话 */
	private String phone;
	/** 邮箱 */
	private String email;
	/** 描述 */
	private String description;
	/** 用户头像 */
	private String userPhoto;
	
	/** 组织编码 */
	private String orgCode;
	/** 组织名称 */
	private String orgName;
	
	/** 角色id,逗号分隔 */
	private String roleIds;
	
	/** 用户菜单 */
	private List<SysMenu> menuList;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getOrgId() {
		return orgId;
	}
	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}
	
	public List<SysMenu> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<SysMenu> menuList) {
		this.menuList = menuList;
	}
	
}
