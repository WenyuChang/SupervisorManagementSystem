<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
    	<title>Report System</title>
	</head>

	<body>
			<div align="center">
				<s:form action="report/LoginTest.action">
					<s:textfield label="username" name="e_name"></s:textfield>
					<s:password label="password" name="e_passwd"></s:password>
					<s:submit value="submit"></s:submit>
				</s:form>
			</div>
	</body>
	
</html>