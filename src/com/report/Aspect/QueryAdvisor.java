package com.report.Aspect;

import org.aspectj.lang.annotation.After;  
import org.aspectj.lang.annotation.Aspect;  
import org.aspectj.lang.annotation.Before;
@Aspect
public class QueryAdvisor
{
	@Before("execution(* com.report.action.ReportActionSupport.*(..))")
	public void beforeAction()
	{
		System.out.println("AOP: Before Action!!");
	}
	
	@After("execution(* com.report.action.ReportActionSupport.*(..))")
	public void afterAction()
	{
		System.out.println("AOP: After Action!!");
	}
}
