<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${initParam.root }/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<title>update</title>
<script type="text/javascript" src="jquery-1.12.3.min.js"></script>
<script type="text/javascript">
	function register(){
		var p=document.memberUpdateForm.pass.value;
		var pcheck=document.memberUpdateForm.checkPass.value;
		var m=document.memberUpdateForm;
		if(p!=pcheck){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		if(m.location.value==""){
			alert("지역을 선택하지 않았습니다.");
			return false;
		}
		if(m.height.value==""){
			alert("키를 선택하지 않았습니다.");
			return false;
		}		
	}
	function clickForm(){
		location.href="${initParam.root}DispatcherServlet?command=showDetail&id=${bvo.id }";
	}
	
	$(document).ready(function(){ $(".header").load("${initParam.root}header/header.jsp") });

</script>
</head>
<body onload="abcd()">
<div class = "header"></div>
<div class="jumbotron">
<form action="${initParam.root}DispatcherServlet?command=memberUpdate" method="post" enctype="multipart/form-data" name = "memberUpdateForm" onsubmit="return register()">
<table cellpadding="3">
   <tr>
      <td colspan="2"><h2 style="font-size:50px">Update</h2></td>
   </tr>
   <tr>
   	<td>사진	</td>
   	<td>      <div style="width: 150px; height: 120px; overflow: hidden" >
    <img src="${initParam.root }/img/${sessionScope.login.picture}" style="width: 120px; height: 120px; margin-left: 20px;  border-radius: 100px; left: 220px;">
   </div><br>
   	</td>
   	<td><input type="file" name="uploadFile" id="uploadFile" > </td>
   </tr>
   <tr>
      <td>아이디</td>
      <td><input type="text"name="id" value="${bvo.id }" readonly></td>
   </tr>
   <tr>
      <td>패스워드</td>
      <td><input type="password"name="pass" value=${bvo.password }></td>
      <td><span id="passView"></span></td>
   </tr>
   <tr>
      <td>패스워드 확인</td>
      <td><input type="password"name="checkPass"></td>
   </tr>
   <tr>
      <td>성별</td>
      <td>
      <c:choose>
      	<c:when test="${bvo.gender=='m' }">
      		남<input type="radio"name="gender"value="m" checked>
      		여<input type="radio"name="gender"value="f" >
      	</c:when>
      	<c:otherwise>
      		남<input type="radio"name="gender"value="m" >
      		여<input type="radio"name="gender"value="f" checked>
      	</c:otherwise>
      </c:choose>
      </td>
   </tr>
   <tr>
      <td>나이</td>
      <td><input type="text"name="age"size="10" value=${bvo.age }></td>
   </tr>
   <tr>
      <td>주소</td>
      <td>
 		<c:choose>
 			<c:when test="${bvo.location==1 }">
 				<select name = "location">
					<option value = "" > --지역--</option>
					<option value = "1"  selected> --서울--</option>
					<option value = "2"> --경기도--</option>
					<option value = "3"> --전라북도--</option>
					<option value = "4"> --전라남도--</option>
					<option value = "5" > --경상남도--</option>
					<option value = "6"> --경상북도--</option>
					<option value = "7"> --충청남도--</option>
					<option value = "8"> --충청북도--</option>
					<option value = "9"> --강원도--</option>
				</select>
 			</c:when>
 			<c:when test="${bvo.location==2 }">
 				<select name = "location">
					<option value = "" > --지역--</option>
					<option value = "1"  > --서울--</option>
					<option value = "2" selected> --경기도--</option>
					<option value = "3"> --전라북도--</option>
					<option value = "4"> --전라남도--</option>
					<option value = "5" > --경상남도--</option>
					<option value = "6"> --경상북도--</option>
					<option value = "7"> --충청남도--</option>
					<option value = "8"> --충청북도--</option>
					<option value = "9"> --강원도--</option>
				</select>
 			</c:when>
 			<c:when test="${bvo.location==3 }">
 				<select name = "location">
					<option value = "" > --지역--</option>
					<option value = "1"  > --서울--</option>
					<option value = "2" > --경기도--</option>
					<option value = "3" selected> --전라북도--</option>
					<option value = "4"> --전라남도--</option>
					<option value = "5" > --경상남도--</option>
					<option value = "6"> --경상북도--</option>
					<option value = "7"> --충청남도--</option>
					<option value = "8"> --충청북도--</option>
					<option value = "9"> --강원도--</option>
				</select>
 			</c:when>
 			<c:when test="${bvo.location==4 }">
 				<select name = "location">
					<option value = "" > --지역--</option>
					<option value = "1"  > --서울--</option>
					<option value = "2" > --경기도--</option>
					<option value = "3" > --전라북도--</option>
					<option value = "4"selected> --전라남도--</option>
					<option value = "5" > --경상남도--</option>
					<option value = "6"> --경상북도--</option>
					<option value = "7"> --충청남도--</option>
					<option value = "8"> --충청북도--</option>
					<option value = "9"> --강원도--</option>
				</select>
 			</c:when>
 			<c:when test="${bvo.location==5 }">
 				<select name = "location">
					<option value = "" > --지역--</option>
					<option value = "1"  > --서울--</option>
					<option value = "2" > --경기도--</option>
					<option value = "3" > --전라북도--</option>
					<option value = "4"> --전라남도--</option>
					<option value = "5" selected> --경상남도--</option>
					<option value = "6" > --경상북도--</option>
					<option value = "7"> --충청남도--</option>
					<option value = "8"> --충청북도--</option>
					<option value = "9"> --강원도--</option>
				</select>
 			</c:when>
 			<c:when test="${bvo.location==6 }">
 				<select name = "location">
					<option value = "" > --지역--</option>
					<option value = "1"  > --서울--</option>
					<option value = "2" > --경기도--</option>
					<option value = "3" > --전라북도--</option>
					<option value = "4"> --전라남도--</option>
					<option value = "5" > --경상남도--</option>
					<option value = "6" selected> --경상북도--</option>
					<option value = "7"> --충청남도--</option>
					<option value = "8"> --충청북도--</option>
					<option value = "9"> --강원도--</option>
				</select>
 			</c:when>
 			<c:when test="${bvo.location==7 }">
 				<select name = "location">
					<option value = "" > --지역--</option>
					<option value = "1"  > --서울--</option>
					<option value = "2" > --경기도--</option>
					<option value = "3" > --전라북도--</option>
					<option value = "4"> --전라남도--</option>
					<option value = "5" > --경상남도--</option>
					<option value = "6" > --경상북도--</option>
					<option value = "7" selected> --충청남도--</option>
					<option value = "8"> --충청북도--</option>
					<option value = "9"> --강원도--</option>
				</select>
 			</c:when>
 			<c:when test="${bvo.location==8 }">
 				<select name = "location">
					<option value = "" > --지역--</option>
					<option value = "1"  > --서울--</option>
					<option value = "2" > --경기도--</option>
					<option value = "3" > --전라북도--</option>
					<option value = "4"> --전라남도--</option>
					<option value = "5" > --경상남도--</option>
					<option value = "6" > --경상북도--</option>
					<option value = "7" > --충청남도--</option>
					<option value = "8" selected> --충청북도--</option>
					<option value = "9"> --강원도--</option>
				</select>
 			</c:when>
 			<c:otherwise>
 				<select name = "location">
					<option value = "" > --지역--</option>
					<option value = "1"  > --서울--</option>
					<option value = "2" > --경기도--</option>
					<option value = "3" > --전라북도--</option>
					<option value = "4"> --전라남도--</option>
					<option value = "5" > --경상남도--</option>
					<option value = "6" > --경상북도--</option>
					<option value = "7" > --충청남도--</option>
					<option value = "8" > --충청북도--</option>
					<option value = "9"selected> --강원도--</option>
				</select>
 			</c:otherwise>
 		</c:choose>

      </td>
   </tr>
   <tr>
 <td>취미</td>
      <td>
      <c:choose>
      	<c:when test="${bvo.hobby=='인터넷' }">
      		 인터넷<input type ="radio"name="hobby"value="인터넷" checked>
		      여행<input type ="radio"name="hobby"value="여행">
		      게임<input type ="radio"name="hobby"value="게임">
		      영화<input type ="radio"name="hobby"value="영화">
		      운동<input type ="radio"name="hobby"value="운동">
      	</c:when>
      	<c:when test="${bvo.hobby=='여행' }">
      		 인터넷<input type ="radio"name="hobby"value="인터넷" >
		      여행<input type ="radio"name="hobby"value="여행" checked>
		      게임<input type ="radio"name="hobby"value="게임">
		      영화<input type ="radio"name="hobby"value="영화">
		      운동<input type ="radio"name="hobby"value="운동">
      	</c:when>
      	<c:when test="${bvo.hobby=='게임' }">
      		 인터넷<input type ="radio"name="hobby"value="인터넷" >
		      여행<input type ="radio"name="hobby"value="여행">
		      게임<input type ="radio"name="hobby"value="게임" checked>
		      영화<input type ="radio"name="hobby"value="영화">
		      운동<input type ="radio"name="hobby"value="운동">
      	</c:when>
      	<c:when test="${bvo.hobby=='영화' }">
      		 인터넷<input type ="radio"name="hobby"value="인터넷" >
		      여행<input type ="radio"name="hobby"value="여행">
		      게임<input type ="radio"name="hobby"value="게임">
		      영화<input type ="radio"name="hobby"value="영화" checked>
		      운동<input type ="radio"name="hobby"value="운동">
      	</c:when>
      	 	<c:when test="${bvo.hobby=='운동' }">
      		 인터넷<input type ="radio"name="hobby"value="인터넷" >
		      여행<input type ="radio"name="hobby"value="여행">
		      게임<input type ="radio"name="hobby"value="게임">
		      영화<input type ="radio"name="hobby"value="영화" >
		      운동<input type ="radio"name="hobby"value="운동" checked>
      	</c:when>
      </c:choose>

      
      </td>

   </tr>
      <tr>
      <td>키</td>
	 <td>

	 	<c:choose>
	 		<c:when test="${bvo.height==1}">
	 			<select name = "height">
					<option value = ""> --키--</option>
					<option value = "1" selected > 145~150</option>
					<option value = "2"> 150~155</option>
					<option value = "3"> 155~160</option>
					<option value = "4"> 160~165</option>
					<option value = "5"> 165~170</option>
					<option value = "6"> 170~175</option>
					<option value = "7"> 175~180</option>
					<option value = "8"> 180~185</option>
					<option value = "9"> 185~</option>
				</select>
	 		</c:when>
	 		<c:when test="${bvo.height==2}">
	 			<select name = "height">
					<option value = ""> --키--</option>
					<option value = "1"  > 145~150</option>
					<option value = "2" selected> 150~155</option>
					<option value = "3"> 155~160</option>
					<option value = "4"> 160~165</option>
					<option value = "5"> 165~170</option>
					<option value = "6"> 170~175</option>
					<option value = "7"> 175~180</option>
					<option value = "8"> 180~185</option>
					<option value = "9"> 185~</option>
				</select>
	 		</c:when>
	 		<c:when test="${bvo.height==3}">
	 			<select name = "height">
					<option value = ""> --키--</option>
					<option value = "1"  > 145~150</option>
					<option value = "2" > 150~155</option>
					<option value = "3" selected> 155~160</option>
					<option value = "4"> 160~165</option>
					<option value = "5"> 165~170</option>
					<option value = "6"> 170~175</option>
					<option value = "7"> 175~180</option>
					<option value = "8"> 180~185</option>
					<option value = "9"> 185~</option>
				</select>
	 		</c:when>
	 		<c:when test="${bvo.height==4}">
	 			<select name = "height">
					<option value = ""> --키--</option>
					<option value = "1"  > 145~150</option>
					<option value = "2" > 150~155</option>
					<option value = "3"> 155~160</option>
					<option value = "4" selected> 160~165</option>
					<option value = "5"> 165~170</option>
					<option value = "6"> 170~175</option>
					<option value = "7"> 175~180</option>
					<option value = "8"> 180~185</option>
					<option value = "9"> 185~</option>
				</select>
	 		</c:when>
	 		<c:when test="${bvo.height==5}">
	 			<select name = "height">
					<option value = ""> --키--</option>
					<option value = "1"  > 145~150</option>
					<option value = "2" > 150~155</option>
					<option value = "3"> 155~160</option>
					<option value = "4"> 160~165</option>
					<option value = "5" selected> 165~170</option>
					<option value = "6"> 170~175</option>
					<option value = "7"> 175~180</option>
					<option value = "8"> 180~185</option>
					<option value = "9"> 185~</option>
				</select>
	 		</c:when>
	 		<c:when test="${bvo.height==6}">
	 			<select name = "height">
					<option value = ""> --키--</option>
					<option value = "1"  > 145~150</option>
					<option value = "2" > 150~155</option>
					<option value = "3"> 155~160</option>
					<option value = "4"> 160~165</option>
					<option value = "5"> 165~170</option>
					<option value = "6" selected> 170~175</option>
					<option value = "7"> 175~180</option>
					<option value = "8"> 180~185</option>
					<option value = "9"> 185~</option>
				</select>
	 		</c:when>
	 		<c:when test="${bvo.height==7}">
	 			<select name = "height">
					<option value = ""> --키--</option>
					<option value = "1"  > 145~150</option>
					<option value = "2" > 150~155</option>
					<option value = "3"> 155~160</option>
					<option value = "4"> 160~165</option>
					<option value = "5"> 165~170</option>
					<option value = "6"> 170~175</option>
					<option value = "7" selected> 175~180</option>
					<option value = "8"> 180~185</option>
					<option value = "9"> 185~</option>
				</select>
	 		</c:when>
	 		<c:when test="${bvo.height==8}">
	 			<select name = "height">
					<option value = ""> --키--</option>
					<option value = "1"  > 145~150</option>
					<option value = "2" > 150~155</option>
					<option value = "3"> 155~160</option>
					<option value = "4"> 160~165</option>
					<option value = "5"> 165~170</option>
					<option value = "6"> 170~175</option>
					<option value = "7"> 175~180</option>
					<option value = "8" selected> 180~185</option>
					<option value = "9"> 185~</option>
				</select>
	 		</c:when>
	 		<c:otherwise>
	 		<select name = "height">
					<option value = ""> --키--</option>
					<option value = "1"  > 145~150</option>
					<option value = "2" > 150~155</option>
					<option value = "3"> 155~160</option>
					<option value = "4"> 160~165</option>
					<option value = "5"> 165~170</option>
					<option value = "6"> 170~175</option>
					<option value = "7"> 175~180</option>
					<option value = "8"> 180~185</option>
					<option value = "9" selected> 185~</option>
				</select>
	 		</c:otherwise>
	 	</c:choose> 
	 	
	 </td>
   </tr>
   <tr>
      <td>직업</td>
      <td>
      <input type = "text" name = "job" value=${bvo.job }>
      </td>
   </tr>
   
     <tr>
      <td>카톡아이디</td>
      <td>
      <input type = "text" name = "kakao" value=${bvo.kakao }>
      </td>
   </tr>
   
    <tr>
      <td>MBTI</td>
      <td>
      <font size="5">
     <%--  ${fn:contains(bvo.mbti,'i')} --%>
       
      <c:choose>
      	<c:when test=" ${bvo.mbti.contains('i') }">
      			 <input type="radio" name="ie" value=i checked> I  <input type="radio" name="ie" value=e> E <br>
      	</c:when>
      <c:otherwise>
      		<input type="radio" name="ie" value=i > I <input type="radio" name="ie" value=e checked> E <br>
      </c:otherwise>
      	 	</c:choose>
       <c:choose>
      	<c:when test="${bvo.mbti.contains('s') }">
      			   <input type="radio" name="sn" value=s checked> S <input type="radio" name="sn" value=n> N <br>
      	</c:when>
      	<c:otherwise>
      		  <input type="radio" name="sn" value=s> S <input type="radio" name="sn" value=n checked> N <br>
      	</c:otherwise>
      	 	</c:choose>
       <c:choose>
      	<c:when test="${bvo.mbti.contains('t') }">
      			      <input type="radio" name="tf" value=t checked> T <input type="radio" name="tf" value=f> F <br>
      	</c:when>
      	<c:otherwise>
      		     <input type="radio" name="tf" value=t> T <input type="radio" name="tf" value=f checked> F <br>
      	</c:otherwise>
      	 	</c:choose>
       <c:choose>
      	<c:when test="${bvo.mbti.contains('p') }">
      			       <input type="radio" name="pj" value=p checked> P <input type="radio" name="pj" value=j> J <br>
      	</c:when>
      	<c:otherwise>
      		     <input type="radio" name="pj" value=p> P <input type="radio" name="pj" value=j checked> J <br>
      </c:otherwise>
      </c:choose>
      
      </font>
      </td>
   </tr>
   
   <tr>
       <td colspan="2"align="center">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="submit" value="수정">
          <input type="button"value="취소"  onclick="clickForm()">
       </td>
    </tr>
</table>
</form>
</div>
</body>
</html>