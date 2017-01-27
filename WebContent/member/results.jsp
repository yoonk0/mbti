<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">

</script>
</head>
<body><table class = "layout">
	<tr>
		<td colspan = "2" class = "header"><jsp:include page = "../header/header.jsp"/></td>
	</tr>
	<tr>
		<td class = "left"><jsp:include page = "search.jsp"/></td>
		<td class = "main">
<div class="jumbotron">
<br><br>
	<table class="table table-striped table-hover" cellpadding = "15">
		<thead><tr><th colspan = "5">검색결과</th><th><span id = "paging"></span></th></tr></thead>
		<tbody id = "info">	
		</tbody>
				
	</table>



</div>
		</td>
	</tr>	
</table>

</body>
</html>