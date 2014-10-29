package com.report.action;


@SuppressWarnings("serial")
public class ReportAction extends ReportActionSupport {
	
	private String startDate;
	private String endDate;
	private String dep_no;
	private String e_name;
	private String e_passwd;
	private String t_name;
	private String t_major_dept;
	private String t_major_emp;
	private String t_begintime;
	private String t_deadline;
	private String t_assis_dept;
	private String t_state;
	private String t_id;
	private String t_desc;
	private String t_complete;
	private String t_operator;
	private String di_no;
	private String dm_no;

	@Override
	public void setParas() {
		this.paraMap.put("startDate", startDate);
		this.paraMap.put("endDate", endDate);
		this.paraMap.put("dep_no",dep_no);
        this.paraMap.put("e_name",e_name);
        this.paraMap.put("e_passwd",e_passwd);
        this.paraMap.put("t_name",t_name);
        this.paraMap.put("t_major_dept",t_major_dept);
        this.paraMap.put("t_major_emp",t_major_emp);
        this.paraMap.put("t_begintime",t_begintime);
        this.paraMap.put("t_deadline",t_deadline);
        this.paraMap.put("t_state",t_state);
        this.paraMap.put("t_id",t_id);
        this.paraMap.put("t_desc",t_desc);
        this.paraMap.put("t_complete",t_complete);
        this.paraMap.put("t_operator",t_operator);;
        this.paraMap.put("t_assis_dept",t_assis_dept);
        this.paraMap.put("di_no", di_no);
        this.paraMap.put("dm_no", dm_no);
	}

	public String getDep_no() {
		return dep_no;
	}

	public void setDep_no(String dep_no) {
		this.dep_no = dep_no;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

    public String getE_name()
    {
        return e_name;
    }

    public void setE_name(String e_name)
    {
        this.e_name = e_name;
    }

    public String getE_passwd()
    {
        return e_passwd;
    }

    public void setE_passwd(String e_passwd)
    {
        this.e_passwd = e_passwd;
    }

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getT_major_dept() {
		return t_major_dept;
	}

	public void setT_major_dept(String t_major_dept) {
		this.t_major_dept = t_major_dept;
	}

	public String getT_major_emp() {
		return t_major_emp;
	}

	public void setT_major_emp(String t_major_emp) {
		this.t_major_emp = t_major_emp;
	}

	public String getT_begintime() {
		return t_begintime;
	}

	public void setT_begintime(String t_begintime) {
		this.t_begintime = t_begintime;
	}

	public String getT_deadline() {
		return t_deadline;
	}

	public void setT_deadline(String t_deadline) {
		this.t_deadline = t_deadline;
	}

	public String getT_state() {
		return t_state;
	}

	public void setT_state(String t_state) {
		this.t_state = t_state;
	}

	public String getT_id() {
		return t_id;
	}

	public void setT_id(String t_id) {
		this.t_id = t_id;
	}

	public String getT_desc() {
		return t_desc;
	}

	public void setT_desc(String t_desc) {
		this.t_desc = t_desc;
	}

	public String getT_complete() {
		return t_complete;
	}

	public void setT_complete(String t_complete) {
		this.t_complete = t_complete;
	}

	public String getT_operator() {
		return t_operator;
	}

	public void setT_operator(String t_operator) {
		this.t_operator = t_operator;
	}

	public String getT_assis_dept() {
		return t_assis_dept;
	}

	public void setT_assis_dept(String t_assis_dept) {
		this.t_assis_dept = t_assis_dept;
	}

    public String getDi_no()
    {
        return di_no;
    }

    public void setDi_no(String di_no)
    {
        this.di_no = di_no;
    }

    public String getDm_no()
    {
        return dm_no;
    }

    public void setDm_no(String dm_no)
    {
        this.dm_no = dm_no;
    }
	
		
}
