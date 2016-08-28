<#if packageStyle == "service">
package ${sourceBasePackage}.${entityPackage}.service.impl;
import ${sourceBasePackage}.${entityPackage}.service.${className}Service;
import ${sourceBasePackage}.${entityPackage}.dao.${className}Dao;
import ${sourceBasePackage}.${entityPackage}.entity.${className};
<#else>
package ${sourceBasePackage}.service.impl.${entityPackage};
import ${sourceBasePackage}.service.${entityPackage}.${className}Service;
import ${sourceBasePackage}.dao.${entityPackage}.${className}Dao;
import ${sourceBasePackage}.entity.${entityPackage}.${className};
</#if>
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cg.common.persistence.Page;

/**
 * 
 * ${description}service实现类
 * 
 * <pre>
 * 	历史记录：
 * 	${createDate} ${author}
 * 	新建文件
 * </pre>
 * 
 * @author 
 * <pre>
 * SD
 * 	${author}
 * PG
 *	${author}
 * UT
 *
 * MA
 * </pre>
 * @version $Rev$
 *
 * <p/> $Id$
 *
 */
@Service("${className?uncap_first}Service")
public class ${className}ServiceImpl implements ${className}Service {

	@Resource
	private ${className}Dao ${className?uncap_first}Dao;
	
	@Override
	public Page<${className}> findByPage(${className} ${className?uncap_first}, Page<${className}> page) {

		page.setResult(${className?uncap_first}Dao.find(${className?uncap_first}, page));
		
		return page;
	}
	
	@Override
	public List<${className}> findBySearch(${className} ${className?uncap_first}) {

		return ${className?uncap_first}Dao.find(${className?uncap_first});
	}
	
	@Override
	public ${className} getById(${pkType} ${pkField}) {

		return ${className?uncap_first}Dao.getById(${pkField});
	}

	@Override
	public void add(${className} ${className?uncap_first}) {

		${className?uncap_first}Dao.add(${className?uncap_first});
	}
	
	@Override
	public void update(${className} ${className?uncap_first}) {

		${className?uncap_first}Dao.update(${className?uncap_first});
	}

	@Override
	public void delete(${pkType} ${pkField}) {

		${className?uncap_first}Dao.delete(${pkField});
	}
 	
}