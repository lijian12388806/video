<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		总在线人数:${fn:length(onlines)}<br/>
		<c:forEach items="${onlines}" var="model" varStatus="status">
			${status.index+1}, ${model.value.ipAddress}, ${model.value.location}, ${model.value.loadTime}<br/>
		</c:forEach>
	
	</center>
</body>
</html>