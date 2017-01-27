<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript" src="../jquery-1.12.3.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<title>login.jsp</title>
<script type="text/javascript">
   function checkForm() {
      var id = document.loginForm.id;
      var password = document.loginForm.password;
      if (id.value == "") {
         alert("아이디를 입력하세요");
         id.focus();
         return false;
      }
      if (password.value == "") {
         alert("비밀번호를 입력하세요");
         password.focus();
         return false;
      }
   }
   function register(){
	   location.href="${initParam.root}member/regist.jsp";
   }
   $(document).ready(function(){ $(".header").load("${initParam.root}header/header.jsp") });
</script>
</head>
<body>
<div class = "header"></div>
<div class="jumbotron">
   <br>
   <h1>cocoa</h1>
  <p><strong>mbti friend finder</strong></p>
  <br><br><br><br>   

   <c:choose>
      <c:when test="${sessionScope.login == null}">
               <form action="${initParam.root}DispatcherServlet" method="post"
            name="loginForm" onsubmit="return checkForm()">
            아이디 <input type="text" name="id"> &nbsp;&nbsp;
            비밀번호<input type="password" name="password"> &nbsp;&nbsp;
            <input type="submit" value="로그인"> &nbsp;&nbsp;
            <input type="hidden" name="command" value="login">
            <input type="button" value="회원가입" onclick="register()"> &nbsp;&nbsp;
         </form>
      </c:when>
      <c:otherwise>
       <p>
       <br><br><br><br><br>
   <font color ="grey" size = "6px">About</font><br><br>
   <font color ="grey" size = "4px">
   
    </font>
   </p>   
      </c:otherwise>

   </c:choose>

</div>
  
</body>
</html>