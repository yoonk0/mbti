<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
   isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${initParam.root}css/bootstrap.css">
<title>글목록</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
	   $(".header").load("${initParam.root}header/header.jsp");
	   
      $("#rePoke").click(function(){
         $.ajax({
          type:"get",
         url:"${initParam.root}DispatcherServlet",
         data:"command=pokeRe&id=${sessionScope.login.id}",
         dataType:"json",
         success:function(data){
            var str = "";
            var str2 = "";
               str2 += "<tr>";
               str2 += "<th>나를 찜한 사람</th>";
               str2 += "<th>확인</th>";
               str2 += "</tr>";
            $("#thead").html(str2);   
            for(var i=0;i<data.length;i++){
               str += "<tr class='info'><td><a href=${initParam.root}DispatcherServlet?command=pokedetail&id="+data[i].seId+">" + data[i].seId+"</a></td>";
               if(data[i].confirm == 0){
                  str += "<td>도착~</td>";
               }else if(data[i].confirm == 1){
                  str += "<td>"+data[i].memberVO.kakao+"</td>";
               }else{
                  str += "<td>후잉후잉 다음에 만나요~</td>";
               }
               str += "</tr>";
            }//for
            $("#pokeView").html(str);
            $("#acceptPoke").click(function(){
               alert(1);
            });
         }//succes
         });
      });//click
      $("#sePoke").click(function(){
          $.ajax({
           type:"get",
          url:"${initParam.root}DispatcherServlet",
          data:"command=pokeSe&id=${sessionScope.login.id}",
          dataType:"json",
          success:function(data){
             var str = "";
             var str2 = "";                           
                str2 += "<tr>";
                str2 += "<th>내가 찜한 사람</th>";
                str2 += "<th>상태</th>";
                str2 += "</tr>";
             $("#thead").html(str2);   
             for(var i=0;i<data.length;i++){
                str += "<tr class='info'><td><a href=${initParam.root}DispatcherServlet?command=pokedetail2&id="+data[i].reId+">" + data[i].reId+"</a></td>";
                if(data[i].confirm == 0){
                   str += "<td>상대방이 확인중입니다</td>";
                }else if(data[i].confirm == 1){
                   str += "<td>"+data[i].memberVO.kakao+"</td>";
                }else{
                   str += "<td>후잉후잉 다른 인연을 찾아보아요</td>";
                }
                str +="</tr>";
             }//for
             $("#pokeView").html(str);
          }//succes
          });
       });//click
       
    	 
      
   });//ready
</script>
</head>
<body>
   <div class = "header"></div>
   <div class="jumbotron">
      <table class="table table-striped table-hover ">
         <caption><input type="button" value="받은 찜 목록" id="rePoke">
         <input type="button" value="보낸 찜 목록" id="sePoke"></caption>
         
         <thead id="thead">

         </thead>
         <tbody id="pokeView">
            
         </tbody>
      </table>
      <br></br>
   </div>
</body>
</html>








