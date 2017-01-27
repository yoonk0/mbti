<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${initParam.root }/css/bootstrap.css">
<title>Insert title here</title>
<script type="text/javascript" src="../jquery-1.12.3.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
   function pokeListForm(){
      location.href="${initParam.root}poke/poke_list.jsp?id=${sessionScope.login.id}";
      //location.href="${initParam.root}/member/update.jsp";
   }
   function homeForm() {
      location.href="${initParam.root}index.jsp";
   }
   
   function okbtn(){
      var id="${requestScope.bvo.memberVO.id}";
      if(confirm("찜 수락하시겠습니까?")){
         alert(id+"님을 수락하였습니다");
         location.href="${initParam.root}DispatcherServlet?command=pokeOk&id="+id;
      }
   }
   function nobtn(){
      var id="${requestScope.bvo.memberVO.id}";
      if(confirm("찜 거절하시겠습니까?")){
         alert(id+"님을 거절하였습니다");
         location.href="${initParam.root}DispatcherServlet?command=pokeNo&id="+id;
      }
   }
$(document).ready(function(){ $(".header").load("${initParam.root}header/header.jsp") });
   
</script>
</head>
<body>
<div class = "header"></div>
<div class="jumbotron">
<form action="${initParam.root}DispatcherServlet" method="post" name = "memberUpdateForm" onsubmit="return register()">
<table cellpadding="5">
   <tr>
      <td colspan="2"><h2 style="font-size:50px">Details</h2></td>
   </tr>
   <tr>
   <td> <div style="width: 150px; height: 120px; overflow: hidden" >
    <img src="${initParam.root }/img/${bvo.memberVO.picture}" style="width: 120px;; height: 120px; margin-left: 20px;  border-radius: 100px; left: 220px;">
   </div><br>
   </td>
   </tr>
   <tr>
   <td  colspan="2"><h2 style="font-size:20px">
         <c:choose>
              <c:when test="${requestScope.bvo.confirm==1 }">
                   <h2>♥찜♥</h2> 
              </c:when>
              <c:when test="${requestScope.bvo.confirm==2 }">
                 <h2>거절한 상대방입니다.</h2>
              </c:when>
        </c:choose>
        </h2>
   </td>
   </tr>
   <tr>
      <td>아이디</td>
      <td><input type="text"name="id" value=${bvo.memberVO.id } readonly></td>
      <%System.out.println(); %>
   </tr>
   <tr>
      <td>성별</td>
      <td>
      <c:choose>
         <c:when test="${bvo.memberVO.gender=='m' }">
             <input type="text"name="age"size="10" value="남" readonly>
         </c:when>
         <c:otherwise>
          <input type="text"name="age"size="10" value="여" readonly>
         </c:otherwise>
      </c:choose>
      </td>
   </tr>
   <tr>
      <td>나이</td>
      <td>
         <input type="text"name="age"size="10" value=${bvo.memberVO.age } readonly>
      </td>
   </tr>
   <tr>
      <td>주소</td>
      <td>
      <c:choose>
         <c:when test="${bvo.memberVO.location==1 }">
            <input type="text"name="height" value="서울"  size="10"readonly>
         </c:when>
             <c:when test="${bvo.memberVO.location==2 }">
            <input type="text"name="height" value="경기도"  size="10"readonly>
         </c:when>
             <c:when test="${bvo.memberVO.location==3}">
            <input type="text"name="height" value="전라북도"  size="10"readonly>
         </c:when>
             <c:when test="${bvo.memberVO.location==4 }">
            <input type="text"name="height" value="전라남도"  size="10"readonly>
         </c:when>
             <c:when test="${bvo.memberVO.location==5 }">
            <input type="text"name="height" value="경상남도"  size="10"readonly>
         </c:when>
             <c:when test="${bvo.memberVO.location==6 }">
            <input type="text"name="height" value="경상북도"  size="10"readonly>
         </c:when>
             <c:when test="${bvo.memberVO.location==7 }">
            <input type="text"name="height" value="충청남도"  size="10"readonly>
         </c:when>
             <c:when test="${bvo.memberVO.location==8 }">
            <input type="text"name="height" value="충청북도"  size="10"readonly>
         </c:when>
         <c:otherwise>
            <input type="text"name="height" value="강원도"  size="10"readonly>
         </c:otherwise>
      </c:choose>
      </td>
   </tr>
   <tr>
 <td>취미</td>
      <td>
      <c:choose>
         <c:when test="${bvo.memberVO.hobby=='인터넷' }">
            <input type="text"name="hobby" value="인터넷"  size="10"readonly>
         </c:when>
            <c:when test="${bvo.memberVO.hobby=='여행' }">
            <input type="text"name="hobby" value="여행"  size="10"readonly>
         </c:when>
            <c:when test="${bvo.memberVO.hobby=='게임' }">
            <input type="text"name="hobby" value="게임"  size="10"readonly>
         </c:when>
            <c:when test="${bvo.memberVO.hobby=='영화' }">
            <input type="text"name="hobby" value="영화"  size="10"readonly>
         </c:when>
         <c:otherwise>
                   <input type="text"name="hobby" value="운동"  size="10"readonly>
         </c:otherwise>
      </c:choose>
    </td>

   </tr>
      <tr>
      <td>키</td>
    <td>
        
      <c:choose>
         <c:when test="${bvo.memberVO.height==1 }">
            <input type="text"name="height" value="145~150"  size="10"readonly>cm
         </c:when>   
         <c:when test="${bvo.memberVO.height==2 }">
            <input type="text"name="height" value="150~155"  size="10"readonly>cm
         </c:when>   
         <c:when test="${bvo.memberVO.height==3 }">
            <input type="text"name="height" value="155~160"  size="10"readonly>cm
         </c:when>   
         <c:when test="${bvo.memberVO.height==4 }">
            <input type="text"name="height" value="160~165"  size="10"readonly>cm
         </c:when>   
         <c:when test="${bvo.memberVO.height==5 }">
            <input type="text"name="height" value="165~170"  size="10"readonly>cm
         </c:when>   
         <c:when test="${bvo.memberVO.height==6 }">
            <input type="text"name="height" value="170~175"  size="10"readonly>cm
         </c:when>   
         <c:when test="${bvo.memberVO.height==7 }">
            <input type="text"name="height" value="175~180"  size="10"readonly>cm
         </c:when>   
         <c:when test="${bvo.memberVO.height==8 }">
            <input type="text"name="height" value="180~185"  size="10"readonly>cm
         </c:when>   
         <c:otherwise>
         <input type="text"name="height" value="185~"  size="10"readonly>cm
         </c:otherwise>
      </c:choose>
    </td>

   </tr>
   <tr>
      <td>직업</td>
      <td>
      <input type = "text" name = "job" value=${bvo.memberVO.job } readonly>
      </td>
   </tr>
    <tr>
     <td>MBTI</td>
      <td>
        <input type = "text" name = "mbti" value=${bvo.memberVO.mbti } readonly size="10">
      </td>
   </tr>
   <tr>
       <td colspan="2"align="center">
       
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <c:choose>
              <c:when test="${requestScope.bvo.confirm==0 }">
                     <input type="button" value="수락" onclick="return okbtn()"> 
                    <input type="button" value="거절" onclick="return nobtn()">
                    <input type="button" value="찜목록" onclick="pokeListForm()">
                    <input type="button" value="홈" onclick="homeForm()">   
              </c:when>
              <c:when test="${requestScope.bvo.confirm==1 }">
                 <input type="button" value="찜목록" onclick="pokeListForm()">
                  <input type="button" value="홈" onclick="homeForm()">   
              </c:when>
              <c:otherwise>
                 <input type="button" value="찜목록" onclick="pokeListForm()">
                  <input type="button" value="홈" onclick="homeForm()">   
              </c:otherwise>
           </c:choose> 
   
          
       </td>
    </tr>
</table>
<br><br><br>
</form>
</div>
</body>
</html>