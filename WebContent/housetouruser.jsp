<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="serv.Setup_sql" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyle.css">
<link rel="stylesheet" href="slider.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.column-contents{
	width: 70%;
	}
	.user_table{
	width:100%;
	padding:0px 30px 0px 30px;
	}
</style>
<script type = "text/javascript" src="https://code.jquery.com/jQuery-3.5.1.js"></script>
<script>
$(function(){
	  var $slider = $('.slider'),
	      $firstSlide = $slider.find('li').first() // 첫번째 슬라이드
	  .stop(true).animate({'opacity':1},200); // 첫번째 슬라이드만 보이게 하기

	  function PrevSlide(){ // 이전버튼 함수
	    var $lastSlide = $slider.find('li').last() //마지막 슬라이드
	    .prependTo($slider); //마지막 슬라이드를 맨 앞으로 보내기  
	    $secondSlide = $slider.find('li').eq(1)
	   //두 번째 슬라이드 구하기
	   .stop(true).animate({'opacity':0},400); //밀려난 두 번째 슬라이드는 fadeOut 시키고
	    $firstSlide = $slider.find('li').first() //맨 처음 슬라이드 다시 구하기
	    .stop(true).animate({'opacity':1},400);
	    //새로 들어온 첫 번째 슬라이드는 fadeIn 시키기
	  }
	  function NextSlide(){ // 다음 버튼 함수
	    $firstSlide = $slider.find('li').first() // 첫 번째 슬라이드
	    .appendTo($slider); // 맨 마지막으로 보내기
	    var $lastSlide = $slider.find('li').last() // 맨 마지막으로 보낸 슬라이드
	    .stop(true).animate({'opacity':0},400); // fadeOut시키기
	    $firstSlide = $slider.find('li').first()
	    // 맨 처음 슬라이드
	    .stop(true).animate({'opacity':1},400);
	    // fadeIn 시키기
	  }
	  
	  $('#next').on('click', function(){ //다음버튼 클릭
	    NextSlide();
	  });
	    $('#prev').on('click', function(){ //이전 버튼 클릭하면
	    PrevSlide();
	  });
	  
	  //setInterval(NextSlide, 5000); //자동 슬라이드 설정

	});
</script>
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
	<div style="text-align:center;">
		<div>
			<h2 style="text-align:center;">하우스 투어 회원 확인</h2>
				<div style=" width:13%; height:180px; float:left; margin:0px 40px 0px 0px;border:2px solid #ddd; border-radius: 20px;background-color:white">
       <div style="margin:10px 0px 0px 0px; text-align:center;">
       <a href="mypage.jsp">프로필 수정</a><br><br>
       <a href="usermodify.jsp" >회원정보 수정</a><br><br>
       <a href="housetouruser.jsp" >하우스 투어 회원 확인</a><br><br>
       <a href="withdraw.jsp" >회원 탈퇴</a><br>
       </div>
    </div>
		</div>
		<div style="border:2px solid #7aa5d2; border-radius: 40px; width:60%; margin:auto;background-color:white">
		  <ul class="slider" style="width:100%; height:360px; padding:0; margin:auto;">
	
	<%
	Setup_sql m_sql1, m_sql2;
    m_sql1 = new Setup_sql(); //sql 연결
    ResultSet matching_rs, profile_rs;
	String id = (String)session.getAttribute("id");
	String sql = "select * from matching where owner_id ='" + id +"'";
	m_sql1.search(sql); matching_rs = m_sql1.resultSet;
	if(matching_rs != null){
		while(matching_rs.next()){
			m_sql2 = new Setup_sql(); //sql 연결
			sql = "select * from profile where e_mail ='" + matching_rs.getString("mate_email") +"'";
			m_sql2.search(sql); profile_rs = m_sql2.resultSet; profile_rs.next();
			System.out.println(sql);
			
	%>
		    <li>
		        <dl>
		          <dd style="width:100%; margin:0px 0px 0px 0px;">
					<div class="user_table">
						<div class="column-title">
							E-mail
						</div>
						<div class="column-contents">
							<%=matching_rs.getString("mate_email") %>
						</div>	
						<div class="column-title">
							자기소개
						</div>
						<div class="column-contents">
							<%=profile_rs.getString("introduce") %>							
						</div>
						<div class="column-title">
							직업
						</div>
						<div class="column-contents">
							<%=profile_rs.getString("job") %>							
						</div>
						<div class="column-title">
							성향
						</div>
						<div class="column-contents">
							<%=profile_rs.getString("tendency") %>							
						</div>
						<div class="column-title">
							흡연 여부
						</div>
						<div class="column-contents">
							<%=profile_rs.getString("smoking") %>							
						</div>
						<div class="column-title">
							반려동물 여부
						</div>
						<div class="column-contents">
							<%=profile_rs.getString("pet") %>							
						</div>
					</div>
				  </dd>
		        </dl>
		    </li>
	   <% 
	    m_sql2.close();
	    profile_rs.close();  
		}
	}
   matching_rs.close();
   m_sql1.close();
    %> 
    
    		  </ul>
		</div>
		
		<br>
			<button type="button" id="prev" style="width:100px; height:30px; margin:auto; border:2px solid lightgray; background-color:lightgray;"><</button>
		    <button type="button" id="next" style="width:100px; height:30px; margin:auto; border:2px solid lightgray; background-color:lightgray;">></button>
	</div>
    
</body>
</html>