<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="table-scrollable">
	<table id="treetable" class="table table-striped table-hover table-success">
		<thead>
	    <tr>
	      <th width="40%">菜单名称</th>
	      <th width="35%">菜单路径</th>
	      <th width="25%">操作</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach items="${menuList }" var="menu">
	  		<tr id="${menu.id}" pId="${menu.parentId }" 
	  			<c:if test="${menu.childNum > 0}">hasChild="true"</c:if>
	  		>
		  		<td><span controller="true">${menu.menuName}</span></td>
		  		<td>${menu.menuUrl}</td>
		  		<td>
		  			<a href="javascript:void(0)" onclick="update('/menu/menu?id=${menu.id}')">编辑</a>
						<a href="javascript:void(0)" onclick="del('/menu/delete?id=${menu.id}')">删除</a>
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
					url: '<c:url value="/menu/treeTable"></c:url>',
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
								+ '<td><span controller="true">'+data[i].menuName+'</span></td>\n'
								+	'<td>'+data[i].menuUrl+'</td>\n'
								+	'<td>\n'
								+	'<a href="javascript:void(0)" onclick="update(\'/menu/menu?id='+data[i].id+'\')">编辑</a>\n'
								+	'<a href="javascript:void(0)" onclick="del(\'/menu/delete?id='+data[i].id+'\')">删除</a>'
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