<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="portlet box green">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>菜单维护
		</div>
  </div>
  <div class="portlet-body form">
  	<form id="menuForm" class="form-horizontal form-bordered" action="/menu/save" method="post">
  		<div class="form-group">
        <label class="col-md-3 control-label">菜单名称:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="menuName" value="${menu.menuName}" required maxlength="200"/>
	        </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">访问路径:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="menuUrl" value="${menu.menuUrl}" maxlength="200"/>
        	</div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">图标:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="menuIcon" value="${menu.menuIcon}" maxlength="100"/>
        	</div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">上级菜单:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	        	<input type="hidden" id="parentId" name="parentId" value="${menu.parentId}"/>
	          <input type="text" class="form-control" id="parentName" name="parentName" onclick="showMenu()" readonly
	          	value="${menu.parentMenu.menuName}" maxlength="200"/>
        	</div>
        </div>
        <div class="col-md-2">
        	<button type="button" class="btn btn-default" onclick="clearParentMenu()">清空</button>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">排序:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="sort" value="${menu.sort}" required maxlength="3"/>
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
      <input type="hidden" id="id" name="id" value="${menu.id }">
  	</form>
  </div>
</div>
<div class="modal fade" id="menuModal" tabindex="-1" role="basic" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">选择上级菜单</h4>
			</div>
			<div class="modal-body">
				 <ul id="menuTree" class="ztree" style="margin-top:0; width:160px;"></ul>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn blue" onclick="saveParentMenu()">确定</button>
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
		$('#menuForm').validate({
			rules: {
				sort: {
					number: true
				}
			}
		});
	});
	// 保存上级菜单
	function saveParentMenu(){
		var nodes = $.fn.zTree.getZTreeObj("menuTree").getSelectedNodes();
		if(nodes[0].id != $('#id').val()){
			$('#parentId').val(nodes[0].id);
			$('#parentName').val(nodes[0].name);
			// 隐藏弹窗
			$('#menuModal').modal('hide');
		}
		else{
			alert('不能选择当前菜单');
		}
	}
	// 清空上级菜单
	function clearParentMenu(){
		$('#parentId').val('');
		$('#parentName').val('');
	}
	// 显示弹窗
	function showMenu(){
		// 加载菜单的树状结构
		$.ajax({
			type: 'post',
			url: '<c:url value="/menu/getMenuForTree"></c:url>',
			data: {currentId:$('#id').val()},
			dataType: 'json',
			success: function(data){
				$.fn.zTree.init($("#menuTree"), setting, data);
			}
		});
		$('#menuModal').modal('show');
	}
</script>