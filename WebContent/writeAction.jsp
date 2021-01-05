<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyle.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>
<meta charset="UTF-8">
<style type="text/css">
	form{
	display:inline;
	margin:0px;
	padding:0px;
	}
</style>
<title>Insert title here</title>
</head>
<body bgcolor='#F8F8F8'>
<% if (session.getAttribute("id") == "admin"){ %>
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
			<%
				request.setCharacterEncoding("UTF-8");  
				response.setContentType("text/html; charset=utf-8");
			
				SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
				Date time = new Date();
				String date = format1.format(time);
		    	int id = 0, cnt;
				int new_id = 0, max_id;
				String title, content;
		    	Connection conn = null;
		    	Statement stmt = null;
		    	String sql_update = null;
		    	ResultSet rs = null;			

		    	try{
		    		Class.forName("com.mysql.jdbc.Driver");
		    	    String url = "jdbc:mysql://localhost:3306/Webp_TP?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		    		conn = DriverManager.getConnection(url, "root", "0000");
		    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		    		sql_update = "select count(id) as cnt, max(id) as max_id from notice;";
		    		rs = stmt.executeQuery(sql_update);
		    	}
		    	catch(Exception e){
		    		out.println("DB 연동 오류입니다.:" + e.getMessage());
		    	}
		    	
		    	while(rs.next()){
		    		 cnt = Integer.parseInt(rs.getString("cnt"));
		    		 if(cnt!=0)
		    			 	new_id = Integer.parseInt(rs.getString("max_id"));
		    	}
		    	new_id++;
		    	title = request.getParameter("title");
		    	content = request.getParameter("content");
		    	
		    	sql_update = "insert into notice values(" + new_id + ",'" + title + "','" + content + "','" + date +"')";

		    	 try {
		    		 stmt.executeUpdate(sql_update);  
		    	 }
		    	 catch(Exception e){
		    		 out.println("DB 연동 오류입니다.:" + e.getMessage());
		    	 }
%>
<center>
	<h2> 작성한 글이 등록되었습니다. </h2>
	<a href="notice_list.jsp"> 공지사항 목록 </a></center>
		    	
</body>
</html>