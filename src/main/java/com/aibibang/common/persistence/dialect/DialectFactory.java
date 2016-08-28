package com.aibibang.common.persistence.dialect;

import java.sql.Connection;
import java.sql.DatabaseMetaData;

import com.aibibang.common.persistence.dialect.db.DB2Dialect;
import com.aibibang.common.persistence.dialect.db.DerbyDialect;
import com.aibibang.common.persistence.dialect.db.H2Dialect;
import com.aibibang.common.persistence.dialect.db.HSQLDialect;
import com.aibibang.common.persistence.dialect.db.MySQLDialect;
import com.aibibang.common.persistence.dialect.db.OracleDialect;
import com.aibibang.common.persistence.dialect.db.PostgreSQLDialect;
import com.aibibang.common.persistence.dialect.db.SQLServer2005Dialect;
import com.aibibang.common.persistence.dialect.db.SybaseDialect;

/**
 * 数据库方言工厂,产生方言对象
 * 
 * @author King
 * 
 **/
public class DialectFactory {
	
    public static Dialect getDialect(Connection connection) {
        
    	Dialect dialect = null;
    	
    	try {
			
    		DatabaseMetaData md = connection.getMetaData();
            String dbType = md.getDatabaseProductName().toLowerCase();
            if ("db2".equals(dbType)){
            	dialect = new DB2Dialect();
            }else if("derby".equals(dbType)){
            	dialect = new DerbyDialect();
            }else if("h2".equals(dbType)){
            	dialect = new H2Dialect();
            }else if("hsql".equals(dbType)){
            	dialect = new HSQLDialect();
            }else if("mysql".equals(dbType)){
            	dialect = new MySQLDialect();
            }else if("oracle".equals(dbType)){
            	dialect = new OracleDialect();
            }else if("postgre".equals(dbType)){
            	dialect = new PostgreSQLDialect();
            }else if("mssql".equals(dbType) || "sqlserver".equals(dbType)){
            	dialect = new SQLServer2005Dialect();
            }else if("sybase".equals(dbType)){
            	dialect = new SybaseDialect();
            }
            if (dialect == null) {
                throw new RuntimeException("mybatis dialect error.");
            }
		} catch (Exception e) {
			
			e.printStackTrace();
		}
    	
        return dialect;
    }
}
