package com.report.jdbcTemplate.csc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import oracle.jdbc.driver.OracleTypes;

import org.springframework.jdbc.core.CallableStatementCreator;

public class ProcCallableStatementCreator implements CallableStatementCreator {
     private String procStr;
     private String[] params;

     public ProcCallableStatementCreator(String procStr,String[] params){
          this.procStr = procStr;
          this.params = params;
     }
     //确保存储过程仅最后一个参数是out属性，且是游标类型
     public CallableStatement createCallableStatement(Connection conn) throws SQLException {
          CallableStatement cstmt = null;
          cstmt = conn.prepareCall(procStr);
          int i = 0;
          int len = 0;
          if(params!=null)
          {
        	  len = params.length;
          }
          for(i=0;i<len;i++)
          {
//        	  cstmt.setInt(i+1, Integer.parseInt(params[i]));
        	  cstmt.setObject(i+1, params[i]);
//        	  System.out.println(params[i]);
        	  if(params[i]=="")
        	  {
        		  System.out.println("null");
        	  }
          }
          cstmt.registerOutParameter(i+1, OracleTypes.CURSOR);
          return cstmt;
     }
}

