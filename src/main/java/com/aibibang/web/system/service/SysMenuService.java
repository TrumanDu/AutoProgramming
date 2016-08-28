package com.aibibang.web.system.service;

import java.util.List;

import com.aibibang.web.system.entity.SysMenu;

public interface SysMenuService {
	
	public List<SysMenu> find(SysMenu menu);
	
	public List<SysMenu> getByParentId(Long parentId);
	
	public SysMenu getById(Long id);
	
	public void add(SysMenu menu);
	
	public void update(SysMenu menu);
	
	public void delete(Long id);
	
	public List<SysMenu> findForTreeTable(Long parentId);
	
}
