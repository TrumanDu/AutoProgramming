package com.aibibang.common.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

/**
 * 分页工具类
 * 
 * @author King
 *
 * @param <T>
 */
public class Page<T> extends RowBounds {

	private int pageNo = 1;				// 当前页数
	private int pageSize = 10;			// 每页显示行数
	private int totalCount;				// 总行数
	private int totalPages;				// 总页数
	
	private List<T> result = new ArrayList<T>();// 查询结果
	
	private int offset;					// 偏移量 : 第一条数据在表中的位置
	private int limit;					// 限定数 : 每页的数量
	
	private int length = 8;				// 页显示数
	private String funcName	= "page";	// 点击页码调用的js函数名称，默认为page
	private int prev;					// 上一页
	private int next;					// 下一页
	
	public Page() {
		super();
		this.offset = (this.pageNo - 1) * this.pageSize;
		this.limit = this.pageSize;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		
		this.pageNo = pageNo <= 0 ? 1 : pageNo;
		this.offset = (this.pageNo - 1) * this.pageSize;
		this.limit = this.pageSize;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		
		this.totalCount = totalCount;
		
		if (totalCount < 0) {

			this.totalPages = -1;
		}

		int pages = totalCount / this.pageSize;
		
		this.totalPages = totalCount % this.pageSize > 0 ? pages + 1 : pages;
		
		this.prev = this.pageNo == 1 ? 1 : (this.pageNo - 1);
		this.next = (this.pageNo + 1) > this.totalPages ? this.totalPages : (this.pageNo + 1);
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public List<T> getResult() {
		return result;
	}
	public void setResult(List<T> result) {
		this.result = result;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public String getFuncName() {
		return funcName;
	}
	public void setFuncName(String funcName) {
		this.funcName = funcName;
	}
	public int getPrev() {
		return prev;
	}
	public void setPrev(int prev) {
		this.prev = prev;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	
	@Override
	public String toString(){
		StringBuilder sb = new StringBuilder();
		
		sb.append("<div class=\"div-left\">共&nbsp;"+this.totalCount+"&nbsp;条记录，当前显示&nbsp;");
		sb.append("<input type=\"text\" size=\"1\" value=\""+this.pageNo+"\"");
		sb.append(" onkeypress=\"var e=window.event||this;var c=e.keyCode||e.which;if(c==13)");
		sb.append(this.funcName+"(this.value);\"/>&nbsp;/&nbsp;"+this.totalPages+"&nbsp;页</div>\n");
		
		sb.append("<div class=\"div-right\">\n");
		sb.append("<ul class=\"pagination\" style=\"visibility: visible;\">\n");
		
		// 首页
		if(this.pageNo <= 1){
			sb.append("<li class=\"prev disabled\"><a href=\"javascript:\">");
			sb.append("<i class=\"fa fa-angle-double-left\"></i></a></li>\n");
			
			sb.append("<li class=\"prev disabled\"><a href=\"javascript:\">");
			sb.append("<i class=\"fa fa-angle-left\"></i></a></li>\n");
		}
		else{
			sb.append("<li class=\"prev\"><a href=\"javascript:\" ");
			sb.append("onclick=\""+this.funcName+"(1);\">");
			sb.append("<i class=\"fa fa-angle-double-left\"></i></a></li>\n");
			
			sb.append("<li class=\"prev\"><a href=\"javascript:\" ");
			sb.append("onclick=\""+this.funcName+"("+this.prev+");\">");
			sb.append("<i class=\"fa fa-angle-left\"></i></a></li>\n");
		}
		
		int begin = this.pageNo - (this.length/2);
		
		if(begin < 1){
			begin = 1;
		}
		
		int end = begin + this.length - 1;
		
		if(end >= this.totalPages){
			end = this.totalPages;
		}
		
		if(begin > 1){
			sb.append("<li class=\"disabled\"><a href=\"javascript:\">...</a></li>\n");
		}
		
		for (int i = begin; i <= end; i++) {
			if (i == this.pageNo) {
				sb.append("<li class=\"active\"><a href=\"javascript:\">"+this.pageNo+"</a></li>\n");
			} else {
				sb.append("<li><a href=\"javascript:\" onclick=\""+funcName+"("+i+");\">"+i+"</a></li>\n");
			}
		}
		
		if(end < this.totalPages){
			sb.append("<li class=\"disabled\"><a href=\"javascript:\">...</a></li>\n");
		}
		
		if(this.pageNo >= this.totalPages){
			sb.append("<li class=\"next disabled\"><a href=\"javascript:\">");
			sb.append("<i class=\"fa fa-angle-right\"></i></a></li>\n");
			
			sb.append("<li class=\"next disabled\"><a href=\"javascript:\">");
			sb.append("<i class=\"fa fa-angle-double-right\"></i></a></li>\n");
		}
		else{
			sb.append("<li class=\"next\"><a href=\"javascript:\" ");
			sb.append("onclick=\""+this.funcName+"("+this.next+");\">");
			sb.append("<i class=\"fa fa-angle-right\"></i></a></li>\n");
			
			sb.append("<li class=\"next\"><a href=\"javascript:\" ");
			sb.append("onclick=\""+this.funcName+"("+this.totalPages+");\">");
			sb.append("<i class=\"fa fa-angle-double-right\"></i></a></li>\n");
		}
		
		sb.append("</ul>\n</div>");
		
		return sb.toString();
	}
	
}
