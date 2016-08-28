<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="portlet box green">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>数据连接
		</div>
  </div>
  <div class="portlet-body form">
  	<form id="dataSourceForm" class="form-horizontal form-bordered" action="/dataSource/save" method="post">
  		<div class="form-group">
        <label class="col-md-3 control-label">连接名称:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="description" 
	          	value="${dataSource.description}" required maxlength="200"/>
	        </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">数据库类型:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <select class="form-control" name="databaseType" required>
							<option value="">--请选择--</option>
							<option value="mysql"
								<c:if test="${dataSource.databaseType eq 'mysql'}">selected</c:if>
							>MySql</option>
							<option value="oracle"
								<c:if test="${dataSource.databaseType eq 'oracle'}">selected</c:if>
							>Oracle</option>
							<option value="sqlserver"
								<c:if test="${dataSource.databaseType eq 'sqlserver'}">selected</c:if>
							>SQLServer</option>
						</select>
					</div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">数据库名:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="databaseName" 
	          	value="${dataSource.databaseName}" required maxlength="50"/>
        	</div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">服务器IP:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="server" 
	          	value="${dataSource.server}" required maxlength="50"/>
        	</div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">端口号:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="port" 
	          	value="${dataSource.port}" required maxlength="10"/>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">用户名:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="username" 
	          	value="${dataSource.username}" required maxlength="50"/>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">密码:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="password" 
	          	value="${dataSource.password}" required maxlength="50"/>
          </div>
        </div>
      </div>
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
      <input type="hidden" name="id" value="${dataSource.id }">
  	</form>
  </div>
</div>
<script type="text/javascript">
	$(function(){
		$('#dataSourceForm').validate();
	});
</script>