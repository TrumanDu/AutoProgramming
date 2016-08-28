<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="portlet box green">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>角色管理
		</div>
  </div>
  <div class="portlet-body form">
  	<form id="sysRoleForm" class="form-horizontal form-bordered" action="/sysRole/save" method="post">
  		<div class="form-group">
        <label class="col-md-3 control-label">角色编码:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="roleCode" required
	          	value="${sysRole.roleCode}"  maxlength="50"/>
	        </div>
        </div>
      </div>
  		<div class="form-group">
        <label class="col-md-3 control-label">角色名称:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="roleName" required
	          	value="${sysRole.roleName}"  maxlength="50"/>
	        </div>
        </div>
      </div>
  		<div class="form-group">
        <label class="col-md-3 control-label">备注:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	        	<textarea rows="5" class="form-control" name="description" maxlength="255">${sysRole.description}</textarea>
	        </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">菜单权限:</label>
        <div class="col-md-4">
        	<input type="hidden" id="menuIds" name="menuIds"/>
        	<ul id="menuTree" class="ztree" style="margin-top:0; width:160px;"></ul>
        </div>
      </div>
      <div class="form-actions">
        <div class="col-md-9 col-md-offset-3">
          <button type="button" class="btn btn-primary" onclick="saveRole()">
          	<spring:message code="btn.save"></spring:message>
          </button>
          <button type="reset" class="btn btn-default" onclick="cancel()">
          	<spring:message code="btn.return"></spring:message>
          </button>
        </div>
      </div>
      <input type="hidden" name="id" value="${sysRole.id}">
  	</form>
  </div>
</div>
<script type="text/javascript">
	$(function(){
		$('#sysRoleForm').validate();
		
		var setting = {
				check: {
					enable: true
				},
				data: {
					simpleData: {
						enable: true
					}
				},
				view: {
					showIcon: false
				}
		};
		
		var data = ${menuList};
		
		$.fn.zTree.init($("#menuTree"), setting, data);
		
		$.fn.zTree.getZTreeObj("menuTree").expandAll(true);
	});
	
	// 保存角色信息
	function saveRole(){
		var nodes = $.fn.zTree.getZTreeObj("menuTree").getCheckedNodes(true);
		var menuIds = '';
		for(var i = 0; i < nodes.length; i++){
			menuIds += nodes[i].id + ',';
		}
		$('#menuIds').val(menuIds);
		if($('#sysRoleForm').valid()){
			$.ajax({
				type: 'post',
				url: '<c:url value="/sysRole/save"></c:url>',
				data: $('#sysRoleForm').serialize(),
				dataType: 'json',
				success: function(data){
					alert(messages[data.result]);
					search();
					$(".panel-search").show();
				}
			});
		}
	}
</script>