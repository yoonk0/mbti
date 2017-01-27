<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${initParam.root}css/bootstrap.css">
<title>login.jsp</title>
<script type="text/javascript">
   
</script>
</head>
<body>
   <br>
   <c:import url="../header/header.jsp"></c:import>
   <div class="jumbotron">
      <form method=post action="${initParam.root}DispatcherServlet">
         <input type=hidden name=command value=update></input>
                  <table cellpadding="5">
                     <tr>
                        <td>글번호: <input type="text" name="no" value="${bvo.postNo }" readonly></input> | 타이틀:<input type="text" name="title"
                           value="${bvo.title }"></input>
                        </td>
                     </tr>
                     <tr>
                        <td><font size="2">작성자: <input type="text" name="writer" value="${bvo.vo.id }" readonly></input>| 작성일시:${bvo.timePosted }
                        </font></td>
                     </tr>
                     <tr>
                        <td><textarea rows="15" cols="75" name="content">${bvo.content }</textarea>
                        </td>
                     </tr>
                     <tr>
                        <td valign="middle"><input type="submit" value="수정하기"></input></td>
                     </tr>
                  </table>
      </form>
   </div>
</body>
</html>