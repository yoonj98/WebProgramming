<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyle.css">
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<style>
   .layer {
   display:flex;
   justify-content: center;
   align-items: center;
   }
   label {
      float: left;
      clear: left;
      width: 7em;
   }   
</style>
</head>
<body bgcolor='#F8F8F8'>
<% if (session.getAttribute("id") == null){ %>
	<div style="height:auto; width:auto; padding:12px; background-color: #7aa5d2 !important;">
		<div style="height: auto; width: 100%; text-align : right; word-spacing: 25px; padding:3px; ">
			<a href="front.jsp" style="float : left"><img src="image/logo.png" height=auto></a>
			<a id = "menu" href="find.jsp"><font color="white">룸메이트찾기 </font></a>
			<a href="login.jsp"><font color="white">룸메이트등록 </font></a>	<%--login X -> login page --%>
			<a href="notice_list.jsp"><font color="white">공지사항</font></a>
			<a href="login.jsp"><font color="white">마이페이지</font></a>	<%--login X -> login page --%>
			<a href="login.jsp"><font color="white">로그인 </font></a>
		</div>
    </div>
	<%}else{%>
	<div style="height:auto; width:auto; padding:12px; background-color: #7aa5d2 !important;">
		<div style="height: auto; width: 100%; text-align : right; word-spacing: 25px;padding:5px;" >
			<a href="front.jsp" style="float : left"><img src="image/logo.png" height=auto></a>
			<a id = "menu" href="find.jsp"><font color="white">룸메이트찾기 </font></a>
			<a href="enrollment.jsp"><font color="white">룸메이트등록 </font></a>
			<a href="notice_list.jsp"><font color="white">공지사항 </font> </a>
			<a href="mypage.jsp"><font color="white">마이페이지 </font> </a>
			<form method="post" action="logout.jsp" >
			<font color="white"><%=session.getAttribute("id") %>님  </font>
				<input type="submit" value="로그아웃"/>
			</form>
		</div>
	</div>	
	<%} %>
     <h2 style=" text-align : center;"> 회원 탈퇴 </h2><br>
    <div style=" width:13%; height:180px; float:left; margin:0px 40px 0px 0px;border:2px solid #ddd; border-radius: 20px;background-color:white">
       <div style="margin:10px 0px 0px 0px; text-align:center;">
       <a href="mypage.jsp">프로필 수정</a><br><br>
       <a href="usermodify.jsp" >회원정보 수정</a><br><br>
       <a href="housetouruser.jsp" >하우스 투어 회원 확인</a><br><br>
       <a href="withdraw.jsp" >회원 탈퇴</a><br>
       </div>
    </div>
		<div style="height:auto; width:50%; margin : auto; ">
	      <div style="height:80px; width:60%;border:2px solid #7aa5d2; margin : auto; padding: 80px 0; border-radius: 40px;background-color:white">
	         <div class="layer">
				<form action="./withdraw_serv" method="post" style="display:inline-block;">                                  
		            <label>비밀번호 </label>
		            <input id ="passwd" type="password" name="passwd"><br><br><br>
		            <input type="submit" value="확인" style="width:100px; height:30px; margin:auto; border:2px solid lightgray; background-color:lightgray; float:right;"><%--로그인하여 front.jsp로 이동(세션) --%>                          <%--register.jsp로 이동 --%>   
		         </form>   
		    </div>
			</div>
		</div>
   </div>
</body>
</html>