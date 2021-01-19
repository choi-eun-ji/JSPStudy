<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="chap03.MemberDTO"%>
<%
	MemberDTO mbrdto1 = new MemberDTO();

	// 파라미터가 있는 생성자로 만듬
	mbrdto1.setName("이순신");
	mbrdto1.setJubun("9701273378723");
	
	String name1 = mbrdto1.getName();
	String jubun1 = mbrdto1.getJubun();
	
	String gender1 = mbrdto1.getGender();
	int age1 = mbrdto1.getAge();
	
	// 기본 생성자로 만듬
	MemberDTO mbrdto2 = new MemberDTO("이미자","0301274321234");
	
	String name2 = mbrdto2.getName();
	String jubun2 = mbrdto2.getJubun();
	
	String gender2 = mbrdto2.getGender();
	int age2 = mbrdto2.getAge(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 표준액션 중 useBean에 대해서 알아봅니다</title>
</head>
<body>
 <div>
		<h2>스크립틀릿을 사용하여 MemberDTO 클래스의 객체 정보를 불러오기</h2>
		<ul>
			<li>성명: <%= name1 %></li>
			<li>주민번호: <%= jubun1 %></li>
			<li>성별: <%= gender1 %></li>
			<li>나이: <%= age1 %></li>
		</ul>
		<ul>
			<li>성명: <%= name2 %></li>
			<li>주민번호: <%= jubun2 %></li>
			<li>나이: <%= age2 %></li>
		</ul>
	</div> 
	
	<hr style="border: solid 1px red";>
	
	<div>
		<!-- usebean을 사용하려면 기본생성자는 반드시 존재해야 한다. -->
		<h2>JSP 표준 액션중 UseBean을 사용하여 MemberDTO 클래스의 객체 정보를 불러오기</h2>
		<jsp:useBean id="mbrdto3" class="chap03.MemberDTO"/>
		<jsp:setProperty property="name" name="mbrdto3" value="엄정화"/>
		<jsp:setProperty property="jubun" name="mbrdto3" value="9010202234567"/>
		<ul>
		<!-- 여기서 name은 getName()의 Name을 의미하는데, 첫글자가 반드시 소문자여야 한다. name속성과 혼동하지 말것. -->
		<li>성명: <jsp:getProperty property="name" name="mbrdto3"/> </li>
		<li>주민번호: <jsp:getProperty property="jubun" name="mbrdto3"/> </li> 
		<li>성별 : <jsp:getProperty property="gender" name="mbrdto3"/></li>
        <li>나이 : <jsp:getProperty property="age" name="mbrdto3"/></li>
		</ul>

	</div>
</body>
</html>