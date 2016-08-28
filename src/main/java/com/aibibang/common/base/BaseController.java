package com.aibibang.common.base;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.aibibang.common.constant.SessionAttr;
import com.aibibang.common.interceptor.DateConvertEditor;
import com.aibibang.common.util.ContextHolderUtil;
import com.aibibang.web.system.entity.SysUser;

/**
 * 基础controller
 * 
 * @author King
 *
 */
public class BaseController {

	/**
	 * 将前台传递过来的日期格式的字符串，自动转化为Date类型
	 * 
	 * @param binder
	 */
	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {

		binder.registerCustomEditor(Date.class, new DateConvertEditor());
	}
	
	/**
	 * 抽取由逗号分隔的主键列表
	 * 
	 * @param ids
	 * @return
	 */
	protected List<String> extractIdListByComma(String ids) {
        List<String> result = new ArrayList<String>();
        if (StringUtils.hasText(ids)) {
            for (String id : ids.split(",")) {
                if (StringUtils.hasLength(id)) {
                    result.add(id.trim());
                }
            }
        }

        return result;
    }
	
	/**
	 * 获取登录的当前用户信息
	 * 
	 * @return
	 */
	public SysUser getCurrentUser(){
		
		HttpSession session = ContextHolderUtil.getSession();
		SysUser user = (SysUser)session.getAttribute(SessionAttr.USER_LOGIN.getValue());
		
		return user;
	}
}
