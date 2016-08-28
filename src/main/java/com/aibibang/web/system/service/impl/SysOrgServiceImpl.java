package com.aibibang.web.system.service.impl;

import java.text.DecimalFormat;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.aibibang.web.system.dao.SysOrgDao;
import com.aibibang.web.system.entity.SysOrg;
import com.aibibang.web.system.service.SysOrgService;

@Service("SysOrgService")
public class SysOrgServiceImpl implements SysOrgService {

	@Resource
	private SysOrgDao sysOrgDao;
	
	@Override
	public List<SysOrg> find(SysOrg org) {
		
		return sysOrgDao.find(org);
	}
	
	@Override
	public List<SysOrg> findForTreeTable(Long parentId) {
		
		return sysOrgDao.findForTreeTable(parentId);
	}

	@Override
	public SysOrg getById(Long id) {
		
		return sysOrgDao.getById(id);
	}

	@Override
	public void add(SysOrg org) {
		
		buildCode(org);
		
		sysOrgDao.add(org);
	}

	@Override
	public void update(SysOrg org) {
		
		// 上层组织改变时，改变组织编码
		SysOrg oldOrg = sysOrgDao.getById(org.getId());
		if(org.getParentId() != oldOrg.getParentId()){
			buildCode(org);
		}
		
		sysOrgDao.update(org);
	}

	@Override
	public void delete(Long id) {
		
		sysOrgDao.delete(id);
	}

	public void deleteChildren(Long id){
		SysOrg param = new SysOrg();
		param.setParentId(id);
		List<SysOrg> children = sysOrgDao.find(param);
		if(children != null && children.size() > 0){
			for(SysOrg child : children){
				deleteChildren(child.getId());
			}
			sysOrgDao.deleteByParentId(id);
		}
	}
	
	public void buildCode(SysOrg org){
		
		String maxCode = sysOrgDao.getMaxCode(org.getParentId());
		
		if(StringUtils.isNotEmpty(maxCode)){
			
			String preno = maxCode.substring(0, maxCode.length() - 3);
			int no = Integer.valueOf(maxCode.substring(maxCode.length() - 3));
			DecimalFormat df = new DecimalFormat("000");
			org.setOrgCode(preno+df.format(no+1));
		}
		else{
			
			SysOrg parentOrg = sysOrgDao.getById(org.getParentId());
			org.setOrgCode(parentOrg.getOrgCode()+"001");
		}
	}
}
