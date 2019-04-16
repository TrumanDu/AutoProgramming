<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE hibernate-mapping PUBLIC
        "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
        "http://www.hibernate.org/dtd/hibernate-mapping-3.0.dtd">
<hibernate-mapping package="${sourceBasePackage}.${entityPackage}.entity">
    <class name="${className}" table="${tableName}">
        <#list columns as po>
        <#if po.columnName == 'id'>
			<id name="id" column="id">
              <generator class="native"/>
            </id>
		<#else>
         	<property name="${po.fieldName}" column="${po.columnName}"/>
		</#if>
		</#list>
    </class> 
</hibernate-mapping>