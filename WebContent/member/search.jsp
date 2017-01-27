<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${initParam.root}css/bootstrap.css">
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"
   rel="stylesheet">
   
<title>search</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
   
   $(document).ready(function() {
      var t = [];
      var pageNo = 1; 
      var list = []; 
      var seId = '${sessionScope.login.id}';	//logged in user id
      var startPage; 
      var endPage; 
      
      //helper function that checks the existing list of people user have sent the pokes to 
      function sendList(){
         $.ajax({
            type : "get",
            url : "${initParam.root}DispatcherServlet?command=pokeSe2",
            data : "id="+seId,
            dataType : "json",
            success : function(data) {
               if(data.length != 0){
               for(var i=0; i<data.length; i++){
                  list.push(data[i].reId);
   
               }
               }
            }
      });
      }
      
     
      
      //helper function that will request a search result according to the search form 
      function ajax(){
         $.ajax({
            type : "get",
            url : "${initParam.root}DispatcherServlet?command=search",
            data : $("#s").serialize() + "&mbti=" + t +"&id="+seId+"&pageNo="+pageNo,
            dataType : "json",
            success : function(data) {
               var info = "";
               var flag = false;	
             
               for (var i = 0; i < data.list.length; i++) { 
                if(data.list[i].page == pageNo){
	                  info += "<tr><td class = 'p'>" + "<div style = 'max-width: 100%; height:auto; overflow:hidden'>"+"<img src='${initParam.root}img/"+data.list[i].picture +"' style='width: 120px; height: 120px; margin-left: 20px;  border-radius: 100px; left: 220px;'>"+"</div>"+ "</td>";
	                  info += "<td id="+data.list[i].id+">" + data.list[i].id + "</td>";
	                  info += "<td>" + data.list[i].age + "</td>";
	                  info += "<td>";
	                  switch(data.list[i].location){
		                  case '1': info += " 서울"; break;
		                  case '2': info += " 경기도"; break;
		                  case '3': info += " 전라북도"; break;
		                  case '4': info += " 전라남도"; break;
		                  case '5': info += " 경상남도"; break;
		                  case '6': info += " 경상북도"; break;
		                  case '7': info += " 충청남도"; break;
		                  case '8': info += " 충청북도"; break;
		                  case '9': info += " 강원도"; break;
	                  }
	  					    info += "</td>";
	               
	                  info += "<td>" + data.list[i].mbti + "</td>";
	                  
	                  if(list.length !=0){
		                  for(var j=0; j<list.length; j++){
		                     if(list[j]==data.list[i].id){
		                    	 
		                        flag = true; 
		                        break;
		                     }else{
		                        flag = false; 
		                     }
		                  }
	                  }
	                  
	                  //If in the existing list of pokes, filled heart is displayed  
	                  if(flag == true){
	                        info += "<td><span class='glyphicon glyphicon-heart'></span></td><br></tr>";      
	                  }else{
	                        info += "<td><span class='glyphicon glyphicon-heart-empty'></span></td><br></tr>";
	                        
	                  }    
	                  
	                  info += "<tr class = 'd' style='display:none; background-color:#f5f5f5'>";
	                  info += "<td colspan =2></td><td colspan=1>";
	                  info += "성별: "+data.list[i].gender+"<br>직업: "+data.list[i].job+"</td>";
	                  info += "<td colspan = 3>취미: "+data.list[i].hobby+"<br>키:";
	                  
	                  switch(data.list[i].height){
		                  case 1: info += " 145~150"; break;
		                  case 2: info += " 150~155"; break;
		                  case 3: info += " 155~160"; break;
		                  case 4: info += " 160~165"; break;
		                  case 5: info += " 165~170"; break;
		                  case 6: info += " 170~175"; break;
		                  case 7: info += " 175~180"; break;
		                  case 8: info += " 180~185"; break;
		                  case 9: info += " 185~"; break;
	                  }
	                  info += "</td></tr>";
                  }
               }
               
               $("#info").html(info);
               
               //this part takes care of paging 
               var paging = "";
               if(data.pagingBean.previousPageGroup){
                  paging += "<a class = 'back'>◀</a>&nbsp;&nbsp;";
                  startPage = data.pagingBean.startPageOfPageGroup;
               }
               
               for(var i=data.pagingBean.startPageOfPageGroup; i<= data.pagingBean.endPageOfPageGroup; i++){
                 if(pageNo == i){
                    paging += i+"&nbsp;&nbsp;"; 
                 }else{
                paging += "<a class = 'page'>"+i+"</a>&nbsp;&nbsp;";
                 }
               } 
	            if(data.pagingBean.nextPageGroup){
	                   paging += "<a class = 'forward'>▶</a>&nbsp;&nbsp;";
	                   endPage = data.pagingBean.endPageOfPageGroup;
	                }
	           
	            $("#paging").html(paging); 
	            }
         });
      }
      
      sendList(); 			//request the poke list for the user id
      ajax(); 				//request search result containing all users 
      
      
      //Below handles changes in the form and calls ajax function everytime a change has been made
      $(":button[name=mbti]").toggle(function() {
         pageNo = 1;
         $(this).css("background", "black");
         t.push($(this).val());
         ajax();
      }, function() {
         pageNo = 1;
         $(this).css("background", "grey");
         var removeItem = $(this).val()
         t = $.grep(t, function(data) {
            return data != removeItem;
         });
         ajax();
      });
      
      $(".age,.location").change(function() {
         pageNo = 1;
         ajax();
      });
      
      $("#paging").on("click",".page",function(){         
            pageNo = $(this).text(); 
            ajax();
      });
      
      $("#paging").on("click",".back",function(){         
          pageNo = startPage -1;
          ajax();
      });
      
      $("#paging").on("click",".forward",function(){         
          pageNo = endPage +1;
          ajax();
   	  });
      
      //Displays the details part
      $(".table tbody").on("click","tr",function(){
         $(this).next(".d").toggle();
      });

	  //click heart glyphicon to send poke
      $(".table tbody").on("click","span",function(){
	         var flag = false; 
	         var id = $(this).parent().siblings().eq(1).text();
	         if(list.length !=0){
		         for(var j=0; j<list.length; j++){
			            if(list[j]==id){
			               flag = true; 
			               break;
			            }else{
			               flag = false;
			            }
		          }
	         }
	         if(flag == false){
	         if(confirm("send a poke?")){
	         	var test = $(this); 
	            $.ajax({
	               type : "get",
	               url : "${initParam.root}DispatcherServlet?command=pokeInsert",
	               data : "se_Id="+seId+"&re_Id="+$(this).parent().siblings().eq(1).text(),
	               dataType : "json",
	               success : function(data){
	                  $(test).removeClass('glyphicon glyphicon-heart-empty').addClass('glyphicon glyphicon-heart');   
	                  sendList();
	               }
                });
	         }
	         }
      });
   
      //toggle between filled hearted and empty heart on mouse enter/leave
      $(".table tbody").on("mouseenter","span",function(){
	      var flag = false; 
	      var id = $(this).parent().siblings().eq(1).text();
	      if(list.length !=0){
		      for(var j=0; j<list.length; j++){
		         if(list[j]==id){
		            flag = true; 
		            break;
		         }else{
		            flag = false;
		         }
	      	  }
	      }
	      if(flag == false){
	            $(this).removeClass('glyphicon glyphicon-heart-empty').addClass('glyphicon glyphicon-heart');   
	      }
      });

      //toggle between filled hearted and empty heart on mouse enter/leave
      $(".table tbody").on("mouseleave","span",function(){
         var flag = false; 
         var id = $(this).parent().siblings().eq(1).text();
         if(list.length !=0){
	         for(var j=0; j<list.length; j++){
	            if(list[j]==id){
	               flag = true; 
	               break;
	            }else{
	               flag = false;
	            }
	         }
         }
         if(flag == false){
               $(this).removeClass('glyphicon glyphicon-heart').addClass('glyphicon glyphicon-heart-empty');   
         }
         });   
      
      //reset all changes to the form 
      $("#reset").click(function(){
         $(".age,.location").val("");
         $(":button[name=mbti]").css("background", "grey");
         t = [];
         ajax();
      });
   
   });
      
</script>
</head>
<body>

   <div class="jumbotron">
      <form action="${initParam.root}DispatcherServlet" name="searchForm" id="s">
         <table cellpadding="20">
            <tr>
               <td colspan="2"><h2 style="font-size: 50px">Search</h2></td>
            </tr>
            <tr>
               <td>나이</td>
               <td><select class="age" name="age">
                     <option value="">--나이--</option>
                     <option value="20">--20~24--</option>
                     <option value="25">--25~29--</option>
                     <option value="30">--30~34--</option>
                     <option value="35">--35~40--</option>
                     <option value="40">--40~--</option>
               </select></td>
            <tr>
               <td>지역</td>
               <td><select class="location" name="location">
                     <option value="">--지역--</option>
                     <option value="1">--서울--</option>
                     <option value="2">--경기도--</option>
                     <option value="3">--전라북도--</option>
                     <option value="4">--전라남도--</option>
                     <option value="5">--경상남도--</option>
                     <option value="6">--경상북도--</option>
                     <option value="7">--충청남도--</option>
                     <option value="8">--충청북도--</option>
                     <option value="9">--강원도--</option>
               </select></td>
            </tr>
            <tr>
               <td>MBTI</td>
               <td><input type="button" name="mbti" class="btn btn-default"
                  value="i"> <input type="button" name="mbti"
                  class="btn btn-default" value="n"> <input type="button"
                  name="mbti" class="btn btn-default" value="f"> <input
                  type="button" name="mbti" class="btn btn-default" value="p">
            </tr>

            <tr>
               <td></td>
               <td><input type="button" name="mbti" class="btn btn-default"
                  value="e"> <input type="button" name="mbti"
                  class="btn btn-default" value="s"> <input type="button"
                  name="mbti" class="btn btn-default" value="t"> <input
                  type="button" name="mbti" class="btn btn-default" value="j">
                  <!-- <input type="hidden" name="mbtiList" value=""> --></td>
            </tr>

            <tr>
               <td></td>
               <td><input type="button" id = "reset" value="Reset">
                  <!-- <input type="hidden" name="command" value="search">
                  <input type="hidden" name = "pageNo" value ="1"> --></td>
            </tr>
         </table>
         <br> <br>
      </form>
      <br>
      <br>
   </div>
</body>
</html>