<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="portlet box green skin skin-minimal">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>代码生成设置
		</div>
  </div>
  <div class="portlet-body form">
  	<form id="buildCodeForm" class="form-horizontal form-bordered" action="/generator/buildCode" method="post">
  		<div class="form-group">
        <label class="col-md-3 control-label">代码生成目录:</label>
        <div class="col-md-4">
        	<div class="input-icon right" onclick="openFolder('projectPath')">
	        	<i class="fa fa-search"></i>
	          <input type="text" class="form-control" name="projectPath" required/>
	        </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">代码分层风格:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <select class="form-control" name="packageStyle" required>
							<option value="service">业务分层</option>
							<option value="project">代码分层</option>
						</select>
					</div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">表名:</label>
        <div class="col-md-4">
        	<input type="text" class="form-control"  value="${tableConfig.tableName}" disabled/>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">功能描述:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="description" 
	          	value="${tableConfig.description}" required maxlength="200"/>
	        </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">代码基础包:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
        		<input type="text" class="form-control" name="sourceBasePackage" value="com.test" placeholder="com.test" required/>
        	</div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">页面基础目录:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
        		<input type="text" class="form-control" name="webBasePackage" value="webpage" placeholder="webpage" required/>
        	</div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">包名:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="entityPackage" value="test" placeholder="test" required maxlength="200"/>
	        </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">生成代码:</label>
        <div class="col-md-7">
        	<div class="checkbox-list">
	        	<label class="checkbox-inline">
	        		<input type="checkbox" name="flags" value="page" checked/>page
	        	</label>
	        	<label class="checkbox-inline">
	        		<input type="checkbox" name="flags" value="entity" checked/>entity
	        	</label>
	        	<label class="checkbox-inline">
		        	<input type="checkbox" name="flags" value="dao" checked/>dao
		        </label>
		        <label class="checkbox-inline">
		        	<input type="checkbox" name="flags" value="service" checked/>service
		        </label>
		        <label class="checkbox-inline">
		        	<input type="checkbox" name="flags" value="controller" checked/>controller
		        </label>
	        </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">页面风格:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <select class="form-control" name="pageModel" required>
							<option value="default">默认风格</option>
						</select>
	        </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">作者:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="author" required/>
	        </div>
        </div>
      </div>
      <div class="form-actions">
        <div class="col-md-9 col-md-offset-3">
          <button type="button" class="btn btn-primary" onclick="save(this)">
          	<spring:message code="btn.submit"></spring:message>
          </button>
          <button type="reset" class="btn btn-default" onclick="cancel()">
          	<spring:message code="btn.return"></spring:message>
          </button>
        </div>
      </div>
      <input type="hidden" name="tableId" value="${tableConfig.id }"/>
  	</form>
  </div>
</div>
<script type="text/javascript">
	$(function(){
		$('#buildCodeForm').validate();
		
	});
	function openFolder(path){
		alert(path);
	}
</script>