<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <p>
    <c:choose>
      <c:when test="${sessionScope.login !=null }">
      <div style="width: 150px; height: 120px; overflow: hidden" >
    <img src="${initParam.root }WebContent/img/${sessionScope.login.picture}" style="width: 120px; height: 120px; margin-left: 20px;  border-radius: 100px; left: 220px;">
   </div>
         <ul class="nav nav-pills">
            <li class="active"><a href="${initParam.root}DispatcherServlet?command=logout">logout</a></li>
            <li class="active"><a href="${initParam.root}DispatcherServlet?command=list&pageNo=1">Notice</a></li>
             <li class="active"><a href="${initParam.root}member/search_result.jsp">Search</a></li>
             <li class="active"><a href="${initParam.root}poke/poke_list.jsp?id=${sessionScope.login.id}">PokeList</a></li>
             <%-- 		<li class="active"><a href="${initParam.root}poke/poke_list.jsp?id=${sessionScope.login.id}">PokeList</a></li>		--%>
            <li class="active"><a href="${initParam.root}index.jsp">Home</a></li>
            <!-- 아이디 누르면 개인정보 페이지 -->
            <li class="active"><a href="${initParam.root}DispatcherServlet?command=showDetail&id=${sessionScope.login.id}">${sessionScope.login.id} </a></li>
         </ul>
   </c:when>
   <c:otherwise>
   <div style="width: 150px; height: 120px; overflow: hidden" ></div>
   		 <ul class="nav nav-pills">
            <li class="active"><a href="DispatcherServlet?command=list&pageNo=1">Notice</a></li>
            <li class="active"><a href="${initParam.root}index.jsp">Home</a></li>
         </ul>
   </c:otherwise>
   </c:choose>
</p>