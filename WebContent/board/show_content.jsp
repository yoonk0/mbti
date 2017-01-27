<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<title>login.jsp</title>
<script type="text/javascript">



function sendList(){
   location.href="${initParam.root}DispatcherServlet?command=list&pageNo=1"
}    
function updateList(){   
   location.href = "${initParam.root}DispatcherServlet?command=updateView&no="+${requestScope.bvo.postNo };
}
</script>
</head>
<body>
   <br>
   <br>
   <br>
   <c:import url="../header/header.jsp"></c:import>
   <div class="jumbotron">
      <form class="form-horizontal">
         <fieldset>
            <legend>Board</legend>
            <div class="form-group">
               <label class="col-lg-2 control-label">NO</label>
               <div class="col-lg-10">
                  <label class="col-lg-2 control-label">${requestScope.bvo.postNo }</label>
               </div>
            </div>
            <div class="form-group">
               <label class="col-lg-2 control-label">제목</label>
               <div class="col-lg-10">
                  <label class="col-lg-2 control-label">${requestScope.bvo.title}</label>
               </div>
            </div>
            <div class="form-group">
               <label class="col-lg-2 control-label">작성자</label>
               <div class="col-lg-10">
                  <label class="col-lg-2 control-label">${requestScope.bvo.vo.id }</label>
               </div>
            </div>
            <div class="form-group">
               <label class="col-lg-2 control-label">작성일시</label>
               <div class="col-lg-10">
                  <label class="col-lg-2 control-label">${requestScope.bvo.timePosted}</label>
               </div>
            </div>
            <div class="form-group">
               <label class="col-lg-2 control-label">내용</label>
               <div class="col-lg-10">
                  <textarea class="form-control" rows="3" id="textArea"
                     readonly="readonly">${requestScope.bvo.content}</textarea>
               </div>
            </div>

            <c:choose>
               <c:when test="${sessionScope.login.admin == '1' }">
                  <div class="form-group">
                     <div class="col-lg-10 col-lg-offset-2">
                        <input class="btn btn-default" type="button" value="목록"
                           onclick="sendList()"> 
                           <input class="btn btn-primary"
                           type="button" value="수정" onclick="updateList()">
                     </div>
                  </div>
               </c:when>
               <c:otherwise>
                  <div class="form-group">
                     <div class="col-lg-10 col-lg-offset-2">
                        <button type="reset" class="btn btn-default"
                           onclick="sendList()">목록</button>
                     </div>
                  </div>
               </c:otherwise>
            </c:choose>
         </fieldset>
      </form>
   </div>
</body>
</html>