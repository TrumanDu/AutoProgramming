package com.aibibang.common.model;

import java.util.List;

public class UploadModel {

	private boolean success = true;		// 上传是否成功
	private String basePath;			// 上传文件根目录
	private String message;				// 返回信息
	private long maxSize = 1000000;		// 文件大小限制
	private String exts;				// 文件扩展名，多种以逗号分开
	private Object object;				// 被封装对象
	private List<String> filePaths;		// 文件路径集合(针对多个文件)
	
	/**
	 * 图片类型
	 */
	public static final String IMAGES = "gif,jpg,jpeg,png,bmp";
	/**
	 * flash类型
	 */
	public static final String FLASHS = "swf,flv";
	/**
	 * 视频类型
	 */
	public static final String MEDIAS = "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb";
	/**
	 * 普通文件类型
	 */
	public static final String FILES = "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2";
	
	/**
	 * 上传并封装对象模板
	 * @param basePath	文件上传根目录
	 * @param object	被封装的对象
	 */
	public UploadModel(String basePath, Object object) {
		super();
		this.basePath = basePath;
		this.object = object;
	}
	
	/**
	 * 上传并封装对象模板
	 * @param basePath	文件上传根目录
	 * @param exts		文件上传扩展名限制（多个类型用逗号分开）
	 * @param object	被封装的对象
	 */
	public UploadModel(String basePath, String exts, Object object) {
		super();
		this.basePath = basePath;
		this.exts = exts;
		this.object = object;
	}

	/**
	 * 上传并封装对象模板
	 * @param basePath	文件上传根目录
	 * @param maxSize	文件大小限制
	 * @param exts		文件上传扩展名限制（多个类型用逗号分开）
	 * @param object	被封装的对象
	 */
	public UploadModel(String basePath, long maxSize, String exts, Object object) {
		super();
		this.basePath = basePath;
		this.maxSize = maxSize;
		this.exts = exts;
		this.object = object;
	}

	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getBasePath() {
		return basePath;
	}
	public void setBasePath(String basePath) {
		this.basePath = basePath;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public long getMaxSize() {
		return maxSize;
	}
	public void setMaxSize(long maxSize) {
		this.maxSize = maxSize;
	}
	public String getExts() {
		return exts;
	}
	public void setExts(String exts) {
		this.exts = exts;
	}
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
	public List<String> getFilePaths() {
		return filePaths;
	}
	public void setFilePaths(List<String> filePaths) {
		this.filePaths = filePaths;
	}
	
	
}
