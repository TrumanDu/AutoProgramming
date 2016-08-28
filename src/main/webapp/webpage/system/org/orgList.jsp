<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="table-scrollable">
	<table id="treetable" class="table table-striped table-hover table-success">
		<thead>
	    <tr>
	      <th width="40%">组织名称</th>
	      <th width="35%">组织编号</th>
	      <th width="25%">操作</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach items="${orgList }" var="org">
	  		<tr id="${org.id}" pId="${org.parentId }" 
	  			<c:if test="${org.childNum > 0}">hasChild="true"</c:if>
	  		>
		  		<td><span controller="true">${org.orgName}</span></td>
		  		<td>${org.orgCode}</td>
		  		<td>
		  			<a href="javascript:void(0)" onclick="update('/org/org?id=${org.id}')">编辑</a>
						<a href="javascript:void(0)" onclick="del('/org/delete?id=${org.id}')">删除</a>
		  		</td>
		  	</tr>
	  	</c:forEach>
	  </tbody>
	</table>
</div>
<script type="text/javascript">
	$(function(){
		$('#treetable').treeTable({
			theme: 'default',
			beforeExpand: function($treeTable, id){
				//判断id是否已经有了孩子节点，如果有了就不再加载，这样就可以起到缓存的作用
	      if ($('.' + id, $treeTable).length) { return; }
				$.ajax({
					type: 'post',
					url: '<c:url value="/org/treeTable"></c:url>',
					data: {parentId:id},
					dataType: 'json',
					success: function(data){
						var rows = '';
						for(var i = 0; i < data.length; i++){
							var hasChild = '';
							if(data[i].childNum > 0){
								hasChild = 'hasChild="true"';
							}
							rows += '<tr id="'+data[i].id+'" pId="'+data[i].parentId+'" '+hasChild+'>\n'
								+ '<td><span controller="true">'+data[i].orgName+'</span></td>\n'
								+	'<td>'+data[i].orgCode+'</td>\n'
								+	'<td>\n'
								+	'<a href="javascript:void(0)" onclick="update(\'/org/org?id='+data[i].id+'\')">编辑</a>\n'
								+	'<a href="javascript:void(0)" onclick="del(\'/org/delete?id='+data[i].id+'\')">删除</a>'
								+	'</td>\n'
								+	'</tr>\n';
						}
						$treeTable.addChilds(rows);
					}
				});
			}
		});
	});
</script>