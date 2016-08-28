<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<title>404</title>
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="${webRoot}/static/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<link href="${webRoot}/static/admin/pages/css/error.css" rel="stylesheet" type="text/css"/>
	<!-- BEGIN THEME STYLES -->
	<link href="${webRoot}/static/global/css/components.css" id="style_components" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/admin/layout/css/themes/darkblue.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="${webRoot}/static/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
</head>
<body class="page-404-full-page">
	<div class="row">
		<div class="col-md-12 page-404">
			<div class="number">
				 404
			</div>
			<div class="details">
				<h3>Oops! You're lost.</h3>
				<p>
					We can not find the page you're looking for.<br/>
					<a href="${webRoot}/index">Return home </a>
					or try the search bar below.
				</p>
				<form action="#">
					<div class="input-group input-medium">
						<input type="text" class="form-control" placeholder="keyword...">
						<span class="input-group-btn">
						<button type="submit" class="btn blue"><i class="fa fa-search"></i></button>
						</span>
					</div>
					<!-- /input-group -->
				</form>
			</div>
		</div>
	</div>
</body>
</html>