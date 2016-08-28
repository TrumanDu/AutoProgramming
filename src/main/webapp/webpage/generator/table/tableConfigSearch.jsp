<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="col-md-12">
	<div class="panel-search">
	  <form class="form-inline" action="/tableConfig/list">
	  	<div class="form-group">
	      <label class="control-label">表名：</label>
	      <input type="text" class="form-control" name="tableName" placeholder="表名">
	    </div>
	    <div class="form-group">
	      <label class="control-label">功能描述：</label>
	      <input type="text" class="form-control" name="description" placeholder="功能描述">
	    </div>
	  </form>
	  <div class="btn-div">
			<div class="div-left">
				<button type="button" class="btn btn-warning" onclick="add('/tableConfig/tableInit')">
					<i class="fa fa-plus"></i> <spring:message code="btn.buildConfig"></spring:message>
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