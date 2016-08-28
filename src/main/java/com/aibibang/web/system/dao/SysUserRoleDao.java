package com.aibibang.web.system.dao;
import java.util.List;

import com.aibibang.common.base.BaseDao;
import com.aibibang.web.system.entity.SysUserRole;

/**
 * 
 * 用户角色dao接口.
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
public interface SysUserRoleDao extends BaseDao<SysUserRole, Long> {

	/**
	 * 查询用户的所有角色
	 * @param userId
	 * @return
	 */
	public List<Long> findByUserId(Long userId);
	
	/**
	 * 删除用户的所有角色
	 * @param userId
	 */
	public void deleteByUserId(Long userId);
}