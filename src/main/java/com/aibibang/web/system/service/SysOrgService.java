package com.aibibang.web.system.service;

import java.util.List;

import com.aibibang.web.system.entity.SysOrg;

public interface SysOrgService {

	public List<SysOrg> find(SysOrg org);
	
	public List<SysOrg> findForTreeTable(Long parentId);
	
	public SysOrg getById(Long id);
	
	public void add(SysOrg org);
	
	public void update(SysOrg org);
	
	public void delete(Long id);
}
