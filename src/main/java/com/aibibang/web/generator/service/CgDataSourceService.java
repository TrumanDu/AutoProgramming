package com.aibibang.web.generator.service;

import java.util.List;

import com.aibibang.common.persistence.Page;
import com.aibibang.web.generator.entity.CgDataSource;

public interface CgDataSourceService {

	public Page<CgDataSource> findByPage(CgDataSource dataSource,Page<CgDataSource> page);
	
	public List<CgDataSource> findBySearch(CgDataSource dataSource);
	
	public CgDataSource getById(Long id);
	
	public void add(CgDataSource dataSource) throws Exception;
	
	public void update(CgDataSource dataSource) throws Exception;
	
	public void delete(Long dataSourceId) throws Exception;
}
