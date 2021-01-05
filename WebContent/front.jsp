<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="serv.Setup_sql" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyle.css">
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
   form{
   display:inline;
   margin:0px;
   padding:0px;
   }
	.layer1{
   height: auto; 
   width: 45%; 
   border : 2px solid black; 
   float : left; 
   margin : 2%;
   border-radius : 20px;
   text-align : center;
   background-color:white;
   }
   .layer2{
   height: 190px;
   width: 95%;
   text-align : center;
   display : inline-block;
   }
   
   .layer3{
   height: 89px;
   width : 95% ;
   display : inline-block;
   }
   
   .layer4{
   height: 57px;
   width : 95%;
   float : left;
   display : inline-block;
   }
   
   .layer5{
   height: 47px;
   width : 95%;
   float : left;
   display : inline-block;
   }
   .layer6{
   height: auto; 
   width: 97%; 
   border : 2px solid black; 
   float : left; 
   margin : 2%;
   border-radius : 20px;
   text-align : center;
   }
   
   .layer7{
   height: 470px;
   width: 98%;
   display : inline-block;
  }
   .layer8{
   height: 110px;
   width : 95% ;

   display : inline-block;
   
   }
   .layer9{
   height: 110px;
   width : 90%;
	text-align : center;
   display : inline-block;
   }
   .layer10{
   height: 110px;
   width : 45%;
   float : right;

   display : inline-block;
   }   
</style>
<script>
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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAa-SWbG7bI_h3EiTOxFx8C6gJFBxMNWuk&libraries=places&callback=initAutocomplete" async defer></script>
<meta charset="UTF-8">
<title>메인</title>
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
	<br><br>
	<div style="height=auto; width: 50%; margin : auto; border : 3px solid navy; padding:13px; text-align : center; margin:auto; word-spacing: 10px; border-radius: 40px;  background-color:white">
	<form name="f" action="./search.jsp" method="post" onsubmit="return check();">		
		<input type="text" id="region" style="width:45%;">
		<select id="type" name = "type"> 
			<option selected value="주택/빌라">주택/빌라</option> 
			<option  value="오피스텔">오피스텔</option> 
			<option  value="아파트">아파트</option> 
		</select>
		<select id="ex_select2"> 
			<option selected value="원룸">원룸</option> 
			<option value="투룸">투룸</option> 
			<option value="그 외">그 외</option> 
		</select>
		<input type="submit" value="검색" style="width:100px; height:auto; margin:auto; border:2px solid lightgray; background-color:lightgray;">
		             <input type="hidden" id="lat" name="lat">
					 <input type="hidden" id="lng" name="lng">
					  											<%--해당 입력값을 자동으로 받아 front.jsp에서 검색 시 결과 화면의 jsp로 이동--%> 
		</form>
	</div><br>
	<div style="height:auto; width: 100%; margin : 0 auto; ">
		<div style="height:auto; width : 45%; float : left; margin-left : 30px ;margin-right:10px;">
			<h3 id="st1">최신 룸메이트</h3>
			<div style="height:auto; width : 100%; border : 2px solid #7aa5d2;  background-color:white; overflow:auto;">
	<%
	Setup_sql m_sql1;
    m_sql1 = new Setup_sql(); //sql 연결
    String id, region, deposit, monthly;
	String sql = "select * from enroll order by idx desc";
	int count = 0;
	m_sql1.search(sql); 
	if(m_sql1.resultSet != null){
		while(m_sql1.resultSet.next() && count < 4){
			count++;
			id = m_sql1.resultSet.getString("id");
			region = m_sql1.resultSet.getString("region");
			deposit = m_sql1.resultSet.getString("deposit");
			monthly = m_sql1.resultSet.getString("monthly");
	
	%>			
		      <div class = layer1>
		         <div class = layer2>
				<a href="detailpage.jsp?id=<%=id %>"><img src="./upload/<%=id %>/image.jpg" style='height: 100%; width: 100%; object-fit: contain' alt="사진없음"></a>

		         </div>
		         <div class = layer3>
		            <div class = layer4>
            <%=region %>
		            </div>
		            <div class = layer5>
            월세:<%=monthly %> 보증금:<%=deposit %>
		            </div>
		         </div>
		      </div>
	<% 
		}
	}
    m_sql1.close();
    %> 

		      </div>
		</div>
	</div>
			<div style="height : auto; width : 45%; float : right; margin-right:30px">
			<h3 id = "st1">최근 본 룸메이트</h3>
	
				<div style="height : auto; width : auto; border : 2px solid #7aa5d2;  background-color:white; margin:0 auto; overflow:auto;">
					<% 
		if (session.getAttribute("id") != null && session.getAttribute("recent") != null){ 
		Setup_sql m_sql2;
	    m_sql2 = new Setup_sql(); //sql 연결
	    sql = "select * from enroll where id = '" + (String)session.getAttribute("recent") + "'";
		m_sql2.search(sql); 
			m_sql2.resultSet.next();
				id = m_sql2.resultSet.getString("id");
				region = m_sql2.resultSet.getString("region");
				deposit = m_sql2.resultSet.getString("deposit");
				monthly = m_sql2.resultSet.getString("monthly");
		%>
					      <div class = layer6>
					         <div class = layer7>
				<a href="detailpage.jsp?id=<%=id %>"><img src="./upload/<%=id %>/image.jpg" style='height: 100%; width: 100%; object-fit: contain' alt="사진없음"></a>
					         </div><br><Br>
					         <div class = layer8>
					            <div class = layer9>
  				          	  <%=region %><Br>
  				          	  월세:<%=monthly %> 보증금:<%=deposit %>
					            </div>
					          
					         </div>
					      </div>
					<%}else if(session.getAttribute("id") != null && session.getAttribute("recent") == null){%>						
						<div style="height:80px; padding: 285px 0; text-align:center;">살펴본 방이 없습니다.</div>				
					<%}else{%>	
						<div style="height:80px; padding: 285px 0; text-align:center;">로그인 후 이용 가능한 기능입니다.</div>				
					<%} %>
				</div>
		</div>
	</div>
</body>
</html>