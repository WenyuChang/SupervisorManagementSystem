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

public class UpdateCallableStatementCallBack  implements CallableStatementCallback{
	private int len;

    public UpdateCallableStatementCallBack(int len){
    	super();
        this.len = len;
    }

	public Object doInCallableStatement(CallableStatement cstmt) throws DataAccessException, SQLException {
		List<List<String>> results = new ArrayList<List<String>>();
		List<String> item = new ArrayList<String>();
		if(cstmt.execute())
		{
//			System.out.println("OK");
			item.add("1");
		}
		else
		{
//			System.out.println("failed");
			item.add("0");
		}
		results.add(item);
		return results;
	}
}
