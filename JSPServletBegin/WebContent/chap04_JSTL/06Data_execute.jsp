<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// String myfriends=" "; 
	// String myfriends = null; 
	String myfriends = "이제훈, 고수, 강산애, 강동원, 주원";
	
	String mymembers = "수지, 혜리, 사나, 서지혜, 화사";
	
	String myheowons = "이수지,김혜리.왜사나,오지혜/와화사";
	
	myfriends = (myfriends == null?null:myfriends.trim());
	request.setAttribute("myfriends", myfriends);	// trim() : 좌, 우의 공백이 없어져서 보내는 것이다.
	request.setAttribute("mymembers", mymembers);	// trim() : 좌, 우의 공백이 없어져서 보내는 것이다.
	request.setAttribute("myheowons", myheowons);	// trim() : 좌, 우의 공백이 없어져서 보내는 것이다.
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("06View_result.jsp");
	dispatcher.forward(request, response);
%>    