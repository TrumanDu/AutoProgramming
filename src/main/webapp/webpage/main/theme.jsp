<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<title><spring:message code="title"></spring:message></title>
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="${webRoot}/static/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
	<link href="${webRoot}/static/global/plugins/select2/select2.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/plugins/treetable/default/jquery.treeTable.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/plugins/treetable/vsStyle/jquery.treeTable.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/plugins/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css"/>
	<!-- END PAGE LEVEL PLUGIN STYLES -->
	<!-- BEGIN THEME STYLES -->
	<link href="${webRoot}/static/global/css/components.css" id="style_components" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/global/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/admin/layout/css/themes/darkblue.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="${webRoot}/static/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
	<link href="${webRoot}/static/custom/common.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
</head>
<body class="page-header-fixed page-quick-sidebar-over-content">
	<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<div style="margin-top: 6px;">
				<span style="color: #fff;font-size: 24px;">Auto</span><span style="color: red;font-size: 24px;">Programming</span>
			</div>
			<%-- <a href="#">
				<img src="${webRoot}/static/admin/layout/img/logo.png" alt="logo" class="logo-default"/>
			</a> --%>
			<div class="menu-toggler sidebar-toggler hide">
			</div>
		</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN TOP NAVIGATION MENU -->
		<div class="top-menu">
			<ul class="nav navbar-nav pull-right">
				<!-- BEGIN NOTIFICATION DROPDOWN -->
				<li class="dropdown dropdown-user">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<img alt="" class="img-circle" src="${webRoot}/static/admin/layout/img/avatar3_small.jpg"/>
					<span class="username username-hide-on-mobile">Nick</span>
					<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-menu-default">
						<li>
							<a href="extra_profile.html">
							<i class="icon-user"></i> My Profile </a>
						</li>
						<li>
							<a href="page_calendar.html">
							<i class="icon-calendar"></i> My Calendar </a>
						</li>
						<li>
							<a href="inbox.html">
							<i class="icon-envelope-open"></i> My Inbox <span class="badge badge-danger">
							3 </span>
							</a>
						</li>
						<li>
							<a href="page_todo.html">
							<i class="icon-rocket"></i> My Tasks <span class="badge badge-success">
							7 </span>
							</a>
						</li>
						<li class="divider">
						</li>
						<li>
							<a href="extra_lock.html">
							<i class="icon-lock"></i> Lock Screen </a>
						</li>
						<li>
							<a href="<c:url value="/login/logout"></c:url>">
							<i class="icon-key"></i> Log Out </a>
						</li>
					</ul>
				</li>
				<!-- END USER LOGIN DROPDOWN -->
				<li class="dropdown dropdown-quick-sidebar-toggler">
					<a class="dropdown-toggle" href="<c:url value="/login/logout"></c:url>">
					<i class="icon-logout"></i>
					</a>
				</li>
				<!-- END QUICK SIDEBAR TOGGLER -->
			</ul>
		</div>
		<!-- END TOP NAVIGATION MENU -->
	</div>
	<!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper">
		<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->
			<ul class="page-sidebar-menu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
				<li class="sidebar-toggler-wrapper">
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler" style="margin-bottom: 10px;">
					</div>
					<!-- END SIDEBAR TOGGLER BUTTON -->
				</li>
				<li class="active">
					<a href="javascript:;" onclick="menu(this,'/index/home')">
					<i class="icon-home"></i>
					<span class="title">首页</span>
					<span class="selected"></span>
					</a>
				</li>
				${menus}
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
	</div>
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->
			<h3 class="page-title">首页</h3>
			<div class="page-bar">
				<ul class="page-breadcrumb content-header">
					<li><i class="fa fa-home"></i></li>
					<li>
						<span>首页</span>
					</li>
				</ul>
			</div>
			<div class="row content-panel"></div>
		</div>
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
	<div class="page-footer-inner">
		<spring:message code="footer"></spring:message>
	</div>
	<div class="scroll-to-top">
		<i class="icon-arrow-up"></i>
	</div>
</div>
<!-- END FOOTER -->	
	
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->
	<!--[if lt IE 9]>
	<script src="${webRoot}/static/global/plugins/respond.min.js"></script>
	<script src="${webRoot}/static/global/plugins/excanvas.min.js"></script> 
	<![endif]-->
	<script src="${webRoot}/static/global/plugins/jquery.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="${webRoot}/static/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="${webRoot}/static/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/jquery-validation/js/localization/messages_zh.js" type="text/javascript"></script>
	<script src="${webRoot}/static/custom/validate-override.js" type="text/javascript"></script>
	<script src="${webRoot}/static/custom/validate-custom.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/select2/select2.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/treetable/jquery.treeTable.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/ztree/js/jquery.ztree.core.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/ztree/js/jquery.ztree.excheck.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
	<script src="${webRoot}/static/global/plugins/echarts.common.min.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<script type="text/javascript">
		// 项目访问根目录
		var webRoot = '${webRoot}';
	</script>
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="${webRoot}/static/global/scripts/metronic.js" type="text/javascript"></script>
	<script src="${webRoot}/static/admin/layout/scripts/layout.js" type="text/javascript"></script>
	<script src="${webRoot}/static/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script type="text/javascript">
		jQuery(document).ready(function() {    
			Metronic.init(); // init metronic core componets
			Layout.init(); // init layout
			QuickSidebar.init(); // init quick sidebar
			// 首页加载
			$.ajax({
				type: 'post',
				url: webRoot+'/index/home',
				dataType: 'html',
				success: function(data){
					$('.content-panel').html(data);
				}
			});
		});
	</script>
	<script src="${webRoot}/static/custom/message_zh_CN.js" type="text/javascript"></script>
	<script src="${webRoot}/static/custom/common.js" type="text/javascript"></script>
</body>
</html>