package com.aibibang.web.generator.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.aibibang.common.persistence.Page;
import com.aibibang.web.generator.dao.CgColumnConfigDao;
import com.aibibang.web.generator.dao.CgTableConfigDao;
import com.aibibang.web.generator.entity.CgColumnConfig;
import com.aibibang.web.generator.entity.CgTableConfig;
import com.aibibang.web.generator.service.CgTableConfigService;

@Service("CgTableConfigService")
public class CgTableConfigServiceImpl implements CgTableConfigService {

	@Resource
	private CgTableConfigDao cgTableConfigDao;
	@Resource
	private CgColumnConfigDao cgColumnConfigDao;

	@Override
	public Page<CgTableConfig> findByPage(CgTableConfig tableConfig,Page<CgTableConfig> page){
		
		page.setResult(cgTableConfigDao.find(tableConfig,page));
		
		return page;
	}
	
	@Override
	public CgTableConfig getById(Long id) {
		
		return cgTableConfigDao.getById(id);
	}
	
	@Override
	public void add(CgTableConfig tableConfig) throws Exception {
		
		cgTableConfigDao.add(tableConfig);
		
		for(CgColumnConfig column : tableConfig.getColumns()){
			
			column.setTableId(tableConfig.getId());
			column.setCreateUser(tableConfig.getCreateUser());
			column.setCreateDate(tableConfig.getCreateDate());
		}
		
		cgColumnConfigDao.batchAdd(tableConfig.getColumns());
	}

	@Override
	public void update(CgTableConfig tableConfig) throws Exception {
		
		cgTableConfigDao.update(tableConfig);
		
		for(CgColumnConfig column : tableConfig.getColumns()){
			
			column.setUpdateUser(tableConfig.getUpdateUser());
			column.setUpdateDate(tableConfig.getUpdateDate());
			
			cgColumnConfigDao.update(column);
		}
	}

	@Override
	public void delete(Long id) throws Exception {
		
		cgTableConfigDao.delete(id);
		
		cgColumnConfigDao.delete(id);
	}

}
