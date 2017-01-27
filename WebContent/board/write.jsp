<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<title>login.jsp</title>
<script type="text/javascript">
   function content_submit() {
      var f = document.write_form;
      if (f.title.value == "") {
         alert("제목을 입력하세요!");
         f.title.focus();
         return;
      }
      if (f.content.value == "") {
         alert("내용을 입력하세요!");
         f.content.focus();
         return;
      }
      f.submit();
   }
   function cancel() {
      var f = document.write_form;
      f.reset();
   }
</script>
</head>
<body>
   <br>
   <br>
   <br>
   <c:import url="../header/header.jsp"></c:import>
   <div class="jumbotron">
      <form action="${initParam.root}DispatcherServlet" method="post" name="write_form">
         <input type="hidden" name="command" value="write">
         <table cellpadding="5">
            <caption>글쓰기</caption>
            <tbody>
               <tr>
                  <td>제목</td>
                  <td colspan="2"><input type="text" name="title" size="80">
                  </td>
               </tr>
               <tr>
                  <td>이름</td>
                  <td>${sessionScope.login.id}</td>
               </tr>
               <tr>
                  <td colspan="2" align="left">&nbsp;&nbsp; <textarea cols="95"
                        rows="15" name="content"></textarea>
                  </td>
               </tr>
               <tr>
                  <td colspan="2" align="center"><input type="button"
                     value="입력" onclick="content_submit()"> <input
                     type="button" value="취소" onclick="cancel()"></td>
               </tr>
            </tbody>
         </table>
      </form>

   </div>
</body>
</html>