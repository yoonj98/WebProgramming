<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="serv.Setup_sql" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyle.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
   form{
   display:inline;
   margin:0px;
   padding:0px;
   }
   .layer1{
   height: 400px; 
   width: 28%; 
   border : 2px solid black; 
   float : left; 
   margin : 2%;
   border-radius : 20px;
   text-align : center;
   background-color:white
   }
   .layer2{
   height: 290px;
   width: 95%;
   text-align : center;
   display : inline-block;
   <%--border : 3px solid blue;--%> 
   }
   .layer3{
   height: 99px;
   width : 95% ;
   display : inline-block;
   <%--border : 3px solid red;--%>
    
   }
   .layer4{
   height: 97px;
   width : 95%;
   float : left;
   display : inline-block;
   <%--border : 3px solid yellow;--%>
   }
   .layer5{
   height: 97px;
   width : 95%;
   float : right;
   display : inline-block;
   <%--border : 3px solid yellow;--%>
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
        <center> <h2 >  룸메이트 결과  </h2><br></center>
   <% 

    Setup_sql m_sql = new Setup_sql(); //sql 연결
	
	String type = request.getParameter("type");
	String lat = (String)request.getParameter("lat");
	String lng = (String)request.getParameter("lng");
	String sql = "select * from enroll where type ='" + type +"'";
	System.out.println(sql + lat + lng);
	m_sql.search(sql);
	String id = ""; String region = ""; String deposit = ""; String monthly = "";
	String sql_lat = "0"; String sql_lng = "0";
	double distance = 0.0;
	if(m_sql.resultSet != null) { //검색 결과 유무 체크
		try {
			while(m_sql.resultSet.next()) { 
			id = m_sql.resultSet.getString("id");
			region = m_sql.resultSet.getString("region");
			deposit = m_sql.resultSet.getString("deposit");
			monthly = m_sql.resultSet.getString("monthly");
			sql_lat = (String)m_sql.resultSet.getString("lat");
			sql_lng = (String)m_sql.resultSet.getString("lng");
			
			distance = m_sql.distanceInKilometerByHaversine(lat, lng, sql_lat, sql_lng);
		    System.out.println(distance);

			%>
      <div class = layer1 >
         <div class = layer2>
         <a href="detailpage.jsp?id=<%=id %>"><img src="./upload/<%=id %>/image.jpg" style='height: 100%; width: 100%; object-fit: contain' alt="사진없음"></a>
         </div>
         <div class = layer3>
            <div class = layer4>
              <%=region %><Br><br>
         	   월세:<%=monthly %> 
            	보증금:<%=deposit %>
            </div>
            <div class = layer5>
            </div>
         </div>
      </div>

			<% }
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		m_sql.close();
	}
   %>   
      <br><br>
      <%-- 만약에 검색 결과 적합한 매물이 6개 이상일 경우 페이지로 넘겨야함 사진이랑 위치 구분하려고 div로 색칠해뒀는데 내용넣으면 나중에 하면됨 --%>
      <%-- div 동적할당 --%>

</body>
</html>