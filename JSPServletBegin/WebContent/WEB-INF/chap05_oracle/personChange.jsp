<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// context name을 알아오고자 한다.
	String ctxPath = request.getContextPath();
%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정보 수정하기</title>
</head>
<body>
	<form name="memberFrm" action="<%= ctxPath %>/personUpdate2.do" method="post">
	<input type="hidden" name="seq" id="seq" value="${psdto.seq}">
	<fieldset>
		<ul>
			<li>
				<label for="name">성명</label>
				<input type="text" name="name" id="name" value="${psdto.name}"/>
			</li>
			<li>
            <label for="school">학력</label>
            <select name="school" id="school">
               <option value="고졸" >고졸</option>
               <option value="초대졸">초대졸</option>
               <option id="ops" value="대졸">대졸</option>
               <option value="대학원졸">대학원졸</option>
            </select>
         </li>
         <li>
            <label for="">좋아하는 색상</label>
            <div>
               <label for="red">빨강</label>
               <input type="radio" name="color" id="red" value="red" />
               
               <label for="blue">파랑</label>
               <input type="radio" name="color" id="blue" value="blue" checked/>
               
               <label for="green">초록</label>
               <input type="radio" name="color" id="green" value="green" />
               
               <label for="yellow">노랑</label>
               <input type="radio" name="color" id="yellow" value="yellow" />
            </div>
         </li>       
         <li>
            <label for="">좋아하는 음식(다중선택)</label>
            <div>
                <label for="food1">짜장면</label>
               <input type="checkbox" name="food" id="food1" value="짜짱면" />
               &nbsp;
               
               <label for="food2">짬뽕</label>
               <input type="checkbox" name="food" id="food2" value="짬뽕" />
               &nbsp;
               
               <label for="food3">탕수육</label>
               <input type="checkbox" name="food" id="food3" value="탕수육" />
               &nbsp;
               
               <label for="food4">양장피</label>
               <input type="checkbox" name="food" id="food4" value="양장피" />
               &nbsp;
               
               <label for="food5">팔보채</label>
               <input type="checkbox" name="food" id="food5" value="팔보채" />
            </div>
         </li>
         <li>
         		<input type="submit" value="수정" />
            	<input type="reset" value="취소" />
         </li> 
		</ul>
	</fieldset>
	</form>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var schools = '${psdto.school}';
	$("#school").val(schools).prop("selected", true);
	
	var colors = '${psdto.color}';
	console.log(colors);
	$("input:radio[name='color'][value='"+colors+"']").prop('checked', true);
	
	var foods = '${psdto.strFood}';
	var arrfoods = foods.split(",");

	arrfoods.forEach(function(item) {
		$("input:checkbox[name='food'][value='"+item+"']").prop('checked', true);
	});

});
</script>
</html>