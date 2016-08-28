package com.aibibang.web.system.dao;

import java.util.List;

import com.aibibang.common.base.BaseDao;
import com.aibibang.web.system.entity.SysMenu;

public interface SysMenuDao extends BaseDao<SysMenu, Long> {
	
	public List<SysMenu> getByParentId(Long parentId);
	
	public void deleteByParentId(Long parentId);
	
	public List<SysMenu> findForTreeTable(Long parentId);
	
}
