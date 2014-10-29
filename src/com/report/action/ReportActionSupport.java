package com.report.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.report.dao.ReportDao;
import com.opensymphony.xwork2.ActionSupport;

public abstract class ReportActionSupport extends ActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ReportDao report;
	private String query;
	private String update;
	private String procedure;
	private List<String> parameters;
	
	protected Map<String, String> paraMap = new HashMap<String, String>();	
	private List<List<String>> result;
	
	public String execute() {
		return SUCCESS;
	}
	
	public String Query() {
		result = report.showReportResult(query, getParas());		
		return SUCCESS;
	}
	
	public String Update() {
		result = report.reportUpdate(update, getParas());
		return SUCCESS;
	}
	
	public String doProc() {
		result = report.executeProc(procedure, getParas());
//		System.out.println("ON doProc" + procedure);
		return SUCCESS;
	}
	
	public String doProcTest() {
		result = report.executeProc(procedure, getParas());
		Object aa = result.get(0);
		String bb = aa.toString();
		String cc = bb.substring(1, bb.length()-2);
		String[] dd = cc.split(",");
		String ee = dd[4].trim();
		return ee;
	}
	
	public abstract void setParas();
	
	private String[] getParas() {
		setParas();
		if (parameters == null)
			return null;
		int count = parameters.size();
		
		String[] str = new String[count];
		for (int i = 0; i < count; i++) {
			str[i] = paraMap.get(parameters.get(i));
		}
		return str;		
	}

	public ReportDao getReport() {
		return report;
	}

	public void setReport(ReportDao report) {
		this.report = report;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public List<String> getParameters() {
		return parameters;
	}

	public void setParameters(List<String> parameters) {
		this.parameters = parameters;
	}

	public Map<String, String> getParaMap() {
		return paraMap;
	}

	public void setParaMap(Map<String, String> paraMap) {
		this.paraMap = paraMap;
	}

	public List<List<String>> getResult() {
		return result;
	}

	public void setResult(List<List<String>> result) {
		this.result = result;
	}

	public String getProcedure() {
		return procedure;
	}

	public void setProcedure(String procedure) {
		this.procedure = procedure;
	}

	public String getUpdate() {
		return update;
	}

	public void setUpdate(String update) {
		this.update = update;
	}

}
