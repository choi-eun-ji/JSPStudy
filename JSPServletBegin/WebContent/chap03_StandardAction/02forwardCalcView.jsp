<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String firstNum = request.getParameter("firstNum");
	String secondNum = request.getParameter("secondNum");

	// 저장소 어트리뷰트의 반환값은 객체이지만 이를 형변환 integer형으로 해주고 이를 int형으로 바꿔줘도 된다.
	int sum = (Integer) request.getAttribute("sum");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>계산된 결과값 보여주는 곳</title>
</head>
<body>
	<h3>계산된 결과값</h3>
	<br>
	<br>
	<%=firstNum%>
	부터
	<%=secondNum%>
	까지의 합은?
	<br> 결과값 :
	<span style="color: red"><%= sum%></span>
</body>
</html>