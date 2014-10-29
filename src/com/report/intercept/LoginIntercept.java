package com.report.intercept;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginIntercept implements Interceptor
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String[] username;
	private String[] passwd;
	
	public void init()
	{
		
	}

	public void destroy()
	{
		
	}
	
	private void getBeanPara(ActionInvocation actionInvocation)
	{
		Map<String, String> parameters = actionInvocation.getInvocationContext().getParameters(); 
		if(parameters.containsKey("e_name"))
		{
			Object tmpName = parameters.get("e_name");
			username = (String[]) tmpName;
		}
		if(parameters.containsKey("e_passwd"))
		{
			Object tmpPasswd = parameters.get("e_passwd");
			passwd = (String[]) tmpPasswd;
		}
	}
	
	public String intercept(ActionInvocation actionInvocation ) throws Exception
	{
		System.out.println("Login Intercept start....");
		getBeanPara(actionInvocation);
		String result;
		if(username[0]!="" && passwd[0]!="" && passwd[0]!="1 or 1=1")
		{
			result = actionInvocation.invoke();
		}
		else
		{
			result = "ERROR";
		}
		System.out.println("Login Intercept end....");
		return result;
	}
}
