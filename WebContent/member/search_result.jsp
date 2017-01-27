<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${initParam.root}css/bootstrap.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
  $(document).ready(function(){ $(".header").load("${initParam.root}header/header.jsp") });
  </script>
<title>search_result.jsp</title>
</head>
<body>
<div class = "header"></div>
<table class = "layout">
	<tr>
		<td class = "left"><jsp:include page = "search.jsp"/></td>
		<td class = "main"><jsp:forward page= "results.jsp"/></td>
	</tr>	
</table>

</body>
</html>