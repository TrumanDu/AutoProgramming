package com.aibibang.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.aibibang.common.model.UploadModel;

public class UploadUtils {

	/**
	 * 文件上传目录
	 */
	public static final String PATH_UPLOAD = "upload";
	/**
	 * 图片上传目录
	 */
	public static final String PATH_IMAGES = "images";
	/**
	 * 模板根目录
	 */
	public static final String PATH_TEMPLATE = "template";
	/**
	 * 导出文件目录
	 */
	public static final String PATH_EXPORT = "export";
	
	/**
	 * 获取服务器上传根目录（绝对路径,用于附件的存储）
	 * @return
	 */
	public static String getServerUploadBasePath(String subdirectory){
		
		String path = ResourceUtils.getConfigByName("upload_base_path") + "/" + subdirectory + "/";
		
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();// 创建目录
		}
		
		return path;
	}
	
	/**
	 * 获取项目的根目录
	 * @param subdirectory  子目录
	 * @return
	 */
	public static String getProjectUploadBasePath(String subdirectory){
		
		String path = ContextHolderUtil.getSession().getServletContext().getRealPath("/") + subdirectory + "/";
		
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();// 创建目录
		}
		
		return path;
	}
	
	/**
	 * 获取文件名称
	 * @param filePath
	 * @return
	 */
	public static String getFileName(String filePath){
		
		if(StringUtils.isNotEmpty(filePath)){
			
			String fileName = filePath;
			
			if(filePath.contains("/")){
				
				fileName = filePath.substring(filePath.lastIndexOf("/")+1);
			}
			
			if(fileName.contains("_")){
				fileName = fileName.substring(fileName.indexOf("_")+1);
			}
			
			return fileName;
		}

		return null;
	}
	
	/**
	 * 上传文件不用保存路径(主要用于导入数据)
	 * @param request
	 * @param basePath
	 * @return
	 * @throws Exception
	 */
	public static UploadModel getPathByUploadFile(HttpServletRequest request,UploadModel model) throws Exception {
		
		List<String> filePathList = new ArrayList<String>();
		
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		
		if(multipartResolver.isMultipart(request)){
			
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			
			Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
			
			if(fileMap != null && fileMap.size() > 0){
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				
				String relativePath = sdf.format(new Date()) + "/";
				
				File file = new File(model.getBasePath() + relativePath);
				if (!file.exists()) {
					file.mkdirs();// 创建目录
				}
				
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
				
				// 上传文件
				for(Map.Entry<String, MultipartFile> entity : fileMap.entrySet()){
					
					MultipartFile mfile = entity.getValue();
					
					if(!mfile.isEmpty()){
						
						// 文件扩展名验证
						String ext = FileUtils.getExtend(mfile.getOriginalFilename());
						if(StringUtils.isNotEmpty(model.getExts()) && !model.getExts().contains(ext)){
							model.setSuccess(false);
							model.setMessage("file_error_format");
							
							return model;
						}
						
						// 文件大小验证
						if(mfile.getSize() > model.getMaxSize()){
							model.setSuccess(false);
							model.setMessage("file_too_large");
							
							return model;
						}
						
						String fileName = sdf1.format(new Date()) + ResourceUtils.getUUID() + "."
							+ FileUtils.getExtend(mfile.getOriginalFilename());
						String filePath = model.getBasePath() + relativePath + fileName;
						
						FileCopyUtils.copy(mfile.getBytes(), new File(filePath));
						
						filePathList.add(relativePath + fileName);
					}
				}
			}
			
			model.setFilePaths(filePathList);
		}
		
		return model;
	}
	
	/**
	 * 上传文件并封装对象(用于路径存储到对象的某个属性中，其他表单属性也封装到对象中)
	 * @param request
	 * @param basePath
	 * @return
	 * @throws Exception
	 */
	public static UploadModel uploadFileSealedObject(HttpServletRequest request,UploadModel model) throws Exception {
		
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		
		if(multipartResolver.isMultipart(request)){
			
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			
			Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
			
			if(fileMap != null && fileMap.size() > 0){
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				
				String relativePath = sdf.format(new Date()) + "/";
				
				File file = new File(model.getBasePath() + relativePath);
				if (!file.exists()) {
					file.mkdirs();// 创建目录
				}
				
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
				
				// 上传文件
				for(Map.Entry<String, MultipartFile> entity : fileMap.entrySet()){
					
					MultipartFile mfile = entity.getValue();
					
					if(!mfile.isEmpty()){
						
						// 文件扩展名验证
						String ext = FileUtils.getExtend(mfile.getOriginalFilename());
						if(StringUtils.isNotEmpty(model.getExts()) && !model.getExts().contains(ext)){
							model.setSuccess(false);
							model.setMessage("file_error_format");
							
							return model;
						}
						
						// 文件大小验证
						if(mfile.getSize() > model.getMaxSize()){
							model.setSuccess(false);
							model.setMessage("file_too_large");
							
							return model;
						}
						
						String fileName = sdf1.format(new Date()) + ResourceUtils.getUUID() + "."
							+ FileUtils.getExtend(mfile.getOriginalFilename());
						String filePath = model.getBasePath() + relativePath + fileName;
						
						FileCopyUtils.copy(mfile.getBytes(), new File(filePath));
						
						ReflectUtils.invokeSetMethod(model.getObject(), entity.getKey(), relativePath + fileName);
						ReflectUtils.invokeSetMethod(model.getObject(), entity.getKey()+"Name", mfile.getOriginalFilename());
					}
				}
			}
		}
		
		// 获取除文件其他的表单属性，并封装到对象中
		Enumeration<String> enumeration = request.getParameterNames();
		while(enumeration.hasMoreElements()){
			String name = enumeration.nextElement();
		    String value = request.getParameter(name);
		    if("id".equals(name)&&"".equals(value))continue;
		    ReflectUtils.invokeSetMethod(model.getObject(), name, value);
		}
		
		return model;
	}
	
	/**
	 * 下载文件
	 * @param filePath
	 * @param response
	 * @throws Exception
	 */
	public static void downloadFile(String filePath,HttpServletResponse response) throws Exception{
		
		String fileName = getFileName(filePath);
		Long fileLength = new File(filePath).length();
		
		BufferedInputStream in = null;
		BufferedOutputStream out = null;
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/x-msdownload;");
			response.setHeader("Content-disposition", "attachment; filename=" + new String((fileName).getBytes("GBK"), "ISO8859-1"));
			response.setContentLength(fileLength.intValue());
			
			in = new BufferedInputStream(new FileInputStream(filePath));
			
			out = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = in.read(buff, 0, buff.length))) {
				out.write(buff, 0, bytesRead);
			}
			
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (in != null) {
					in.close();
				}
				if (out != null) {
					out.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
}
