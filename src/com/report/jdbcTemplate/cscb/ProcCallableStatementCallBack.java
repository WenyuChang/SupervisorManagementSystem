package com.report.jdbcTemplate.cscb;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;

public class ProcCallableStatementCallBack implements CallableStatementCallback {
	
	private int len;

    public ProcCallableStatementCallBack(int len){
    	super();
        this.len = len;
    }

	public Object doInCallableStatement(CallableStatement cstmt) throws DataAccessException, SQLException {
		List<List<String>> results = new ArrayList<List<String>>();
		List<String> item = new ArrayList<String>();
		cstmt.execute();
//		System.out.println("cstmt:  " + cstmt);
      
		ResultSet rs = null;
		rs = (ResultSet) cstmt.getObject(len+1);//根据存储过程输出参数的顺序获得值，从1开始，存储过程返回的结果集可以是多个
        
		Map eachRow = null;
		if (rs != null){
//		    System.out.println("columnCount = " + rs.getMetaData().getColumnCount() + " row:" + rs.getRow());/////////////
			while (rs.next()) {
				int columnCount = rs.getMetaData().getColumnCount();
//				System.out.println("rs columnCount" + columnCount);/////////
				for(int i = 1; i <= columnCount; i++) {
					item.add(rs.getString(i));
//					System.out.println("i = " + i +"  getString = " + rs.getString(i));////////////
				}
				results.add(item);
				item = new ArrayList<String>();
			}
		}
//		System.out.println(results);///////////////
		return results;
	}
}
