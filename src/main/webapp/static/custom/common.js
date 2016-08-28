$(function(){
	// 设置jQuery Ajax全局的参数  
	$.ajaxSetup({  
	    type: "POST",  
	    error: function(jqXHR, textStatus, errorThrown){  
	        switch (jqXHR.status){  
	            case(500):  
	                alert("服务器系统内部错误");
	                break;  
	            case(401):  
	                alert("未登录");  
	            	window.location.href = webRoot;
	                break;  
	            case(403):  
	                alert("无权限执行此操作");
	            case(404):  
	                alert("找不到处理的方法");
	                break;  
	            case(408):  
	                alert("请求超时");
	                break;
	            case(518):
	            	alert("登录超时");
	            	window.location.href = webRoot;
	            	break;
	            default:  
	                alert("未知错误");  
	        }  
	    } 
	});
	// 点击表头排序
	$('th[class^=sorting]').click(function(){
		var className = $(this).attr('class');
		var sort = $(this).attr('title');
		if(sort != ''){
			$(this).parent().find('th').removeClass();
			if(className == 'sorting'){
				$(this).addClass('sorting_asc');
				sort += ' asc';
			}
			else if(className == 'sorting_asc'){
				$(this).addClass('sorting_desc');
				sort += ' desc';
			}
			else if(className == 'sorting_desc'){
				$(this).addClass('sorting_asc');
				sort += ' asc';
			}
			var url = $('.panel-search form').attr('action');
			if(url.indexOf('?') > -1){
				url += '&sort=' + sort;
			}
			else{
				url += '?sort=' + sort;
			}
			$.ajax({
				type: 'post',
				url: webRoot+url,
				data: $('.panel-search form').serialize(),
				dataType: 'html',
				success: function(data){
					$(".panel-content").html(data);
				}
			});
		}
	});
});
/**
 * 菜单跳转
 * @param obj 菜单本身(A标签)
 * @param url 菜单访问地址
 */
function menu(obj,url){
	
	$('.page-sidebar-menu li').removeClass('active');
	rootliActive(obj);
	$(obj).parent().addClass('active');
	
	var header = '<li><i class="fa fa-home">&nbsp;</i></li>' + getHeader(obj,'','');
	
	$.ajax({
		type: 'post',
		url: webRoot+url,
		dataType: 'html',
		success: function(data){
			$('.page-title').html($(obj).find('.title').text());
			$('.content-header').html(header);
			$('.content-panel').html(data);
		}
	});
}
/**
 * 当前菜单的根目录选中
 * @param obj
 */
function rootliActive(obj){
	if($(obj).parent().parent().attr('class') == 'sub-menu'){
		rootliActive($(obj).parent().parent().prev());
	}
	else{
		$(obj).parent().addClass('active');
		$(obj).parent().find('.title').after('<span class="selected"></span>');
	}
}
/**
 * 初始化页面的头
 * @param obj 
 * @param header
 * @param fa
 * @returns {String}
 */
function getHeader(obj,header,fa){
	
	var title = '<li><span>' + $(obj).find('.title').text() + '</span>' + fa + '</li>' + header;
	
	if($(obj).parent().parent().attr('class') == 'sub-menu'){
		
		return getHeader($(obj).parent().parent().prev(), title, '<i class="fa fa-angle-right"></i>');
	}
	else{
		
		return title;
	}
}
/**
 * 分页查询
 * @param pageNo 页码
 */
function page(pageNo){
	var url = $('.panel-search form').attr('action');
	if(url.indexOf('?') > -1){
		url += '&pageNo=' + pageNo;
	}
	else{
		url += '?pageNo=' + pageNo;
	}
	$.ajax({
		type: 'post',
		url: webRoot+url,
		data: $('.panel-search form').serialize(),
		dataType: 'html',
		success: function(data){
			$(".panel-content").html(data);
		}
	});
}
/**
 * 查询
 */
function search(){
	$.ajax({
		type: 'post',
		url: webRoot+$('.panel-search form').attr('action'),
		data: $('.panel-search form').serialize(),
		dataType: 'html',
		success: function(data){
			$(".panel-content").html(data);
		}
	});
}
/**
 * 重置
 */
function reset(){
	$('.panel-search form')[0].reset();
	search();
}
/**
 * 新增
 * @param url 新增请求路径
 */
function add(url){
	$.ajax({
		type: 'post',
		url: webRoot+url,
		dataType: 'html',
		success: function(data){
			$(".panel-search").hide();
			$(".panel-content").html(data);
		}
	});
}
/**
 * 修改
 * @param url 修改请求路径
 */
function update(url){
	$.ajax({
		type: 'post',
		url: webRoot+url,
		dataType: 'html',
		success: function(data){
			$(".panel-search").hide();
			$(".panel-content").html(data);
		}
	});
}
/**
 * 保存
 * @param obj 保存按钮（按钮需要在form表单中）
 */
function save(obj){
	if($(obj).closest('form').valid()){
		$.ajax({
			type: 'post',
			url: webRoot+$(obj).closest('form').attr('action'),
			data: $(obj).closest('form').serialize(),
			dataType: 'json',
			success: function(data){
				alert(messages[data.result]);
				search();
				$(".panel-search").show();
			}
		});
	}
}
/**
 * 取消返回
 */
function cancel(){
	search();
	$(".panel-search").show();
}
/**
 * 删除
 * @param url 删除请求路径
 * @param message 删除前提示信息
 * @returns
 */
function del(url){
	if(confirm(messages.delete_confirm)){
		$.ajax({
			type: 'post',
			url: webRoot+url,
			dataType: 'json',
			success: function(data){
				alert(messages[data.result]);
				search();
			}
		});
	}
}
/**
 * ajax 提交
 * @param url 请求路径
 * @param isRefreshList 是否刷新列表
 */
function ajaxSubmit(url,isRefreshList){
	$.ajax({
		type: 'post',
		url: webRoot+url,
		dataType: 'json',
		success: function(data){
			alert(messages[data.result]);
			if(isRefreshList){
				search();
			}
		}
	});
}