package com.aibibang.web.system.service;

import java.util.List;

import com.aibibang.common.persistence.Page;
import com.aibibang.web.system.entity.SysUser;

public interface SysUserService {

	public SysUser findByUsername(SysUser user);
	
	public Page<SysUser> findByPage(SysUser user,Page<SysUser> page);
	
	public SysUser getById(Long id);
	
	public void add(SysUser user);
	
	public void update(SysUser user);
	
	public void delete(Long id);
	
	/**
	 * 查询用户的所有角色
	 * @param userId
	 * @return
	 */
	public List<Long> findByUserId(Long userId);
	
	/**
	 * 获取用户所有有权限的菜单id
	 * @param userId
	 * @return
	 */
	public List<Long> findMenuIdByUserId(Long userId);
}
