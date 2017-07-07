<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="portlet box green">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>${description}
		</div>
  </div>
  <div class="portlet-body form">
  	<form id="${className?uncap_first}Form" class="form-horizontal form-bordered" action="/${className?uncap_first}/save" method="post">
  		<#list columns as po>
  		<#if po.isShowForm == 'Y'>
  		<div class="form-group">
        <label class="col-md-3 control-label">${po.description}:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="${po.fieldName}" 
	          	value="${'$'}{${className?uncap_first}.${po.fieldName}}" ${po.formValidType} maxlength="${po.columnLength?if_exists}"/>
	        </div>
        </div>
      </div>
      </#if>
      </#list>
      <div class="form-actions">
        <div class="col-md-9 col-md-offset-3">
          <button type="button" class="btn btn-primary" onclick="save(this)">
          	<spring:message code="btn.save"></spring:message>
          </button>
          <button type="reset" class="btn btn-default" onclick="cancel()">
          	<spring:message code="btn.return"></spring:message>
          </button>
        </div>
      </div>
      <input type="hidden" name="${pkField}" value="${'$'}{${className?uncap_first}.${pkField}}">
  	</form>
  </div>
</div>
<script type="text/javascript">
	$(function(){
		${'$'}('${'#'}${className?uncap_first}Form').validate();
	});
</script>