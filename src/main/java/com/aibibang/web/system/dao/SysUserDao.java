package com.aibibang.web.system.dao;

import com.aibibang.common.base.BaseDao;
import com.aibibang.web.system.entity.SysUser;

public interface SysUserDao extends BaseDao<SysUser, Long> {

	public SysUser findByUsername(String username);
}
