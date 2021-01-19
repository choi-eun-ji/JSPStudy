<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL(JSP Standard Tag Library) 사용하기 --%>

<%-- 변수의 선언 방법 --%>
<c:set var="no1" value="${param.num1}" />
<c:set var="no2" value="${param.num2}" />
<c:set var="result" value="${no1 * no2}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>두개의 수를 입력받아서 곱셈한 결과 출력하기</title>
</head>

<body>
	${no1} 와 ${no2}의 곱은 ${result} 입니다.
	${param.num1} 와 ${param.num2}의 곱은 ${result} 입니다.
</body>
</html>