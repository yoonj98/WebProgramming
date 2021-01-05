<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyle.css">
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
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
<script type="text/javascript" src="./register.js"></script>
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
	<div style="height:auto; width:50%; margin : auto; ">
		<h2 style="text-align:center;"> 회원가입 </h2>
		<div style="height:400px; width:100%;border:2px solid #7aa5d2; margin : auto; border-radius: 40px;background-color:white">
			<div class="layer">
				<form name ="enroll" action="./register_serv" method="post"><br><br>													
					<label> 아이디 </label>
					<input type="text" name="id">
					<input type="button" name="check" value="중복 확인" onclick='check1()' style="width:80px; height:auto; margin:auto; border:2px solid lightgray; background-color:lightgray;"><br>
					<label id="info" style="width:100%">중복확인 필요</label>
					<br><br> 				
					<label>E-mail </label>
					<input type="email" name="e_mail">
					<input type="button" name="check" value="중복 확인" onclick='check2()' style="width:80px; height:auto; margin:auto; border:2px solid lightgray; background-color:lightgray;"><br> 					<%--DB통해 중복 확인 --%>
					<label id="info2" style="width:100%">중복확인 필요</label>
					<br><br>
					<label>비밀번호 </label>
					<input type="password" name="passwd" ><br><br>
					<label>이름 </label>
					<input type="text" name="name" >
					<select id="sex" name="sex" style="width:80px"> 
						<option selected value="">성별</option> 
							<option value="남자">남자</option> 
							<option value="여자">여자</option> 
					</select><br><br>				
					<label>생년월일 </label>
					<input type="text" name="birth" ><br><br>
					<label>전화번호 </label>
					<input type="text" name="phone" ><br><br>
					
					<div style="height:auto; width:20%; float:right;">
						<input type="button" onclick='check3()' value="가입" style="width:100px; height:30px; margin:auto; border:2px solid lightgray; background-color:lightgray;"><br><br>
					</div>
				</form>	
			</div>	
		</div>
	</div>
</body>
</html>