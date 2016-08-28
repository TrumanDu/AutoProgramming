<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="table-scrollable">
	<table class="table table-striped table-hover table-success">
		<thead>
			<tr>
				<th>#</th>
				<th>用户名</th>
				<th>姓名</th>
				<th>组织</th>
				<th>电话</th>
				<th>邮箱</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.result }" var="user" varStatus="vs">
			<tr>
				<td>${vs.count + page.offset}</td>
				<td>${user.username}</td>
				<td>${user.name}</td>
				<td>${user.orgName}</td>
				<td>${user.phone}</td>
				<td>${user.email}</td>
				<td>
					<a href="javascript:" onclick="update('/user/user?id=${user.id}')">编辑</a>
					<a href="javascript:" onclick="del('/user/delete?id=${user.id}')">删除</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="pageination-panel">${page}</div>