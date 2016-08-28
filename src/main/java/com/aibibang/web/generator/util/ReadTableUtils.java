package com.aibibang.web.generator.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.aibibang.web.generator.entity.CgColumnConfig;
import com.aibibang.web.generator.entity.CgDataSource;

public class ReadTableUtils {
	
	private static final Logger logger = Logger.getLogger(ReadTableUtils.class);
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	private String sql;
	  
	public List<String> readAllTableNames(CgDataSource dataSource) throws Exception {
	
		List<String> tableNames = new ArrayList<String>();
		
		try {
			
			Class.forName(dataSource.getDiverName());
			this.conn = DriverManager.getConnection(dataSource.getUrl(), dataSource.getUsername(), dataSource.getPassword());
		    this.stmt = this.conn.createStatement(1005, 1007);
			
		    if("mysql".equals(dataSource.getDatabaseType())) {
		    	this.sql = MessageFormat.format("select distinct table_name from information_schema.columns where table_schema = {0}", new Object[] { "'"+dataSource.getDatabaseName()+"'" });
		    }
		    else if("oracle".equals(dataSource.getDatabaseType())) {
		        this.sql = " select distinct colstable.table_name as  table_name from user_tab_cols colstable";
		    }	
		    else if("sqlserver".equals(dataSource.getDatabaseType())) {
		        this.sql = "select distinct c.name as  table_name from sys.objects c ";
		    }
		    
		    this.rs = this.stmt.executeQuery(this.sql);
		    while (this.rs.next()) {
		    	String tableName = this.rs.getString(1);
		        tableNames.add(tableName);
		    }
		    
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			throw e;
		} finally {
			try {
				if (this.stmt != null) {
					this.stmt.close();
					this.stmt = null;
					System.gc();
		        }
		        if (this.conn != null) {
		        	this.conn.close();
		        	this.conn = null;
		        	System.gc();
		        }
			} catch (SQLException e) {
				logger.error(e.getMessage(),e);
		    }
		}
		
		return tableNames;
	}
	
	public List<CgColumnConfig> readTableColumn(CgDataSource dataSource,String tableName) throws Exception {
		
		List<CgColumnConfig> columnList = new ArrayList<CgColumnConfig>();
		
		try {
			
			Class.forName(dataSource.getDiverName());
			this.conn = DriverManager.getConnection(dataSource.getUrl(), dataSource.getUsername(), dataSource.getPassword());
		    this.stmt = this.conn.createStatement(1005, 1007);
		    
		    if("mysql".equals(dataSource.getDatabaseType())) {
		        this.sql = MessageFormat.format("select column_name,data_type,column_comment,numeric_precision,numeric_scale,character_maximum_length,is_nullable nullable from information_schema.columns where table_name = {0} and table_schema = {1}", new Object[] { "'"+tableName+"'", "'"+dataSource.getDatabaseName()+"'"});
		    }
		    else if("oracle".equals(dataSource.getDatabaseType())) {
		    	this.sql = MessageFormat.format(" select colstable.column_name column_name, colstable.data_type data_type, commentstable.comments column_comment, colstable.Data_Precision column_precision, colstable.Data_Scale column_scale,colstable.Char_Length,colstable.nullable from user_tab_cols colstable  inner join user_col_comments commentstable  on colstable.column_name = commentstable.column_name  where colstable.table_name = commentstable.table_name  and colstable.table_name = {0}", new Object[] { "'"+tableName+"'" });
		    }
		    else if("sqlserver".equals(dataSource.getDatabaseType())) {
		        this.sql = MessageFormat.format("select cast(a.name as varchar(50)) column_name,  cast(b.name as varchar(50)) data_type,  cast(e.value as varchar(200)) comment,  cast(ColumnProperty(a.object_id,a.Name,'''Precision''') as int) num_precision,  cast(ColumnProperty(a.object_id,a.Name,'''Scale''') as int) num_scale,  a.max_length,  (case when a.is_nullable=1 then '''y''' else '''n''' end) nullable   from sys.columns a left join sys.types b on a.user_type_id=b.user_type_id left join sys.objects c on a.object_id=c.object_id and c.type='''U''' left join sys.extended_properties e on e.major_id=c.object_id and e.minor_id=a.column_id and e.class=1 where c.name={0}", new Object[] { "'"+tableName+"'" });
		    }
			
		    this.rs = this.stmt.executeQuery(this.sql);
		    
		    int orderNum = 1;
		    
		    while(this.rs.next()){
		    	
		    	String name = this.rs.getString(1).toLowerCase();
		    	String type = this.rs.getString(2);
		    	String description = this.rs.getString(3);
		    	String precision = FieldUtils.getNullString(this.rs.getString(4));
		    	String scale = FieldUtils.getNullString(this.rs.getString(5));
		    	String charmaxLength = FieldUtils.getNullString(this.rs.getString(6));
		    	String nullable = FieldUtils.getNullAble(this.rs.getString(7));
		    	
		    	CgColumnConfig column = new CgColumnConfig();
		    	column.setColumnName(name);
		    	column.setColumnType(type);
		    	column.setFieldName(FieldUtils.formatField(name));
		    	column.setFieldType(FieldUtils.formatDataType(type, precision, scale));
		    	column.setDescription(StringUtils.isEmpty(description) ? column.getFieldName() : description);
		    	column.setNullable(nullable);
		    	if(StringUtils.isNotEmpty(charmaxLength)){
		    		column.setColumnLength(Integer.valueOf(charmaxLength));
		    	}
		    	else if(StringUtils.isNotEmpty(precision)){
		    		column.setColumnLength(Integer.valueOf(precision));
		    	}
		    	
		    	column.setSort("N");
		    	column.setIsKey("N");
		    	column.setShowType("text");
		    	column.setIsQuery("N");
		    	column.setQueryModel("single");
		    	column.setQueryType("=");
	    		column.setIsShowForm("Y");
	    		column.setIsShowList("Y");
	    		column.setOrderNum(orderNum);
	    		
		    	if(("id").equals(name)){
		    		column.setIsKey("Y");
		    		column.setIsShowForm("N");
		    		column.setIsShowList("N");
		    	}
		    	
		    	columnList.add(column);
		    	orderNum++;
		    }
		    
		    if(columnList.size() == 0){
		    	throw new Exception("该表不存在或者表中没有字段");
		    }
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			throw e;
		} finally {
			try {
				if (this.stmt != null) {
					this.stmt.close();
					this.stmt = null;
					System.gc();
		        }
		        if (this.conn != null) {
		        	this.conn.close();
		        	this.conn = null;
		        	System.gc();
		        }
			} catch (SQLException e) {
				logger.error(e.getMessage(),e);
		    }
		}
		
		return columnList;
	}
}
