<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl.jsp</title>
</head>
<body>
<img src="<%=request.getContextPath() %>/img/a.jpg">
<img src="${pageContext.request.contextPath}/img/a.jpg">
${cookie.hobby.value }
<br>
<%= request.getHeader("user-agent") %>
<br>
${header["user-agent"] }
<br>
<%
	session.setAttribute("name","session홍길동");
	request.setAttribute("name", "request김동길");
	Cookie cookie = new Cookie("hobby", "취미");
	response.addCookie(cookie);
%>
${cookie.hobby.value }
<br>
<%=request.getParameter("name")%>
 : ${param.name}  
 <br>
 <%=session.getAttribute("name") %>
 :  ${name} : ${sessionScope.name} :
</body>
</html>