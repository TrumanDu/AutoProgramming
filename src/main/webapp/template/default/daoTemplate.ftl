<#if packageStyle == "service">
package ${sourceBasePackage}.${entityPackage}.dao;
import ${sourceBasePackage}.${entityPackage}.entity.${className};
<#else>
package ${sourceBasePackage}.dao.${entityPackage};
import ${sourceBasePackage}.entity.${entityPackage}.${className};
</#if>
import com.cg.common.base.BaseDao;

/**
 * 
 * ${description}dao接口.
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
public interface ${className}Dao extends BaseDao<${className}, ${pkType}> {


}