<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyle.css">
<link rel="stylesheet" href="rangeslider.css">
<meta charset="UTF-8">
<title>룸메이트 찾기</title>
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
<script type="text/javascript" src="./register.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAa-SWbG7bI_h3EiTOxFx8C6gJFBxMNWuk&libraries=places&callback=initAutocomplete" async defer></script>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
   label {
      float: left;
      clear: left;
      width: 10em;
   }
   h3{
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
         <h2 style="text-align:center"> 룸메이트 찾기 </h2><br>
            <div style="height:500%; width:80%; border:2px solid #7aa5d2; margin : auto; border-radius: 40px;background-color:white"><br><br>
               <form name="f" action="./search.jsp" method="post" onsubmit="return check()">
                  <%--지역 검색 --%>
                  <div style="height:auto; width: 50%; margin : auto; border : 2px solid navy; padding:13px; text-align : center; word-spacing: 10px; border-radius: 40px;">
                     <label><h3>지역 입력</h3></label>
                     <input type="text" name="region" id="region" style="width:50%;">
                  </div ><br>
                  <%--월세 범위 --%>
                     <div style="height:auto; width: 50%; margin : 0 auto;padding:13px; text-align : center; word-spacing: 10px;">
                          <label><h3>월세</h3></label>
                       </div>
                       <div class="range-slider">
                          <center>
                             <input style = "width:50%;" class="range-slider__range" type="range" value="0" min="0" max="200"></input>
                             <strong><span class="range-slider__value">0</span></strong>   만원
                          </center><br>                        	
                       </div>
                     <div style="height:auto; width: 55%; margin : 0 auto;">
                        <div style="float:left;">
                        <h4 style="display:inline;">0 만원</h4>
                        </div>
                        <div style="float:right;">
                        <h4 style="display:inline;">200 만원</h4>
                        </div>
                     </div><br><br>
                     <script>
                     var rangeSlider = function(){
                          var slider = $('.range-slider'),
                              range = $('.range-slider__range'),
                              value = $('.range-slider__value');
                            
                          slider.each(function(){

                            value.each(function(){
                              var value = $(this).prev().attr('value');
                              $(this).html(value);
                            });

                            range.on('input', function(){
                              $(this).next(value).html(this.value);
                            });
                          });
                        };
                        rangeSlider();
                     </script>
                     
                  <div style="height:auto; width: 50%; margin : auto;padding:13px; float: center; margin:auto; word-spacing: 10px;">   
                     <%--성별 --%>
                        <label style="margin: 0px 15px 0px 0px"><h3>성별</h3></label>
                        <select id="gender" style="width:150px"> 
                           <option selected>성별</option> 
                           <option>남자</option> 
                           <option>여자</option> 
                        </select><br><br>   
                     <%--주거 형식 --%>
                     <label style="margin: 0px 15px 0px 0px"><h3>주거 형식</h3></label>
                     <input type="radio" id="type" name="type" value="주택/빌라">주택/빌라
                     <input type="radio" id="type" name="type" value="오피스텔">오피스텔
                     <input type="radio" id="type" name="type" value="아파트">아파트<br><br>
                     <%--룸 형식--%>
                     <label style="margin: 0px 15px 0px 0px"><h3>룸 형식</h3></label>
                     <input type="radio" id="structure" name="structure" value="원룸">원룸
                     <input type="radio" id="structure" name="structure" value="투룸">투룸
                     <input type="radio" id="structure" name="structure" value="그 외">그 외<br><br>
                     <%--입주 예정일 --%>
                     <label style="margin: 0px 15px 0px 0px"><h3>입주 예정일</h3></label>
                     <input type="date" id="date" style="width:150px;">
                     <input type="hidden" id="lat" name="lat" value = "0.0">
					 <input type="hidden" id="lng" name="lng" value = "0.0">
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
                     <div style="float:right">
                     <input type="submit" style="width:100px; height:30px; margin:auto; border:2px solid lightgray; background-color:lightgray;" value="찾기"><br>   
                     </div>
                     <br><br>
                  </div>
               </form>
         </div>
</body>
</html>