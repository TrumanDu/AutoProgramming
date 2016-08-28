package com.aibibang.common.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.apache.log4j.Logger;

/**
 * 通过反射机制给对象赋值
 * 
 * @author King
 *
 */
public class ReflectUtils {

	private static Logger logger = Logger.getLogger(ReflectUtils.class);
	
	private static final String SETTER_PREFIX = "set";

	/**
	 * 调用对象的set方法，无set方法跳过不赋值
	 * @param obj
	 * @param propertyName
	 * @param value
	 */
	public static void invokeSetMethod(Object obj, String propertyName, Object value) throws Exception {
		
		Validate.notNull(obj, "object can't be null");
		Validate.notBlank(propertyName, "fieldName can't be blank");
		Field field = null;
		
		for (Class<?> superClass = obj.getClass(); superClass != Object.class; superClass = superClass.getSuperclass()) {
			try {
				field = superClass.getDeclaredField(propertyName);
			} catch (NoSuchFieldException e) {
				// Field不在当前类定义,继续向上转型
				continue;
			}
		}
		
		if(field != null){
			
			String setterMethodName = SETTER_PREFIX + StringUtils.capitalize(propertyName);
			Validate.notNull(obj, "object can't be null");
			Validate.notBlank(setterMethodName, "methodName can't be blank");

			Method setMethod = null;
			
			for (Class<?> searchType = obj.getClass(); searchType != Object.class; searchType = searchType.getSuperclass()) {
				Method[] methods = searchType.getDeclaredMethods();
				for (Method method : methods) {
					if (method.getName().equals(setterMethodName)) {
						setMethod =  method;
						break;
					}
				}
			}
			
			if(setMethod != null){
				try {
					
					String fieldType = field.getType().getSimpleName();
					
					String valueStr = String.valueOf(value);
					
                    if ("String".equals(fieldType)) {  
                    	setMethod.invoke(obj, valueStr);  
                    } else if ("Date".equals(fieldType)) {  
                        Date temp = parseDate(valueStr);  
                        setMethod.invoke(obj, temp);  
                    } else if ("BigDecimal".equalsIgnoreCase(fieldType)) {  
                    	BigDecimal temp = new BigDecimal(valueStr);
                        setMethod.invoke(obj, temp);  
                    } else if ("Integer".equals(fieldType) || "int".equals(fieldType)) {  
                        Integer intval = Integer.parseInt(valueStr);  
                        setMethod.invoke(obj, intval);  
                    } else if ("Long".equalsIgnoreCase(fieldType) || "long".equals(fieldType)) {
                        Long temp = Long.parseLong(valueStr);
                        setMethod.invoke(obj, temp);  
                    } else if ("Double".equalsIgnoreCase(fieldType) || "double".equals(fieldType)) {
                        Double temp = Double.parseDouble(valueStr);  
                        setMethod.invoke(obj, temp);
                    } else if ("Float".equalsIgnoreCase(fieldType) || "float".equals(fieldType)) {
                    	Float temp = Float.parseFloat(valueStr);  
                        setMethod.invoke(obj, temp);  
                    } else if ("Boolean".equalsIgnoreCase(fieldType) || "boolean".equals(fieldType)) {  
                        Boolean temp = Boolean.parseBoolean(valueStr);  
                        setMethod.invoke(obj, temp);  
                    } else {  
                    	logger.error("not supper type" + fieldType);  
                    }  
				} catch (Exception e) {
					throw  convertReflectionExceptionToUnchecked(e);
				}
			}
			
		}
		
	}
	
	 /** 
     * 格式化string为Date 
     * @param datestr 
     * @return date 
     */ 
    private static Date parseDate(String datestr) {  
        if (null == datestr || "".equals(datestr)) {  
            return null;  
        }  
        try {  
            String fmtstr = null;
            if (datestr.contains(":") && datestr.contains("-")) {  
                fmtstr = "yyyy-MM-dd HH:mm:ss";  
            } else if(datestr.contains(":") && datestr.contains("/")) {  
            	fmtstr = "yyyy/MM/dd HH:mm:ss";
            } else if(datestr.contains("-")){
            	fmtstr = "yyyy-MM-dd";  
            } else if(datestr.contains("/")){
            	fmtstr = "yyyy/MM/dd";  
            }
            
            if(fmtstr != null){
            	SimpleDateFormat sdf = new SimpleDateFormat(fmtstr, Locale.UK);  
                return sdf.parse(datestr);
            } else {
            	return null;
            }
        } catch (Exception e) {  
            return null;  
        }  
    }  
	
	/**
	 * 将反射时的checked exception转换为unchecked exception.
	 */
	public static RuntimeException convertReflectionExceptionToUnchecked(Exception e) {
		if (e instanceof IllegalAccessException || e instanceof IllegalArgumentException
				|| e instanceof NoSuchMethodException) {
			return new IllegalArgumentException(e);
		} else if (e instanceof InvocationTargetException) {
			return new RuntimeException(((InvocationTargetException) e).getTargetException());
		} else if (e instanceof RuntimeException) {
			return (RuntimeException) e;
		}
		return new RuntimeException("Unexpected Checked Exception.", e);
	}
}
