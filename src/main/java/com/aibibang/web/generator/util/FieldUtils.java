package com.aibibang.web.generator.util;

import org.apache.commons.lang.StringUtils;

public class FieldUtils {

	public static String getNullAble(String nullable){
	    if (("YES".equals(nullable)) || ("yes".equals(nullable)) || ("y".equals(nullable)) || ("Y".equals(nullable)) || ("f".equals(nullable))) {
	      return "Y";
	    }
	    if (("NO".equals(nullable)) || ("N".equals(nullable)) || ("no".equals(nullable)) || ("n".equals(nullable)) || ("t".equals(nullable))) {
	      return "N";
	    }
	    return null;
	}
	
	public static String getNullString(String nullable){
	    if (StringUtils.isEmpty(nullable)) {
	    	return "";
	    }
	    
	    return nullable;
	}
	
	public static String formatField(String field){
		String[] strs = field.split("_");
	    field = "";
	    int m = 0; 
	    for (int length = strs.length; m < length; m++) {
	    	if (m > 0) {
	    		String tempStr = strs[m].toLowerCase();
	    		tempStr = tempStr.substring(0, 1).toUpperCase() + tempStr.substring(1, tempStr.length());

	    		field = field + tempStr;
	    	} 
	    	else {
	    		field = field + strs[m].toLowerCase();
	    	}
	    }
	    
	    return field;
	}
	
	public static String formatFieldCapital(String field){
	    String[] strs = field.split("_");
	    field = "";
	    int m = 0; 
	    for (int length = strs.length; m < length; m++) {
	    	if (m > 0) {
	    		String tempStr = strs[m].toLowerCase();
	    		tempStr = tempStr.substring(0, 1).toUpperCase() + tempStr.substring(1, tempStr.length());

	    		field = field + tempStr;
	    	} 
	    	else {
	    		field = field + strs[m].toLowerCase();
	    	}
	    }
	    field = field.substring(0, 1).toUpperCase() + field.substring(1);
	    
	    return field;
	}
	
	public static String getInitialSmall(String str){
	    if (StringUtils.isNotBlank(str)) {
	      str = str.substring(0, 1).toLowerCase() + str.substring(1);
	    }
	    
	    return str;
	}
	
	public static String formatDataType(String dataType, String precision, String scale){
		  
	    if (dataType.contains("char")){
	    	dataType = "String";
	    }
	    else if (dataType.contains("text")){
	    	dataType = "String";
	    }
	    else if (dataType.contains("bigint")){
	        dataType = "Long";
	    }
	    else if (dataType.contains("int")){
	    	dataType = "Integer";
	    }
	    else if (dataType.contains("float")){
	    	dataType = "Float";
	    }
	    else if (dataType.contains("double")){
	    	dataType = "Double";
	    }
	    else if (dataType.contains("number")) {
	    	if ((StringUtils.isNotEmpty(scale)) && (Integer.parseInt(scale) > 0))
	    		dataType = "BigDecimal";
	    	else if ((StringUtils.isNotEmpty(precision)) && (Integer.parseInt(precision) > 10)){
	    		dataType = "Long";
	    	}
	    	else{
	    		dataType = "Integer";
	    	}
	    }
	    else if (dataType.contains("decimal")){
	    	dataType = "BigDecimal";
	    }
	    else if (dataType.contains("date")){
	    	dataType = "Date";
	    }
	    else if (dataType.contains("time")){
	    	dataType = "Date";
	    } 
	    else if (dataType.contains("blob")){
	    	//dataType = "java.sql.Blob";
	    	dataType = "String";
	    }
	    else if (dataType.contains("clob")){
	    	//dataType = "java.sql.Clob";
	    	dataType = "String";
	    }
	    else if (dataType.contains("numeric")){
	    	dataType = "BigDecimal";
	    }
	    else {
	    	dataType = "java.lang.Object";;
	    }
	    
	    return dataType;
	}
	
}
