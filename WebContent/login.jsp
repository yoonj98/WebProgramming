<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyle.css">
<meta charset="UTF-8">
<title>로그인</title>
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
<!-- 웹 페이지 크기 및 위치 자동 고정하기 -->
<script>
function login() { //중복체크
	var frm=document.logins;
	var url = "./login_serv?user_id=" + frm.user_id+"&user_pw=" + frm.user_pw;
	
	  window.open(url,"","width=10px,height=10px");
}
</script>
</head>
<body bgcolor='#F8F8F8'>
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
   <br>
   <div style="height:auto; width:50%; margin : auto;">
      <h2 style="text-align:center;"> 로그인 </h2><br>
      <div style="height:180px; width:100%;border:2px solid #7aa5d2; margin : auto; border-radius: 40px;background-color:white" class="layer">
         <form name="logins" action="./login_serv" method="post" style="display:inline-block;">                  
            <label>아이디 </label>
                <input id = "loginbox" type="text" name="user_id"><br><br>                
            <label>비밀번호 </label>
            <input id = "loginbox" type="password" name="user_pw"><br><br>
            <input type="submit" value="로그인" style="width:100px; height:30px; margin:auto; border:2px solid lightgray; background-color:lightgray;">&emsp; <%--로그인하여 front.jsp로 이동(세션) --%>
            <button type="button" onclick="location.href='register.jsp'" style="width:100px; height:30px; margin:auto; border:2px solid lightgray; background-color:lightgray;">회원가입</button>                            <%--register.jsp로 이동 --%>   
         </form>
      </div>
   </div>
</body>
</html>