<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<#if packageStyle == "service">
<mapper namespace="${sourceBasePackage}.${entityPackage}.dao.${className}Dao">
<#else>
<mapper namespace="${sourceBasePackage}.dao.${entityPackage}.${className}Dao">
</#if>

	<#if packageStyle == "service">
	<parameterMap id="parameterMap" type="${sourceBasePackage}.${entityPackage}.entity.${className}"></parameterMap>
	<resultMap id="resultMap" type="${sourceBasePackage}.${entityPackage}.entity.${className}">
		<#list columns as po>
		<result property="${po.fieldName}" column="${po.columnName}"/>
		</#list>
	</resultMap>
  <#else>
	<parameterMap id="parameterMap" type="${sourceBasePackage}.entity.${entityPackage}.${className}"></parameterMap>
	<resultMap id="resultMap" type="${sourceBasePackage}.entity.${entityPackage}.${className}">
		<#list columns as po>
		<result property="${po.fieldName}" column="${po.columnName}"/>
		</#list>
	</resultMap>
  </#if>
	
	<sql id="columnSql">
		select
			<trim suffixOverrides=",">
			<#list columns as po>
				t.${po.columnName},
			</#list>
		 	</trim>
		from ${tableName} t
	</sql>
	
	<select id="find" parameterMap="parameterMap" resultMap="resultMap">
		<include refid="columnSql"></include>
		<where>
			<#list columns as po>
			<#if po.isKey == 'N'>
			<if test="${po.fieldName} != null and ${po.fieldName} != ''">
				t.${po.columnName} = ${'#'}{${po.fieldName}}
			</if>
			</#if>
			</#list>
		</where>
	</select>
	
	<select id="getById" parameterType="java.lang.${pkType}" resultMap="resultMap">
		<include refid="columnSql"></include>
		where ${pkField} = ${'#'}{value}
	</select>
	
	<insert id="add" parameterMap="parameterMap">
		insert into ${tableName}
		<trim prefix="(" suffix=")" suffixOverrides=",">
			<#list columns as po>
			<#if po.isKey == 'N'>
			${po.columnName},
			</#if>
			</#list>
		</trim>
		<trim prefix="values (" suffix=")" suffixOverrides=",">
			<#list columns as po>
			<#if po.isKey == 'N'>
			${'#'}{${po.fieldName}},
			</#if>
			</#list>
		</trim>
	</insert>
	
	<insert id="batchAdd" parameterType="java.util.List">
		insert into ${tableName}
		<trim prefix="(" suffix=")" suffixOverrides=",">
			<#list columns as po>
			<#if po.isKey == 'N'>
			${po.columnName},
			</#if>
			</#list>
		</trim>
		values
		<foreach collection="list" item="item" separator=",">
			<trim prefix="(" suffix=")" suffixOverrides=",">
			<#list columns as po>
			<#if po.isKey == 'N'>
				${'#'}{item.${po.fieldName}},
			</#if>
			</#list>
			</trim>
		</foreach>
	</insert>
	
	<update id="update" parameterMap="parameterMap">
		update ${tableName}
		<set>
			<#list columns as po>
			<#if po.isKey == 'N'>
			${po.columnName} = ${'#'}{${po.fieldName}},
			</#if>
			</#list>
		</set>
		where ${pkColumn} = ${'#'}{${pkField}}
	</update>
	
	<update id="updateNotNull" parameterMap="parameterMap">
		update ${tableName}
		<set>
			<#list columns as po>
			<#if po.isKey == 'N'>
			<if test="${po.fieldName} != null">
			${po.columnName} = ${'#'}{${po.fieldName}},
			</if>
			</#if>
			</#list>
		</set>
		where ${pkColumn} = ${'#'}{${pkField}}
	</update>
	
	<delete id="delete" parameterType="java.lang.${pkType}">
		delete from ${tableName} where ${pkColumn} = ${'#'}{value}
	</delete>
	
	<delete id="batchDelete" parameterType="java.util.List">
		delete from ${tableName} where ${pkColumn} in
		<foreach collection="list" item="item" open="(" close=")" separator=",">
			${'#'}{item}
		</foreach>
	</delete>
	
</mapper>