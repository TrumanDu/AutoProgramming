<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="col-md-12">
<div class="row">
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="dashboard-stat blue-madison">
			<div class="visual">
				<i class="fa fa-comments"></i>
			</div>
			<div class="details">
				<div class="number">
					 1349
				</div>
				<div class="desc">
					 New Feedbacks
				</div>
			</div>
			<a class="more" href="javascript:;">
			View more <i class="m-icon-swapright m-icon-white"></i>
			</a>
		</div>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="dashboard-stat red-intense">
			<div class="visual">
				<i class="fa fa-bar-chart-o"></i>
			</div>
			<div class="details">
				<div class="number">
					 12,5M$
				</div>
				<div class="desc">
					 Total Profit
				</div>
			</div>
			<a class="more" href="javascript:;">
			View more <i class="m-icon-swapright m-icon-white"></i>
			</a>
		</div>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="dashboard-stat green-haze">
			<div class="visual">
				<i class="fa fa-shopping-cart"></i>
			</div>
			<div class="details">
				<div class="number">
					 549
				</div>
				<div class="desc">
					 New Orders
				</div>
			</div>
			<a class="more" href="javascript:;">
			View more <i class="m-icon-swapright m-icon-white"></i>
			</a>
		</div>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="dashboard-stat purple-plum">
			<div class="visual">
				<i class="fa fa-globe"></i>
			</div>
			<div class="details">
				<div class="number">
					 +89%
				</div>
				<div class="desc">
					 Brand Popularity
				</div>
			</div>
			<a class="more" href="javascript:;">
			View more <i class="m-icon-swapright m-icon-white"></i>
			</a>
		</div>
	</div>
</div>
<div class="row">
<div class="col-md-6 col-sm-6">
	<div class="portlet light bordered">
		<div class="portlet-title">
			<div class="caption">
				<i class="icon-bar-chart font-green-sharp"></i>
				<span class="caption-subject font-green-sharp">站点用户访问来源</span>
			</div>
		</div>
		<div class="portlet-body">
			<div id="echarts1" style="width: 100%;height: 328px;"></div>
		</div>
	</div>
	<script type="text/javascript">
	 	// 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('echarts1'));
	 	
 		// 指定图表的配置项和数据
		var option = {
		    title : {
		        text: '站点用户访问来源',
		        subtext: '纯属虚构',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
		    },
		    series : [
		        {
		            name: '访问来源',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:335, name:'直接访问'},
		                {value:310, name:'邮件营销'},
		                {value:234, name:'联盟广告'},
		                {value:135, name:'视频广告'},
		                {value:1548, name:'搜索引擎'}
		            ],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
		
		// 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
	</script>
</div>
<div class="col-md-6 col-sm-6">
	<div class="portlet light bordered">
		<div class="portlet-title">
			<div class="caption">
				<i class="icon-share font-blue-steel"></i>
				<span class="caption-subject font-blue-steel ">新闻动态</span>
			</div>
			<div class="actions">
				<div class="btn-group">
					<a class="btn btn-sm btn-default btn-circle" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					筛选 <i class="fa fa-angle-down"></i>
					</a>
					<div class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
						<label><input type="checkbox"/> Finance</label>
						<label><input type="checkbox" checked=""/> Membership</label>
						<label><input type="checkbox"/> Customer Support</label>
						<label><input type="checkbox" checked=""/> HR</label>
						<label><input type="checkbox"/> System</label>
					</div>
				</div>
			</div>
		</div>
		<div class="portlet-body">
			<div class="scroller" style="height: 300px;" data-always-visible="1" data-rail-visible="0">
				<ul class="feeds">
					<li>
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-info">
										<i class="fa fa-check"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 You have 4 pending tasks. <span class="label label-sm label-warning ">
										Take action <i class="fa fa-share"></i>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 Just now
							</div>
						</div>
					</li>
					<li>
						<a href="javascript:;">
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-success">
										<i class="fa fa-bar-chart-o"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 Finance Report for year 2013 has been released.
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 20 mins
							</div>
						</div>
						</a>
					</li>
					<li>
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-danger">
										<i class="fa fa-user"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 You have 5 pending membership that requires a quick review.
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 24 mins
							</div>
						</div>
					</li>
					<li>
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-info">
										<i class="fa fa-shopping-cart"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 New order received with <span class="label label-sm label-success">
										Reference Number: DR23923 </span>
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 30 mins
							</div>
						</div>
					</li>
					<li>
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-success">
										<i class="fa fa-user"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 You have 5 pending membership that requires a quick review.
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 24 mins
							</div>
						</div>
					</li>
					<li>
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-default">
										<i class="fa fa-bell-o"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 Web server hardware needs to be upgraded. <span class="label label-sm label-default ">
										Overdue </span>
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 2 hours
							</div>
						</div>
					</li>
					<li>
						<a href="javascript:;">
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-default">
										<i class="fa fa-briefcase"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 IPO Report for year 2013 has been released.
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 20 mins
							</div>
						</div>
						</a>
					</li>
					<li>
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-info">
										<i class="fa fa-check"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 You have 4 pending tasks. <span class="label label-sm label-warning ">
										Take action <i class="fa fa-share"></i>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 Just now
							</div>
						</div>
					</li>
					<li>
						<a href="javascript:;">
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-danger">
										<i class="fa fa-bar-chart-o"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 Finance Report for year 2013 has been released.
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 20 mins
							</div>
						</div>
						</a>
					</li>
					<li>
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-default">
										<i class="fa fa-user"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 You have 5 pending membership that requires a quick review.
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 24 mins
							</div>
						</div>
					</li>
					<li>
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-info">
										<i class="fa fa-shopping-cart"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 New order received with <span class="label label-sm label-success">
										Reference Number: DR23923 </span>
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 30 mins
							</div>
						</div>
					</li>
					<li>
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-success">
										<i class="fa fa-user"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 You have 5 pending membership that requires a quick review.
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 24 mins
							</div>
						</div>
					</li>
					<li>
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-warning">
										<i class="fa fa-bell-o"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 Web server hardware needs to be upgraded. <span class="label label-sm label-default ">
										Overdue </span>
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 2 hours
							</div>
						</div>
					</li>
					<li>
						<a href="javascript:;">
						<div class="col1">
							<div class="cont">
								<div class="cont-col1">
									<div class="label label-sm label-info">
										<i class="fa fa-briefcase"></i>
									</div>
								</div>
								<div class="cont-col2">
									<div class="desc">
										 IPO Report for year 2013 has been released.
									</div>
								</div>
							</div>
						</div>
						<div class="col2">
							<div class="date">
								 20 mins
							</div>
						</div>
						</a>
					</li>
				</ul>
			</div>
			<div class="scroller-footer">
				<div class="btn-arrow-link pull-right">
					<a href="javascript:;">See All Records</a>
					<i class="icon-arrow-right"></i>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>