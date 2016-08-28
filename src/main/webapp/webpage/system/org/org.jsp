<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="portlet box green">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>组织维护
		</div>
  </div>
  <div class="portlet-body form">
  	<form id="orgForm" class="form-horizontal form-bordered" action="/org/save" method="post">
  		<div class="form-group">
        <label class="col-md-3 control-label">组织名称:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="orgName" value="${org.orgName}" required maxlength="200"/>
	        </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">上级组织:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	        	<input type="hidden" id="parentId" name="parentId" value="${org.parentId}"/>
	          <input type="text" class="form-control" id="parentName" name="parentName" onclick="showOrg()" readonly
	          	value="${org.parentOrg.orgName}" maxlength="200"/>
        	</div>
        </div>
        <div class="col-md-2">
        	<button type="button" class="btn btn-default" onclick="clearParentOrg()">清空</button>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">备注:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	        	<textarea rows="5" class="form-control" name="description" maxlength="300">${org.description}</textarea>
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
      <input type="hidden" id="id" name="id" value="${org.id}">
      <input type="hidden" name="orgCode" value="${org.orgCode}">
  	</form>
  </div>
</div>
<div class="modal fade" id="orgModal" tabindex="-1" role="basic" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">选择上级组织</h4>
			</div>
			<div class="modal-body">
				 <ul id="orgTree" class="ztree" style="margin-top:0; width:160px;"></ul>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn blue" onclick="saveParentOrg()">确定</button>
				<button type="button" class="btn default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var setting = {
		view: {
			showIcon: false,
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};
	$(function(){
		$('#orgForm').validate();
	});
	// 保存上级组织
	function saveParentOrg(){
		var nodes = $.fn.zTree.getZTreeObj("orgTree").getSelectedNodes();
		if(nodes[0].id != $('#id').val()){
			$('#parentId').val(nodes[0].id);
			$('#parentName').val(nodes[0].name);
			// 隐藏弹窗
			$('#orgModal').modal('hide');
		}
		else{
			alert('不能选择当前组织');
		}
	}
	// 清空上级组织
	function clearParentOrg(){
		$('#parentId').val('');
		$('#parentName').val('');
	}
	// 显示弹窗
	function showOrg(){
		// 加载组织的树状结构
		$.ajax({
			type: 'post',
			url: '<c:url value="/org/getOrgForTree"></c:url>',
			data: {currentId:$('#id').val()},
			dataType: 'json',
			success: function(data){
				$.fn.zTree.init($("#orgTree"), setting, data);
			}
		});
		$('#orgModal').modal('show');
	}
</script>