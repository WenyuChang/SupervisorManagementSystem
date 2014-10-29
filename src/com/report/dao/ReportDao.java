package com.report.dao;

import java.util.List;

public interface ReportDao {
	
	/*
	 * String[] is used to pass parameters
	 */
	List<List<String>> showReportResult(String query, String[] parameters);
	
	List<List<String>> executeProc(String procedure, String[] parameters);
	
	List<List<String>> reportUpdate(String update, String[] parameters);

}
