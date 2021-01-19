<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String firstNum = request.getParameter("firstNum");
	String secondNum = request.getParameter("secondNum");
	
	int nfirstNum = Integer.parseInt(firstNum);
	int nsecondNum = Integer.parseInt(secondNum);
	
	int sum = 0;
	for(int i=nfirstNum; i<=nsecondNum; i++){
		sum += i;
	}
	
	// 결과물은 sum 이다.
	/*
      	== request 내장객체는 클라이언트(02forwardCalcTest.jsp) 가 
                보내온 데이터를 읽어들이는( request.getParameter("변수명"); ) 역할도 있고 
                저장소 기능( request.setAttribute("키", 저장할객체); )을 하는 역할도 있다. 
    */
   
	//   request.setAttribute("sum", new Integer(sum));
	//   원래는 위처럼 객체로 만들어서 저장을 해야 하지만 자바가 알아서 auto boxing(자동적으로 객체로 만들어주는 것) 해주기 때문에 아래처럼 쓸 수 있다.
	//   저장소 기능 !!, "sum" : 키값을 의미 / sum : 결과값
	request.setAttribute("sum", sum);
	request.setAttribute("firstNum", firstNum);
	request.setAttribute("secondNum", secondNum);
%>

 <%--
	웹 브라우저 상에서 url 주소는 그대로 02forwardCalc.jsp?인데, 웹브라우저 상에서 보여지는 주소는 
	02forwardCalcView.jsp의 내용이 보여진다. 
 --%>
<jsp:forward page="02forwardCalcView_EL.jsp" />



