<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyle.css">
<meta charset="UTF-8">
<title>룸메이트 등록</title>
<script type="text/javascript">
var autocomplete;
function initAutocomplete() {
	  var region = document.getElementById('region');
	  var options = {
	    componentRestrictions: {country: ['KR']}
	  };
	  autocomplete = new google.maps.places.Autocomplete(region, options);
}
function check(){
	  var f = document.f; 
	  if (f.region.value == "") {
	        alert("위치를 입력해주십시오");
	        f.region.focus();
	        return false;
	  }
	  else{
		  document.getElementById("lat").value = autocomplete.getPlace().geometry.location.lat();
		  document.getElementById("lng").value = autocomplete.getPlace().geometry.location.lng();
	  }
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAa-SWbG7bI_h3EiTOxFx8C6gJFBxMNWuk&libraries=places&callback=initAutocomplete" async defer></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
	label {
		float: left;
		clear: left;
		width: 8em;
	}
	h4{
		text-align : center;
		border:2px solid #084B8A; 
		border-radius: 40px;
		margin:auto;
		color:white; 
		background-color:#084B8A;
		font-family: 'Nanum Gothic', sans-serif;
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
	<h2 style="text-align:center "> 룸메이트 등록 </h2><br>
		<div style="height:auto; width:80%; border:2px solid #7aa5d2; margin : auto; border-radius: 40px; overflow:auto;background-color:white">
		<form name="f" action="./enrollment_serv" method="post" enctype="multipart/form-data" onsubmit="return check();">
			<%-- 왼쪽 --%>
			<div style="text-align:center; height:auto; width:45%; float : left; margin-left:10px; margin-right:50px;"><br>
				<h3><label>주거형태 </label></h3>
					<input type="radio" name="form" value="개인실">개인실
					<input type="radio" name="form" value="다인실">다인실
					<br>
				<h3><label>건물 </label><br></h3>
					<div style="float:right;">
						<label for="유형"><h4>유형</h4></label>
						<input type="radio" name="type" value="주택/빌라">주택/빌라
						<input type="radio" name="type" value="오피스텔">오피스텔
						<input type="radio" name="type" value="아파트">아파트<br><br>
						
						<label><h4>층</h4></label>
						<input type="radio" name="floor" value="반/지하층">반/지하층
						<input type="radio" name="floor" value="옥탑">옥탑
						<input type="radio" name="floor" value="직접 입력">직접 입력<br><br>
						
						<label><h4>구조</h4></label>
						<input type="radio" name="structure" value="원룸">원룸
						<input type="radio" name="structure" value="투룸">투룸
						<input type="radio" name="structure" value="그 외">그 외<br><br>
				 	  	
				 	  	<label><h4>하우스 옵션</h4></label>
				   	    <input type="checkbox" name="houseoption" value="와이파이">와이파이
				   	    <input type="checkbox" name="houseoption" value="냉장고">냉장고
				   	    <input type="checkbox" name="houseoption" value="에어컨">에어컨
				   	    <input type="checkbox" name="houseoption" value="세탁기">세탁기<br>
				   	    <input type="checkbox" name="houseoption" value="가스레인지">가스레인지
				   	    <input type="checkbox" name="houseoption" value="전자레인지">전자레인지
				   	    <input type="checkbox" name="houseoption" value="신발장">신발장<br><br>
				 	    
				 	   	<label><h4>룸 옵션</h4></label>
				   	    <input type="checkbox" name="roomoption" value="침대">침대
				   	    <input type="checkbox" name="roomoption" value="옷장">옷장
				   	    <input type="checkbox" name="roomoption" value="책상">책상
				   	    <input type="checkbox" name="roomoption" value="소파">소파
				   	    <input type="checkbox" name="roomoption" value="의자">의자<br><br>
				 	
				 	  	<label><h4>희망 연령대</h4></label>	 	  	
				   	    <input type="checkbox" name="age" value="20~22">20 - 22
				   	    <input type="checkbox" name="age" value="23~25">23 - 25
				   	    <input type="checkbox" name="age" value="26~28">26 - 28<br>
				   	    <input type="checkbox" name="age" value="29~31">29 - 31
				   	    <input type="checkbox" name="age" value="32~35">32 - 35
				   	    <input type="checkbox" name="age" value="36~38">36 - 38<br><br>
				   	    
						<label><h4>흡연 여부</h4></label>	 
						<input type="radio" name="smoking" value="흡연자">흡연자
						<input type="radio" name="smoking" value="비흡연자">비흡연자<br><br>
				
						<label><h4>반려동물 여부</h4></label>	 
						<input type="radio" name="pet" value="있음">있음
						<input type="radio" name="pet" value="없음">없음<br>
						<input type="hidden" id="lat" name="lat" value = "0.0" >
						<input type="hidden" id="lng" name="lng" value = "0.0" >
					</div><br><br>	
			</div>
			
			<%--오른쪽 --%>
			<div style="height:auto; width : 45%; float : right;"><br>
				<h3><label>지역 </label></h3>		
					<input type="text" style="width:144px" id="region" name="region">
				<h3><label for="금액">금액 </label></h3><br><br>
					<div>
						<label><h4>보증금</h4></label>
						<input type="text" name="deposit" style="width:170px;"><br><br>
						
						<label><h4>월세</h4></label>
						<input type="text" name="monthly" style="width:170px;">
					</div><br>
				<h3>희망 입주일</h3>
				<input type="date" id="date" name="date" style="width:300px;">
                <script>
                $(document).ready(function() {
            	    var date = new Date();
            	    
            	    var day = date.getDate();
            	    var month = date.getMonth() + 1;
            	    var year = date.getFullYear();

            	    if (month < 10) 
            	    	month = "0" + month;
            	    if (day < 10) 
            	    	day = "0" + day;

            	    var today = year + "-" + month + "-" + day;

            	    var halfyear = new Date();
            	    halfyear.setDate(halfyear.getDate() + 180);
            	    
            	    day = halfyear.getDate();
            	    month = halfyear.getMonth() + 1;
            	    year = halfyear.getFullYear();

            	    if (month < 10) 
            	    	month = "0" + month;
            	    if (day < 10) 
            	    	day = "0" + day;
            	    
            	    var half = year + "-" + month + "-" + day; 
            	    
            	    $("#date").attr("max", half);
            	    $("#date").attr("value", today);
            	    $("#date").attr("min", today);
            	});  
                </script>				
				<h3>이미지 </h3>
				<input type="file" value="파일 선택" name="file" style="width:300px;" accept="image/*">		<%--업로드로 바꾸기 + 이미지만 선택 가능 --%>
			</div>
			<div style="height:auto; width:20%; float:right;"><br><br><br>		
				<input style="width:100px; height:30px; margin:auto; border:2px solid lightgray; background-color:lightgray;" type="submit" value="등록"><br><br><br>		
			</div>	
		</form>
</div>	
</body>
</html>