package com.report.dao.impl;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.CallableStatement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.CallableStatementCreator;

import com.report.dao.ReportDao;
import com.report.jdbcTemplate.csc.*;
import com.report.jdbcTemplate.cscb.*;

public class ReportDaoImpl implements ReportDao {
	
	private JdbcTemplate jdbcTemplate;	
	

	@SuppressWarnings("unchecked")
	public List<List<String>> showReportResult(String query, String[] parameters) {
		List<List<String>> matches = jdbcTemplate.query(query, parameters,
				new RowMapper() {
			public List<String> mapRow(ResultSet rs, int rowNum) throws SQLException,
			DataAccessException{
//				String stemp;
				List<String> item = new ArrayList<String>();
				//get column count
				int columnCount = rs.getMetaData().getColumnCount();	
				
				for (int i = 1; i <= columnCount; i++) {
//					stemp = rs.getString(i);
					//stemp = new String(stemp.getBytes("iso-8859-1"),"utf-8");
					item.add(rs.getString(i));
				}
				
				return item;
			}
		});
		return matches;			
	}
	
	@SuppressWarnings("unchecked")
	public List<List<String>> executeProc(String procedure,String[] parameters) {
		ProcCallableStatementCreator csc = new ProcCallableStatementCreator(procedure,parameters);
//	    String[] params = {"Admin","admin"};
//	    ProcCallableStatementCreator csc = new ProcCallableStatementCreator(procedure,params);
		int paramlen = (parameters==null) ? 0 : parameters.length;
//		System.out.println(paramlen);
		ProcCallableStatementCallBack cscb = new ProcCallableStatementCallBack(paramlen);
		List<List<String>> matches = (List<List<String>>)jdbcTemplate.execute(csc, cscb);
		return matches;	
	}
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	@SuppressWarnings("unchecked")
	public List<List<String>> reportUpdate(String update, String[] parameters) {
		//方法1 使用jdbcTemplate.update()
		List<List<String>> matches = new ArrayList();
		List<String> item = new ArrayList<String>();
//		System.out.println("in reportUpdate");/////////////////////////
		int ret = jdbcTemplate.update(update, parameters);
//		System.out.println("ret = " + ret + " updateSql = " + update + " param = " + parameters[0]);//////////
		item.add(Integer.toString(ret));
		matches.add(item);
		/*方法2 使用jdbcTemplate.execute()
		UpdateCallableStatementCreator csc = new UpdateCallableStatementCreator(update,parameters);
		int paramlen = (parameters==null) ? 0 : parameters.length;
		System.out.println(paramlen);
		UpdateCallableStatementCallBack cscb = new UpdateCallableStatementCallBack(paramlen);
		List<List<String>> matches = (List<List<String>>)jdbcTemplate.execute(csc, cscb);
		 */
		return matches;	
	}
}
