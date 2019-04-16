<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="common/head.jsp"%>
<body>

	<div id="wrapper">
		<%@include file="common/common.jsp"%>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">${description}</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<c:if test="${r"${"}message != null${r"}"}">
							<div class="alert alert-success">
								<a href="#" class="close" data-dismiss="alert"> &times; </a> <strong>提示：</strong>${r"${"}message${r"}"}
							</div>
						</c:if>
						<div class="panel-heading text-right">

							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#myModal">新增</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<#list columns as po>
											<#if po.isShowList == 'Y'>
											<th>${po.description}</th>
											</#if>
											</#list>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
									    <c:forEach items="${'$'}{pageData}" var="${className?uncap_first}" varStatus="status">
											<tr class="odd gradeX">
												
												<#list columns as po>
												<#if po.isShowList == 'Y'>
												<td>${'$'}{${className?uncap_first}.${po.fieldName}}</td>
												</#if>
												</#list>
												<td class="text-center"><a class="btn btn-primary"
													href="#" onclick="update(${'$'}{${className?uncap_first}.id})">编辑</a>
													&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-danger"
													href="${r"${"}pageContext.request.contextPath${r"}"}/${className?uncap_first}/delete?id=${'$'}{${className?uncap_first}.id}">删除</a>
												</td>
											</tr>
			                            </c:forEach>
									</tbody>
								</table>
							</div>

						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">新增</h4>
							</div>

							<form role="form" id="addForm"
								action="${r"${"}pageContext.request.contextPath${r"}"}/${className?uncap_first}/add"
								method="post" enctype="multipart/form-data">
								<div class="modal-body">
								     
									 <#list columns as po>
										<#if po.isShowForm == 'Y'>									
										<div class="form-group">
										<label>${po.description}:</label> <input class="form-control"
											placeholder="${po.description}"  name="${po.fieldName}" ${po.formValidType} maxlength="${po.columnLength?if_exists}">
									     </div>
									  </#if>
									  </#list>
									
									

								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
									<button type="submit" class="btn btn-primary">保存</button>
								</div>
							</form>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</div>
			<!-- /.row -->

			<!-- /.row -->
			<div class="row">
				<!-- Modal -->
				<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
					aria-labelledby="updateLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="updateLabel">编辑</h4>
							</div>
							<form role="form" id="updateForm"
								action="${r"${"}pageContext.request.contextPath${r"}"}/${className?uncap_first}/update"
								method="post">
								<div class="modal-body">
                                       <input type="hidden" name="${pkColumn}" id="update${pkColumn}">
									 <#list columns as po>
										<#if po.isShowForm == 'Y'>									
										<div class="form-group">
										<label>${po.description}:</label> <input class="form-control"
											placeholder="${po.description}"  name="${po.fieldName}" id="update${po.fieldName}" ${po.formValidType} maxlength="${po.columnLength?if_exists}">
									     </div>
									  </#if>
									 </#list>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
									<button type="submit" class="btn btn-primary">保存</button>
								</div>
							</form>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</div>
			<!-- /.row -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<script>
    $(document).ready(function() {
    	  $('#dataTables-example').DataTable({
              responsive: true,
              "sPaginationType" : "full_numbers",
              "oLanguage" : {
                  "sLengthMenu": "每页显示 _MENU_ 条记录",
                  "sZeroRecords": "抱歉， 没有找到",
                  "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                  "sInfoEmpty": "没有数据",
                  "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                  "sZeroRecords": "没有检索到数据",
                   "sSearch": "名称:",
                  "oPaginate": {
                  "sFirst": "首页",
                  "sPrevious": "前一页",
                  "sNext": "后一页",
                  "sLast": "尾页"
                  }     
              }
      });
        
    });
    
    function update(id){
    	 $.get("${r"${"}pageContext.request.contextPath${r"}"}/${className?uncap_first}/update?id="+id, function(result){
    		    var ${className?uncap_first} =result;
    		    $('#update${pkColumn}').val(${className?uncap_first}.${pkColumn});
				
				<#list columns as po>
					<#if po.isShowForm == 'Y'>	
                      $('#update${po.fieldName}').val(${className?uncap_first}.${po.fieldName});										
					</#if>
				</#list>
    		    $('#updateModal').modal('show');
    		  },"json");
    }
 
    </script>
</body>

</html>