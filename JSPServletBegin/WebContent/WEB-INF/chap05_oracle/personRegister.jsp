<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%
	// context name을 알아오고자 한다.
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인성향 테스트 db로 전송하기</title>
</head>
<body>

<form name="memberFrm" action="<%= ctxPath %>/personRegister.do" method="post">

<fieldset>
      <legend>개인성향 DB로 전송하기 테스트</legend>
      <ul>
         <li>
            <label for="name">성명</label>
            <input type="text" name="name" id="name" placeholder="성명입력"/> 
         </li>
         <li>
            <label for="school">학력</label>
            <select name="school" id="school">
               <option value="고졸">고졸</option>
               <option value="초대졸">초대졸</option>
               <option value="대졸">대졸</option>
               <option value="대학원졸">대학원졸</option>
            </select>
         </li>
         <li>
            <label for="">좋아하는 색상</label>
            <div>
               <label for="red">빨강</label>
               <input type="radio" name="color" id="red" value="red" />
               
               <label for="blue">파랑</label>
               <input type="radio" name="color" id="blue" value="blue" />
               
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
            <input type="submit" value="전송" />
            <input type="reset" value="취소" />
         </li>
      </ul>
   </fieldset>
   </form>
</body>
</html>