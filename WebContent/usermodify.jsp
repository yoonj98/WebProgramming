<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="mystyle.css">
<title> 회원정보 수정 </title>
<style type="text/css">
   .layer {
      display:flex;
      justify-content: center;
      align-items: center;
   }
   .layer1 {
       position: fixed;
       top: 44%;
       left: 45%;
       -webkit-transform: translate(-50%, -50%);
       transform: translate(-50%, -50%);
   }
   .layer2 {
       position: fixed;
       top: 40%;
       left: 83%;
       -webkit-transform: translate(-50%, -50%);
       transform: translate(-50%, -50%);
   }   
   label {
      float: left;
      clear: left;
      width: 8em;
   }
   form{
      display:inline;
      margin:0px;
      padding:0px;
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
	<%}  %>
     <h2 style=" text-align : center;"> 회원 정보 수정 </h2><br>
    <div style=" width:13%; height:180px; float:left; margin:0px 40px 0px 0px;border:2px solid #ddd; border-radius: 20px;background-color:white">
       <div style="margin:10px 0px 0px 0px; text-align:center;">
       <a href="mypage.jsp">프로필 수정</a><br><br>
       <a href="usermodify.jsp" >회원정보 수정</a><br><br>
       <a href="housetouruser.jsp" >하우스 투어 회원 확인</a><br><br>
       <a href="withdraw.jsp" >회원 탈퇴</a><br>
       </div>
    </div>
   <div style="height:auto; width:50%; margin : auto; ">
      <div style="height:350px; width:100%;border:2px solid #7aa5d2; margin : auto; border-radius: 40px;background-color:white">
         <div class="layer">
            <form action="./user_modify" method="post"><br><br><br>                                       
               <label> 아이디 </label>
               <%=session.getAttribute("id") %></p>
               <label>E-mail </label>
               <%=session.getAttribute("e_mail") %></p>
               <label>비밀번호 </label>
               <input type="password" name="passwd" ><br><br>
               <label>이름 </label>
               <%=session.getAttribute("name") %>
               (<%=session.getAttribute("sex") %>)<p>
               <label>전화번호 </label>
               <input type="text" name="phone" value=<%=session.getAttribute("phone") %>><br><br><br>
               <input type="submit" value="수정" style="width:100px; height:30px; margin:auto; border:2px solid lightgray; background-color:lightgray;"><br>
            </form>   
         </div>   
      </div>
   </div>
</body>
</html>