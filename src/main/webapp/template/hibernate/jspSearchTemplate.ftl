<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="col-md-12">
	<div class="panel-search">
	  <form class="form-inline" action="/${className?uncap_first}/list">
	  	<#list columns as po>
	  	<#if po.isQuery == 'Y'>
	    <div class="form-group">
	      <label class="control-label">${po.description}：</label>
	      <input type="text" class="form-control" name="${po.fieldName}">
	    </div>
	    </#if>
	    </#list>
	  </form>
	  <div class="btn-div">
			<div class="div-left">
				<button type="button" class="btn btn-warning" onclick="add('/${className?uncap_first}/${className?uncap_first}')">
					<i class="fa fa-plus"></i> <spring:message code="btn.add"></spring:message>
				</button>
			</div>
			<div class="div-right">
				<button type="button" class="btn btn-primary" onclick="search()">
					<i class="fa fa-search"></i> <spring:message code="btn.search"></spring:message>
				</button>
		    <button type="button" class="btn btn-default" onclick="reset()">
		    	<i class="fa fa-repeat"></i> <spring:message code="btn.reset"></spring:message>	
		    </button>
			</div>
		</div>
	</div>
	<div class="panel-content"></div>
</div>
<script type="text/javascript">
	$(function(){
		search();
	});
</script>