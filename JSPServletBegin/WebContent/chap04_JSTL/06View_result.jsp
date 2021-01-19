<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ===== JSTL(JSP Standard Tag Library) 사용하기 ===== --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구명단 출력하기</title>
</head>
<body>

   <h2>친구명단</h2>
   
   <c:if test="${empty myfriends}">
      <span>친구가 없으시군요~~~^_____^</span>
   </c:if>
   <c:if test="${!empty myfriends}"> 
      <c:set var="arrFriends" value="${ fn:split(myfriends,',') }" /> <!-- String형인  myfriends를 받아와서 ","를 구분자로 나눈 배열을 arrFriends변수에 넣는다. -->
      
      <ol>
         <c:forEach var="name" items="${arrFriends}"> <!-- arrFriends배열의 값들을 차례로 name 변수에 넣는다. -->
            <li>${name}</li>
         </c:forEach>
      </ol>
   </c:if>
   
   <hr style="border: solid 1px red;">
   
   <c:if test="${empty mymembers}">
      <span>지인이 없으시군요~~~^_____^</span>
   </c:if>
   <c:if test="${!empty mymembers}"> 
      <ul>
      	<c:forTokens var="name" items="${mymembers}" delims=",">
      		<li>${name}</li>
      	</c:forTokens>
      </ul>
   </c:if>
   
   <hr style="border: solid 1px red;">
   
   <c:if test="${empty myheowons}">
      <span>회원이 없으시군요~~~^_____^</span>
   </c:if>
   <c:if test="${!empty myheowons}"> 
      <ul>
      	<!-- myheowons는 하나의 문자열인데 구분자를 , 또는 . 또는 /를 사용하여 하나하나씩 잘라서 배열로 나타내어준다. -->
      	<c:forTokens var="name" items="${myheowons}" delims=",./">	
      		<li>${name}</li>
      	</c:forTokens>
      </ul>
   </c:if>
   
</body>
</html>