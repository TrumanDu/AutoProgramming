<#if packageStyle == "service">
package ${sourceBasePackage}.${entityPackage}.service;
import ${sourceBasePackage}.${entityPackage}.entity.${className};
<#else>
package ${sourceBasePackage}.service.${entityPackage};
import ${sourceBasePackage}.entity.${entityPackage}.${className};
</#if>
import java.util.List;

import com.cg.common.persistence.Page;

/**
 * 
 * ${description}service接口
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
public interface ${className}Service{
	
 	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	分页查询
	 * </pre>
	 * 
	 * @param ${className?uncap_first}
	 * @param page
	 * @return
	 */
	public Page<${className}> findByPage(${className} ${className?uncap_first},Page<${className}> page);
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	查询
	 * </pre>
	 * 
	 * @param ${className?uncap_first}
	 * @return
	 */
	public List<${className}> findBySearch(${className} ${className?uncap_first});
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	通过ID查询
	 * </pre>
	 * 
	 * @param ${className}
	 * @return
	 */
	public ${className} getById(${pkType} ${pkField});
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	新增
	 * </pre>
	 * 
	 * @param ${className?uncap_first}
	 */
	public void add(${className} ${className?uncap_first});
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	修改
	 * </pre>
	 * 
	 * @param ${className?uncap_first}
	 */
	public void update(${className} ${className?uncap_first});
	
	/**
	 * 
	 * <pre>
	 * 	${createDate} ${author}
	 * 	删除
	 * </pre>
	 * 
	 * @param ${pkField}
	 */
	public void delete(${pkType} ${pkField});
}
