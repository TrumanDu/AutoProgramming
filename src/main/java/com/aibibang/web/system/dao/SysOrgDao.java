package com.aibibang.web.system.dao;

import java.util.List;

import com.aibibang.common.base.BaseDao;
import com.aibibang.web.system.entity.SysOrg;

public interface SysOrgDao extends BaseDao<SysOrg, Long> {

	public List<SysOrg> findForTreeTable(Long parentId);
	
	public void deleteByParentId(Long parentId);
	
	public String getMaxCode(Long parentId);
}
