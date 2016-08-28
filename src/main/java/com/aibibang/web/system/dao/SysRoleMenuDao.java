package com.aibibang.web.system.dao;
import java.util.List;

import com.aibibang.common.base.BaseDao;
import com.aibibang.web.system.entity.SysRoleMenu;

/**
 * 
 * 角色菜单dao接口.
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
public interface SysRoleMenuDao extends BaseDao<SysRoleMenu, Long> {

	/**
	 * 获取角色所有菜单权限
	 * @param roleId
	 * @return
	 */
	public List<Long> findByRoleId(Long roleId);
	
	/**
	 * 删除角色下所有的菜单
	 * @param roleId
	 */
	public void deleteByRoleId(Long roleId);
	
	/**
	 * 获取用户所有的有权限的菜单
	 * @param userId
	 * @return
	 */
	public List<Long> findMenuIdByUserId(Long userId);
}