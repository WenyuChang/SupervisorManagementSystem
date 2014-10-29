<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<% 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "max-age=0, must-revalidate");
%><?xml version="1.0" encoding="GB2312"?>
<root>
  <c:forEach items="${result}" var="record" varStatus="i">
    <item>
        <c:forEach items="${record}" var="item" varStatus="j">
             <field${j.count}>${item}</field${j.count}>
        </c:forEach>
    </item>
    <br />
  </c:forEach>
</root>
