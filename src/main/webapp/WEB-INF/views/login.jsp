<%-- Petsle JSP Common Template 2020/08/11 --%>
<%@page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="../css/signin.css">
	<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>
</head>
<body>
	<section class="login-form">
		<h1><img src="../img/loginlogo.png" alt="" /></h1>
		<form action="login" method="POST">
			<div class="int-area">
				<input type="text" name="id" id="id"
					autocomplete="off" required>
				</input>
				<label for="id">아이디</label>
			</div>
			<div class="int-area">
				<input type="password" name="pw" id="pw"
					autocomplete="off" required>
				</input>
				<label for="pw">비밀번호</label>
			</div>
			<div class="btn-area">
				<button id="button" onclick="button_click();">로그인</button>
			</div>
		</form>
		<div class="caption">
			<a href="">회원가입</a>
			<div>
			<a href="">비밀번호 찾기</a>
			</div>
		</div>
			
	</section>
	<script>
		
			function button_click() {
               if(document.getElementById("id").value=="a123" && (document.getElementById("pw").value="123"))
                  {
                     window.open('/');
                  }else {
                     alert("아이디 또는 비밀번호가 틀립니다.");
                  }
            }
	</script>
</body>
</html>