
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<form name="fileForm" id="fileForm" method="POST" action="upload.jsp" enctype="multipart/form-data">
	<!-- <input type = "hidden" name="command" value = "image"> -->
    <input type="file" name="uploadFile" id="uploadFile"> 
    <input type="submit" value="전송">
</form>
<body>
</body>
</html>