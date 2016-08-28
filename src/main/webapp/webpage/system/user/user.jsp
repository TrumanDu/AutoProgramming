<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="portlet box green">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>用户维护
		</div>
  </div>
  <div class="portlet-body form">
  	<form id="userForm" class="form-horizontal form-bordered" action="/user/save" method="post" enctype="multipart/form-data">
  		<div class="form-group ">
				<label class="control-label col-md-3">用户头像:</label>
				<div class="col-md-9">
					<div class="fileinput fileinput-new" data-provides="fileinput">
						<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;">
							<c:if test="${not empty user.userPhoto}">
								<img src="<c:url value="/common/showImage?filePath=${user.userPhoto}"></c:url>" alt=""/>
							</c:if>
						</div>
						<div>
							<span class="btn default btn-file">
								<span class="fileinput-new">选择图片</span>
								<span class="fileinput-exists">编辑</span>
								<input type="file" name="userPhoto">
							</span>
							<a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput">删除</a>
						</div>
					</div>
				</div>
			</div>
  		<div class="form-group">
        <label class="col-md-3 control-label">用户名:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="username" value="${user.username}" required maxlength="50"/>
	        </div>
        </div>
      </div>
      <c:if test="${empty user}">
  		<div class="form-group">
        <label class="col-md-3 control-label">密码:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="password" value="${user.password}" required  maxlength="50"/>
	        </div>
        </div>
      </div>
      </c:if>
  		<div class="form-group">
        <label class="col-md-3 control-label">姓名:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="name" value="${user.name}" required maxlength="50"/>
	        </div>
        </div>
      </div>
  		<div class="form-group">
        <label class="col-md-3 control-label">组织:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="hidden" id="orgId" name="orgId" value="${user.orgId}"/>
	          <input type="text" class="form-control" id="orgName" name="orgName" required onclick="showOrg()"
	          	required readonly value="${user.orgName}">
	        </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">角色:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	        	<select class="form-control select2" style="padding: 0;" id="roleId" required multiple>
	        		<c:forEach items="${roleList}" var="role">
	        			<option value="${role.id}" <c:if test="${role.userHas}">selected</c:if>>${role.roleName}</option>
	        		</c:forEach>
	        	</select>
	        	<input type="hidden" id="roleIds" name="roleIds"/>
	        </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-md-3 control-label">出生日期:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	        	<div class="input-group date date-picker" data-date-format="yyyy-mm-dd">
							<input type="text" class="form-control" name="birthday" readonly required
								value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>"  maxlength="11"/>
							<span class="input-group-btn">
							<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
							</span>
						</div>
	        </div>
        </div>
      </div>
  		<div class="form-group">
        <label class="col-md-3 control-label">电话:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="phone" required value="${user.phone}"  maxlength="11"/>
	        </div>
        </div>
      </div>
  		<div class="form-group">
        <label class="col-md-3 control-label">邮箱:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	          <input type="text" class="form-control" name="email" required value="${user.email}"  maxlength="50"/>
	        </div>
        </div>
      </div>
  		<div class="form-group">
        <label class="col-md-3 control-label">备注:</label>
        <div class="col-md-4">
        	<div class="input-icon right">
	        	<i class="fa"></i>
	        	<textarea rows="5" class="form-control" name="description" maxlength="255">${user.description}</textarea>
	        </div>
        </div>
      </div>
      <div class="form-actions">
        <div class="col-md-9 col-md-offset-3">
          <button type="button" class="btn btn-primary" onclick="saveUser(this)">
          	<spring:message code="btn.save"></spring:message>
          </button>
          <button type="reset" class="btn btn-default" onclick="cancel()">
          	<spring:message code="btn.return"></spring:message>
          </button>
        </div>
      </div>
      <input type="hidden" name="id" value="${user.id}">
  	</form>
  </div>
</div>
<div class="modal fade" id="orgModal" tabindex="-1" role="basic" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">所属组织</h4>
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
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};
	$(function(){
		$('#userForm').validate({
			rules: {
				phone: {
					phone: true
				},
				email: {
					email: true
				}
			}
		});
 		// init select2
		$('#roleId').select2({
				allowClear: true
		});
		//init datepicker
		$('.date-picker').datepicker({
			language: 'zh-CN',
		 	autoclose: true,
			todayHighlight: true
		});
	});
	// 显示弹窗
	function showOrg(){
		// 加载组织的树状结构
		$.ajax({
			type: 'post',
			url: '<c:url value="/org/getOrgForTree"></c:url>',
			dataType: 'json',
			success: function(data){
				$.fn.zTree.init($("#orgTree"), setting, data);
			}
		});
		$('#orgModal').modal('show');
	}
	// 保存组织
	function saveParentOrg(){
		var nodes = $.fn.zTree.getZTreeObj("orgTree").getSelectedNodes();
		$('#orgId').val(nodes[0].id);
		$('#orgName').val(nodes[0].name);
		// 隐藏弹窗
		$('#orgModal').modal('hide');
	}
	function saveUser(obj){
		if($('#userForm').valid()){
			
			var roleIds = '';
			$('#roleId option:selected').each(function(i){
				roleIds += $(this).val() + ',';
			});
			$('#roleIds').val(roleIds);
			
			var formData = new FormData($('#userForm')[0]);
			$.ajax({
				type: 'post',
				url: '<c:url value="/user/save"></c:url>',
				data: formData,
				async: false,  
	      cache: false,  
	      contentType: false,  
	      processData: false, 
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