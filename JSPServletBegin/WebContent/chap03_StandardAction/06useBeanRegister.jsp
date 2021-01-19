<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form 태그를 사용한 데이터 전송시, useBean 을 사용한 결과 보여주기</title>
</head>
<body>
	<jsp:useBean id="psdto" class="chap03.PersonDTO" />
	<%-- 
	<jsp:setProperty property="name" name="psdto" value="${param.name}"/>	 //${param.name}여기에서 name은 name 속성을 말하고 있는 것이다. 
	<jsp:setProperty property="school" name="psdto" value="${param.school}"/>
	<jsp:setProperty property="color" name="psdto" value="${param.color}"/>
	<jsp:setProperty property="food" name="psdto" value="${paramValues.food}"/>
	--%>
	<jsp:setProperty property="*" name="psdto"/>
	<h2>개인성향 입력결과 정보(JSP 표준액션 중 useBean을 사용한 것)</h2>
	<ul>
		<li>성명 : <jsp:getProperty property="name" name="psdto"/></li>
		<li>학력 : <jsp:getProperty property="school" name="psdto"/></li>
		<li>색상 : <jsp:getProperty property="color" name="psdto"/></li>
		<li>음식 : <jsp:getProperty property="strFood" name="psdto"/></li>
	</ul>
</body>
</html>