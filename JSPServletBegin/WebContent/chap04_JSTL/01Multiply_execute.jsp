<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>두개의 수를 입력받아서 곱셈하기</title>
<script type="text/javascript" src="/JSPServletBegin/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		$("input:button[value=확인]").click(function() {
			 // 유효성 검사
		      $("input:button[value=확인]").click(function(){ // 버튼 click시 이벤트
		         
		         var num1Val = $("#num1").val();
		         var num2Val = $("#num2").val();
		         
		         if(num1Val == "" || num2Val == "") {
		            alert("숫자를 입력하세요!!");
		            return;
		         }

			
			var frm = document.multiplyFrm;
			frm.action = "01Multiply_result.jsp";
			frm.submit();
		});
	});
	});

</script>
</head>
<body>
	
	<form name="multiplyFrm">
		첫번째 수 : <input type="number" name="num1" id="num1" />
		두번째 수 : <input type="number" name="num2" id="num2"/>
		<br>
		<input type="button" value="확인" />
		<input type="reset" value="취소" />
	</form>
	
</body>
</html>