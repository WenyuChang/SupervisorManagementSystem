<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>Report Framework Menu(Manager Assistant)</title>
	</head>

	<body>
		<br><hr>
		<ul>
			<li>
				<a href="<s:url action='report/showEMP.action'/>">Show All Employees</a>
			</li>
			<li>
				<a href="<s:url action='report/showDepartment.action'/>">Show All Departments</a>
			</li>
			<li>
				<a href="<s:url action='report/showTask.action'/>">Show All Task</a>
			</li>
			<li>
				<a href="<s:url action='report/showOverdateTask.action'/>">Show All Task Overdate</a>
			</li>
			<li>
				<a href="<s:url action='report/showIn7DaysTask.action'/>">Show All Task In 7 Days</a>
			</li>
			
		</ul>
		<hr>
	</body>

</html>
