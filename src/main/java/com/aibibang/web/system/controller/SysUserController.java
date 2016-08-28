package com.aibibang.web.system.controller;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aibibang.common.base.BaseController;
import com.aibibang.common.model.UploadModel;
import com.aibibang.common.persistence.Page;
import com.aibibang.common.util.UploadUtils;
import com.aibibang.common.util.ValidateUtils;
import com.aibibang.web.system.entity.SysRole;
import com.aibibang.web.system.entity.SysUser;
import com.aibibang.web.system.service.SysRoleService;
import com.aibibang.web.system.service.SysUserService;

import net.sf.json.JSONObject;

/**
 * 
 * 用户管理controller
 * 
 * <pre>
 * 	历史记录：
 * 	2016-07-17 21:17 King
 * 	新建文件
 * </pre>
 * 
 * @author 
 * <pre>
 * SD
 * 	King
 * PG
 *	King
 * UT
 *
 * MA
 * </pre>
 * @version $Rev$
 *
 * <p/> $Id$
 *
 */
@Controller
@RequestMapping("/user")
public class SysUserController extends BaseController {

	private Logger logger = Logger.getLogger(SysUserController.class);

	@Resource
	private SysUserService sysUserService;
	@Resource
	private SysRoleService sysRoleService;
	
	/**
	 * 
	 * <pre>
	 * 	2016-07-17 21:17 King
	 * 	初始化查询页面
	 * </pre>
	 * 
	 * @return
	 */
	@RequestMapping("/init")
	public String init(){
		
		return "system/user/userSearch";
	}
	
	/**
	 * 
	 * <pre>
	 * 	2016-07-17 21:17 King
	 * 	分页查询
	 * </pre>
	 * 
	 * @param sysUser
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public String list(SysUser sysUser,Page<SysUser> page,HttpServletRequest request){
		
		try {
			
			request.setAttribute("page", sysUserService.findByPage(sysUser, page));
		} catch (Exception e) {
		
			logger.error(e.getMessage(), e);
		}
		
		return "system/user/userList";
	}

	/**
	 * 
	 * <pre>
	 * 	2016-07-17 21:17 King
	 * 	新增修改页面初始化
	 * </pre>
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/user")
	public String user(Long id,HttpServletRequest request){
		
		try {
			
			List<Long> roleIds = null;
			
			if(ValidateUtils.isNotEmpty(id)){
				
				SysUser user = sysUserService.getById(id);
				request.setAttribute("user", user);
				
				roleIds = sysUserService.findByUserId(id);
			}
			
			List<SysRole> roleList = sysRoleService.findBySearch(new SysRole());
			if(roleIds != null){
				for(SysRole role : roleList){
					if(roleIds.contains(role.getId())){
						role.setUserHas(true);
					}
				}
			}
			
			request.setAttribute("roleList", roleList);
		} catch (Exception e) {
			
			logger.error(e.getMessage(), e);
		}
		
		return "system/user/user";
	}
	
	/**
	 * 
	 * <pre>
	 * 	2016-07-17 21:17 King
	 * 	保存
	 * </pre>
	 * 
	 * @param sysUser
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String save(HttpServletRequest request){
		
		JSONObject json = new JSONObject();
		
		try {
			
			SysUser user = new SysUser();
			UploadModel model = new UploadModel(UploadUtils.getServerUploadBasePath(UploadUtils.PATH_IMAGES), 
					UploadModel.IMAGES, user);
			UploadUtils.uploadFileSealedObject(request, model);
			
			if(model.isSuccess()){
				// 修改
				if(ValidateUtils.isNotEmpty(user.getId())){
					
					sysUserService.update(user);
				}
				// 新增
				else{
					
					sysUserService.add(user);
				}
				json.put("result", "save_success");
			}
			else{
				
				json.put("result", model.getMessage());
			}
			
		} catch (Exception e) {
			
			logger.error(e.getMessage(), e);
			json.put("result", "save_fail");
		}
		
		return json.toString();
	}
	
	/**
	 * 
	 * <pre>
	 * 	2016-07-17 21:17 King
	 * 	删除
	 * </pre>
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(Long id){
		
		JSONObject json = new JSONObject();
		
		try {
			
			sysUserService.delete(id);
			json.put("result", "delete_success");
		} catch (Exception e) {
			
			logger.error(e.getMessage(), e);
			json.put("result", "delete_fail");
		}
		
		return json.toString();
	}
	
}
