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
		    	int id;
				String title, content;
		    	Connection conn = null;
		    	Statement stmt = null;
		    	String sql_update = null;
		    	id = Integer.parseInt(request.getParameter("id"));
		    	title = request.getParameter("title");
		    	content = request.getParameter("content");
		    	
		    	try{
		    		Class.forName("com.mysql.jdbc.Driver");
		    	    String url = "jdbc:mysql://localhost:3306/Webp_TP?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		    		conn = DriverManager.getConnection(url, "root", "0000");
		    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		    		sql_update = "update notice set title = '" + title + "', content = '" + content +"', date = '" + date + "' where id = "+ id;
		    		stmt.executeUpdate(sql_update);
		    		 
		    	}
		    	catch(Exception e){
		    		out.println("DB 연동 오류입니다.:" + e.getMessage());
		    	}
		    	System.out.print(title);
		    	%>
		    	<br>
		    	  <center><h2> 공지사항이 수정되었습니다. </h2>
		    	  <br>
 			<a href = "notice_read.jsp?id=<%= request.getParameter("id") %>"class="btn btn-primary pull-center" > 수정한 공지 확인 </a>
		    	</center>
</body>
</html>