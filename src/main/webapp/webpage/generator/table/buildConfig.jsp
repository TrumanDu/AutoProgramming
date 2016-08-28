<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="portlet box green">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>生成表单配置
		</div>
  </div>
  <div class="portlet-body form">
  	<form id="buildConfigForm" class="form-horizontal form-bordered" action="/generator/buildConfig" method="post">
  		<div class="form-group">
        <label class="col-md-3 control-label">数据源:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <select class="form-control" id="dataSourceId" name="dataSourceId" required>
	          	<option value="">--请选择--</option>
	          	<c:forEach items="${dataSourceList}" var="dataSource">
	          		<option value="${dataSource.id}">${dataSource.description}</option>
	          	</c:forEach>
	          </select>
	        </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">表名:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <select class="form-control" id="tableName" name="tableName" required>
							<option value="">--请选择--</option>
							
						</select>
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
  	</form>
  </div>
</div>
<script type="text/javascript">
	$(function(){
		$('#buildConfigForm').validate();
		$('#dataSourceId').change(function(){
			if($(this).val() != ''){
				$.ajax({
					type: 'post',
					url: '${webRoot}/tableConfig/getTables',
					data: {dataSourceId:$(this).val()},
					dataType: 'json',
					success: function(data){
						if(data.result == 'error'){
							alert('数据库连接异常，请检查数据源配置');
						} else {
							var tables = data.result;
							$('#tableName').empty();
							var options = '<option value="">--请选择--</option>\n';
							for(var i = 0; i < tables.length; i++){
								options += '<option value="'+tables[i]+'">'+tables[i]+'</option>\n';
							}
							$('#tableName').append(options);
						}
					}
				});
			}
		});
	});
</script>