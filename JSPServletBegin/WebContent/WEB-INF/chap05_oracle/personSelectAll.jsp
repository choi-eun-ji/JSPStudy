<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="chap05.oracle.PersonDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인성향 정보 출력 페이지</title>

<style type="text/css">

   table, th, td{
      border: solid 1px gray;
      border-collapse: collapse;
   }
   
   div{
      margin: 20px;
   }
   
   tr.data:hover{
      background-color: pink;
      color: white;
      cursor: pointer;
   }
   
</style>

<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

   $(document).ready(function() {
      
	  $("span").hide();
	  
      $("tr.data").click(function(event) {
         var $target = $(event.target);
         var seq = $target.parent().find("span").text();
         // alert(seq);
         
         location.href="personDetail.do?seq="+seq;
      });
      
   });

</script>

</head>
<body>

   <div>
      <h2>개인성향 정보 출력 결과(스크립틀릿으로 작성한 것)</h2>
      <%
         List<PersonDTO> personList = (List<PersonDTO>)request.getAttribute("personList");
      
         // 들어온 정보가 있을 시 (new 객체() 로 했기 때문에 null은 나올 수 없음)
         if(personList.size() > 0){ %>
            <table>
               <thead>
                  <tr>
                     <th>성명</th>
                     <th>학력</th>
                     <th>색상</th>
                     <th>음식</th>
                     <th>등록일자</th>
                  </tr>
               </thead>
               
               <tbody>
               <% 
                  for(PersonDTO ps : personList){
                     %>
                     <tr class="data">
                        <td><%= ps.getName() %></td>
                        <td><%= ps.getSchool() %></td>
                        <td><%= ps.getColor() %></td>
                        <td><%= ps.getStrFood() %></td>
                        <td><%= ps.getRegisterday() %></td>
                     </tr>
                     <%
                  }
                  %>
               </tbody>
            </table>
         <% 
         }else{
            %>
            <span style="color: red;">데이터가 존재하지 않습니다.</span>
            <% 
         }
      %>
   </div>
   
   <div>
      <h2>개인성향 정보 출력 결과(JSTL로 작성한 것)</h2>
      
      <table>
         <thead>
            <tr>
               <th>성명</th>
               <th>학력</th>
               <th>색상</th>
               <th>음식</th>
               <th>등록일자</th>
            </tr>
         </thead>
         
         <tbody>
            <c:forEach var="psdto" items="${ personList }">
               <tr class="data">
                  <td><span class="seq">${psdto.seq}</span>${ psdto.name }</td>
                  <td>${ psdto.school }</td>
                  <td>${ psdto.color }</td>
                  <td>${ psdto.strFood }</td>
                  <td>${ psdto.registerday }</td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
      
      
   </div>
   
   <%-- <button onclick="javascript:location.href='personRegister.do'">입력페이지로 돌아가기</button> --%>
   <button onclick="javascript:location.href='<%= request.getContextPath() %>/personRegister.do'">입력페이지로 돌아가기</button>

</body>
</html>
















