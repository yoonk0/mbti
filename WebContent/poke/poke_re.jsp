<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<title>글목록</title>
<script type="text/javascript" src="../jquery-1.12.3.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
	function rePokeForm() {
		location.href="DispatcherServlet?command=pokeRe&id=${sessionScope.login.id}";
	}
	function sePokeForm() {
		location.href="DispatcherServlet?command=pokeSe&id=${sessionScope.login.id}";
	}


</script>
</head>
<body>
	<br>
	<br>
	<br>
	<c:import url="../header/header.jsp"></c:import>
	<div class="jumbotron">
		<table class="table table-striped table-hover ">
			<caption><input type="button" value="받은 찜 목록" onclick="rePokeForm()">
			<input type="button" value="보낸 찜 목록" onclick="sePokeForm()"></caption>
			
			<thead>
				<tr>
					<th>보낸 사람</th>
					<th>확인</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<c:forEach var="plist" items="${requestScope.plist}">
						<tr class="info">
							<td><a href="${initParam.root}DispatcherServlet?command=pokedetail&id=${plist.seId}">${plist.seId}</a></td>
								<c:choose>
									<c:when test="${plist.confirm==0}">
										<td>♥도착~</td>
									</c:when>
									<c:when test="${plist.confirm==1}">
										<td>${plist.memberVO.kakao }</td>
									</c:when>
									<c:otherwise>
										<td>후잉후잉 담에 만나요</td>
									</c:otherwise>
								</c:choose>
							
						</tr>
					</c:forEach>
				</tr>
			</tbody>
		</table>
		<br></br>
	</div>
</body>
</html>









