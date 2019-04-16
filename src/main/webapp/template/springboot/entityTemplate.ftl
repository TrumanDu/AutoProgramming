package ${sourceBasePackage}.${entityPackage}.model;
import java.io.Serializable;
/**
 * 
 * ${description}实体类.
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
public class ${className} implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	<#list columns as po>
	/**${po.description}*/
	private ${po.fieldType} ${po.fieldName};
	</#list>
	
	<#list columns as po>
	/**
	 *方法: 取得${po.fieldType}
	 *@return: ${po.fieldType}  ${po.description}
	 */
	public ${po.fieldType} get${po.fieldName?cap_first}(){
		return this.${po.fieldName};
	}

	/**
	 *方法: 设置${po.fieldType}
	 *@param: ${po.fieldType}  ${po.description}
	 */
	public void set${po.fieldName?cap_first}(${po.fieldType} ${po.fieldName}){
		this.${po.fieldName} = ${po.fieldName};
	}
	
	</#list>
}
