<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<title>글목록</title>
<script type="text/javascript">
$(document).ready(function(){
	   $(".header").load("${initParam.root}header/header.jsp");
});
</script>
</head>
<body>
<div class = "header"></div>
<div class="jumbotron">
  <table class="table table-striped table-hover ">
  <caption>목록</caption>
  <thead>
    <tr>
			<th>NO</th>
			<th>제목</th>
			<th>아이디</th>
			<th>작성일</th>
    </tr>
  </thead>
  <tbody>
    <tr>
		<c:forEach var="bvo" items="${requestScope.lvo.list}">				
			<tr class="info">
			    <td>${bvo.postNo }</td>		
			  
				<td><a href="${initParam.root}DispatcherServlet?command=showContentNotHit&no=${bvo.postNo }">
				${bvo.title }</a></td>
			
				<td>${bvo.vo.id }</td>
				<td>${bvo.timePosted }</td>
			</tr>	
			</c:forEach>
    </tr>
  </tbody>				
	</table><br></br>	
	<c:if test="${sessionScope.login.admin == '1' }">	
	<a href="${initParam.root}board/write.jsp">글쓰기</a>
	</c:if>
	<br><br>	
<p class="paging">
	<%-- 코드량을 줄이기 위해 pb 변수에 페이징 빈을 담는다 --%>
	<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
	 <%-- 페이징빈의 getNowPage에 접근하여 출력 --%>
<!-- 
			step2 1) 이전 페이지 그룹이 있으면 이미지 보여준다. (img/left_arrow_btn.gif)
				   		페이징빈의 previousPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   startPageOfPageGroup-1 하면 됨 		 
	 -->      
	<c:if test="${pb.previousPageGroup}">
	<a href="DispatcherServlet?command=list&pageNo=${pb.startPageOfPageGroup-1}">◀&nbsp; </a>	
	</c:if>
	<!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
				   2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
				      현 페이지이면 링크를 처리하지 않는다.  
				      PagingBean의 nowPage
				      jstl choose 를 이용  
				      예) <a href="DispatcherServlet?command=list&pageNo=...">				   
	 -->		
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<a href="DispatcherServlet?command=list&pageNo=${i}">${i}</a> 
	</c:when>
	<c:otherwise>
	${i}
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>	 
	<!-- 
			step3 1) 다음 페이지 그룹이 있으면 이미지(img/right_arrow_btn.gif) 보여준다. 
				   		페이징빈의 nextPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   endPageOfPageGroup+1 하면 됨 		 
	 -->   
	<c:if test="${pb.nextPageGroup}">
	<a href="DispatcherServlet?command=list&pageNo=${pb.endPageOfPageGroup+1}">▶</a>
	</c:if>
	</p>
	</div>
</body>
</html>









