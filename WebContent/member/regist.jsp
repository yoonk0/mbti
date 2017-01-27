<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
 <script type="text/javascript">
   function register() {
   var id = document.registerForm.id;
    var password = document.registerForm.password;
   var cpass = document.registerForm.checkPass;
   var sex = document.registerForm.sex;
   var age = document.registerForm.age;
   var location = document.registerForm.location;
    var hobby = document.registerForm.hobby; 
    var height = document.registerForm.height; 
    var job = document.registerForm.job;  
    var ie = document.registerForm.ie;  
    var sn = document.registerForm.sn;  
    var tf = document.registerForm.tf;  
    var pj = document.registerForm.pj;  
    var kakao = document.registerForm.kakao;  
   var mbti = ie.value+sn.value+tf.value+pj.value;
   var pic = document.getElementById("uploadFile");
    var temp = "";
   if(id.value == ""){
      alert("아이디를 입력하세요!!");
      id.focus();
      return false;
   }if(password.value == ""){
      alert("비밀번호를 입력하세요!!");
      password.focus();
      return false;
   }if(cpass.value == ""){
      alert("비밀번호 확인란을 입력하세요!!");
      cpass.focus();
      return false;
   }if(password.value != cpass.value){
      alert("비밀번호 확인란과 비밀번호가 다릅니다.");
      cpass.focus();
      return false;
   }if(sex.value == ""){
      alert("성별을 체크하세요!!");
      return false;
   }if(age.value == ""){
      alert("나이를 입력하세요!!");
      age.focus();
      return false;
   }if(isNaN(age.value)||age.value<20){
      alert("나이는 20살이상부터 가능하며 숫자로만 입력해주세요!");
      return false;
   
   }if(location.value == ""){
      alert("위치를 선택하세요!!");
      location.focus();
      return false;
   }if(hobby.value==""){
       alert("취미를 선택해주세요");
       return false;
   }if(height.value==""){
       alert("키를 선택해주세요");
       return false;
   }if(job.value == ""){
      alert("직업을 입력하세요!!");
      return false;
   }if(kakao.value == ""){
         alert("카카오톡 아이디를 입력하세요!!");
         return false;
   }if(ie.value== ""||sn.value==""||tf.value==""||pj.value==""){
         alert("mbti를 모두 선택해 주세요!!");
         return false;
   }if(pic.value == ""){
	   alert("사진을 업로드 해주세요!");
	   return false; 
   }
  
   }
   
   function moveForm(){
	   window.open("https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC", "mbti", "resizable=true,toolbar=no,width=1200,height=800,left=400,top=150");
   }
</script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
function checkId() {
   var id = document.registerForm.id.value;
   if(id.length <= 3){
      document.getElementById("idcheck").innerHTML = "아이디는 3자 이상이어야 합니다.";
   }else{
      xhr=new XMLHttpRequest();
      xhr.onreadystatechange=callback;
      xhr.open("post", "${initParam.root}DispatcherServlet");
      xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
      xhr.send("command=idcheck&id="+id);
   }
}
function callback(){
     if(xhr.readyState==4){// 4 : 응답완료 
         if(xhr.status==200){// 200 : 정상수행
           var idViewComp = document.getElementById("idcheck");
           var json=JSON.parse(xhr.responseText);
         if(json.flag == "T"){
            document.getElementById("idcheck").innerHTML = "중복된아이디입니다.";
         }else{
            document.getElementById("idcheck").innerHTML = "사용 가능한 아이디 입니다.";
         }
        }
     }
}
$(document).ready(function(){ $(".header").load("${initParam.root}header/header.jsp") });

</script>
</head>
<body>
<div class = "header"></div>
<div class="jumbotron">
<form method="post" name = "registerForm" action="${initParam.root }DispatcherServlet?command=register" onsubmit="return register()" enctype="multipart/form-data">
<table cellpadding="5">
   <tr>
      <td colspan="2"><h2 style="font-size:50px">Register</h2></td>
   </tr>
   <tr>
      <td>아이디</td>
      <td><input type="text"name="id" id="id" onkeyup="checkId()">
      <span id="idcheck"></span></td>
   </tr>
   <tr>
      <td>패스워드</td>
      <td><input type="password"name="password"></td>
   </tr>
   <tr>
      <td>패스워드 확인</td>
      <td><input type="password"name="checkPass"></td>
   </tr>
   <tr>
      <td>성별</td>
      <td>
      남<input type="radio"name="sex"value="m">
      여<input type="radio"name="sex"value="f"></td>
   </tr>
   <tr>
      <td>나이</td>
      <td><input type="text"name="age"size="10"></td>
   </tr>
   <tr>
      <td>주소</td>
      <td>
<select name = "location">
   <option value = ""> --지역--</option>
   <option value = "1"> --서울--</option>
   <option value = "2"> --경기도--</option>
   <option value = "3"> --전라북도--</option>
   <option value = "4"> --전라남도--</option>
   <option value = "5"> --경상남도--</option>
   <option value = "6"> --경상북도--</option>
   <option value = "7"> --충청남도--</option>
   <option value = "8"> --충청북도--</option>
   <option value = "9"> --강원도--</option>
</select>
      </td>
   </tr>
   <tr>
      <td>취미</td>
      <td>인터넷<input type ="radio"name="hobby"value="인터넷">
      여행<input type ="radio"name="hobby"value="여행">
      게임<input type ="radio"name="hobby"value="게임">
      영화<input type ="radio"name="hobby"value="영화">
      운동<input type ="radio"name="hobby"value="운동"></td>
   </tr>
      <tr>
      <td>키</td>
    <td>
       <select name = "height">
   <option value = ""> --키--</option>
   <option value = "1"> 145~150</option>
   <option value = "2"> 150~155</option>
   <option value = "3"> 155~160</option>
   <option value = "4"> 160~165</option>
   <option value = "5"> 165~170</option>
   <option value = "6"> 170~175</option>
   <option value = "7"> 175~180</option>
   <option value = "8"> 180~185</option>
   <option value = "9"> 185~</option>
</select>
    </td>
   </tr>
   <tr>
      <td>직업</td>
      <td>
      <input type = "text" name = "job">
      </td>
   </tr>
   
     <tr>
      <td>카톡아이디</td>
      <td>
      <input type = "text" name = "kakao">
      </td>
   </tr>
   
    <tr>
      <td>MBTI</td>
      <td>
      <font size="5">
            <input type="radio" name="ie" value=i> I <input type="radio" name="ie" value=e> E <br>
            <input type="radio" name="sn" value=s> S <input type="radio" name="sn" value=n> N <br>
            <input type="radio" name="tf" value=t> T <input type="radio" name="tf" value=f> F <br>
            <input type="radio" name="pj" value=p> P <input type="radio" name="pj" value=j> J <br>
      </font>
      </td>
      <td><a onclick="moveForm()">MBTI 검사하러가기</a>
      </td>
   </tr>
   <tr>
   <td>
   사진     <input type="file" name="uploadFile" id="uploadFile"> 
   </td>
   </tr>
   <tr>
       <td colspan="2"align="center">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="submit" value="회원가입">
          <input type="button"value="다시쓰기"onclick="reset()">
       </td>
    </tr>
</table>
<br><br><br>
</form>
</div>
</body>
</html>