package com.aibibang.common.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 验证工具类
 * 
 * @author King
 *
 */
public class ValidateUtils{

	
	public static boolean isEmpty(Object object) {
		if (object == null) {
			return (true);
		}
		if (object.equals("")) {
			return (true);
		}
		if (object.equals("null")) {
			return (true);
		}
		return (false);
	}
	
	public static boolean isNotEmpty(Object object) {
		if (object != null && !object.equals("") && !object.equals("null")) {
			return (true);
		}
		return (false);
	}
	
	/**
	 * java去除字符串中的空格、回车、换行符、制表符
	 * 
	 * @param str
	 * @return
	 */
	public static String replaceBlank(String str) {
		String dest = "";
		if (str != null) {
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			Matcher m = p.matcher(str);
			dest = m.replaceAll("");
		}
		return dest;

	}
	
}
