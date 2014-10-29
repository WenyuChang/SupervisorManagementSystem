package com.report.jdbcTemplate.csc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.jdbc.core.CallableStatementCreator;

import oracle.jdbc.driver.OracleTypes;

public class UpdateCallableStatementCreator  implements CallableStatementCreator {
	private String updateStr;
    private String[] params;

    public UpdateCallableStatementCreator(String updateStr,String[] params){
         this.updateStr = updateStr;
         this.params = params;
    }

    public CallableStatement createCallableStatement(Connection conn) throws SQLException {
         CallableStatement cstmt = null;
         cstmt = conn.prepareCall(updateStr);
         int i = 0;
         int len = 0;
         if(params!=null)
         {
       	  len = params.length;
         }
         for(i=0;i<len;i++)
         {
	       	  cstmt.setObject(i+1, params[i]);
//	       	  System.out.println(params[i]);
	       	  if(params[i]=="")
	       	  {
//	       		  System.out.println("null");
	       	  }
         }
         return cstmt;
    }
}
