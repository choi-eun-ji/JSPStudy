<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();	// ctxPath : /JSPServletBegin 이다. 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인성향 입력한 결과 성공인 경우 페이지</title>

<script type="text/javascript">
	
	function goSelect() {
		// 암기 !!! 
		// 자바스크립트에서 url페이지의 이동은 location.href="이동할 url 경로명"; 으로 하면 된다. 
		
		location.href = "<%= ctxPath%>/personSelect.do";
	}
</script>
</head>
<body>
	<h2>개인성향 입력 성공</h2>
	<br>	
	<button onclick="goSelect()">입력결과 조회하기</button>
</body>
</html>