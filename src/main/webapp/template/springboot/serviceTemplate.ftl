package ${sourceBasePackage}.${entityPackage}.service;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ${sourceBasePackage}.${entityPackage}.model.${className};

/** 
* ${createDate} ${author}
* @version: v1.0
* @description:
*/
@Mapper
public interface ${className}Mapper {
   
	@Select("SELECT * FROM ${tableName}")
	public List<${className}> getAll${className}();
	
	
	@Insert("insert into ${tableName}(<#list columns as po><#if po.isKey == 'N'>${po.columnName},</#if></#list>) values(<#list columns as po><#if po.isKey == 'N'>${'#'}{${po.fieldName}},</#if></#list>)")
	public boolean add(${className} ${className?uncap_first});
	
	@Select("select * from ${tableName} where ${pkColumn} = ${'#'}{${pkField}}")
	public ${className} get${className}ById(int id);
	
	@Delete("delete from ${tableName} where ${pkColumn} = ${'#'}{${pkField}}")
	public boolean deleteById(int id);
	
	@Update("update ${tableName} set <#list columns as po><#if po.isKey == 'N'>${po.columnName}=${'#'}{${po.fieldName}},</#if></#list> where ${pkColumn} = ${'#'}{${pkField}}")
	public boolean update(${className} ${className?uncap_first});
}