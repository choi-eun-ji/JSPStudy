<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ===== JSTL(JSP Standard Tag Library) 사용하기 ===== --%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원명단 출력하기</title>
</head>
<body>
	
   <c:if test="${not empty nameArr1}">
   <div>
      <ol>
         <c:forEach var="name" items="${requestScope.nameArr1}"> <!-- nameArr1 배열에 있는 값들을 하나하나 꺼내어서 name에 넣어줌. -->
                      <%-- items=""에 들어오는 것은 배열 또는 List이다. --%> 
            <li>${name}</li>
         </c:forEach>
      </ol>
   </div>
   </c:if>
   
   <c:if test="${empty nameArr1}">
      <div>
         <span style="color: red;">nameArr1는 데이터가 존재하지 않습니다.</span>
      </div>
   </c:if>
   
   <c:if test="${!empty personList}">
   <div>
      <c:forEach var="psdto" items="${personList}">
         <ul>
            <li>성명 : ${psdto.name}</li>         
            <li>학력 : ${psdto.school}</li>         
            <li>색상 : ${psdto.color}</li>         
            <li>음식 : ${psdto.strFood}</li>         
         </ul>
      </c:forEach>
   </div>
   </c:if>
   
   <c:if test="${empty personList}">
      <div>
         <span style="color: red;">personList는 데이터가 존재하지 않습니다.</span>
      </div>
   </c:if>
   
   <hr style="border: solid 1px red;"/>

   <c:if test="${not empty nameArr2}">
      <div>
         <ol>
            <c:forEach var="name" items="${nameArr2}"> 
               <li>${name}</li>
            </c:forEach>
         </ol>
      </div>
   </c:if>
   
   <c:if test="${empty nameArr2}">
      <div>
         <span style="color: red;">nameArr2는 데이터가 존재하지 않습니다.</span>
      </div>
   </c:if>
   
   <c:if test="${!empty personList2}">
      <div>
         <c:forEach var="psdto" items="${personList2}">
            <ul>
               <li>성명 : ${psdto.name}</li>         
               <li>학력 : ${psdto.school}</li>         
               <li>색상 : ${psdto.color}</li>         
               <li>음식 : ${psdto.strFood}</li>         
            </ul>
         </c:forEach>
      </div>
   </c:if>
   
   <c:if test="${empty personList2}">
      <div>
         <span style="color: red;">personList2는 데이터가 존재하지 않습니다.</span>
      </div>
   </c:if>

   <hr style="border: solid 1px blue;"/>

   <c:if test="${not empty nameArr3}">
   <div>
      <ol>
         <c:forEach var="name" items="${nameArr3}"> 
            <li>${name}</li>
         </c:forEach>
      </ol>
   </div>
   </c:if>
   
   <c:if test="${empty nameArr3}">
      <div>
         <span style="color: blue;">nameArr3는 데이터가 존재하지 않습니다.</span>
      </div>
   </c:if>
   
   <c:if test="${not empty nameArr3}">
   <div>
      <c:forEach var="psdto" items="${personList3}">
         <ul>
            <li>성명 : ${psdto.name}</li>         
            <li>학력 : ${psdto.school}</li>         
            <li>색상 : ${psdto.color}</li>         
            <li>음식 : ${psdto.strFood}</li>         
         </ul>
      </c:forEach>
   </div>
   </c:if>
      
   <c:if test="${empty personList3}">
      <div>
         <span style="color: blue;">personList3는 데이터가 존재하지 않습니다.</span>
      </div>
   </c:if>
   
</body>
</html>