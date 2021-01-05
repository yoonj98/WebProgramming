<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body bgcolor='#F8F8F8'>
<% if (session.getAttribute("id") != null && session.getAttribute("id").equals("admin")){ %>	<%--관리자일때 --%>
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
	<%}else if(session.getAttribute("id") != null) {%>
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
	<%}else { %>
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
	<%} %>
	<h2 style="text-align:center;">공지사항</h2><br>
	<center>
	   <div class="container" style="width:100%">
			<table class="table table-striped" style="width:80%; text-align:center; border:1px solid #dddddd"> 
					<tr>
						<th style="background-color: #eeeeee; text-align: center;" width="200">제목</th>
						<th style="background-color: #eeeeee; text-align: center;" width="100">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;" width="50">작성일</th>
					</tr>
			<%
		    	int id = 0;
		    	Connection conn = null;
		    	Statement stmt = null;
		    	String sql = null;
		    	ResultSet rs = null;			

		    	try{
		    		Class.forName("com.mysql.jdbc.Driver");
		    		String url = "jdbc:mysql://localhost:3306/webp_TP?serverTimezone=UTC";
		    		conn = DriverManager.getConnection(url, "root", "0000");
		    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		    		sql = "select * from notice order by id asc";
		    		rs = stmt.executeQuery(sql);
		    	}
		    	catch(Exception e){
		    		out.println("DB 연동 오류입니다.:" + e.getMessage());
		    	}
		    	if(rs != null){
		    	rs.last();
				rs.beforeFirst();		    	
		    	
				while(rs.next()){
					id = Integer.parseInt(rs.getString("id"));				
			%>	
				<tr style="background-color:white">

			        
				 <td align="center"> 
				  <a href=notice_read.jsp?id=<%=rs.getString("id")%> width="200">
					<%=rs.getString("title")%></a></td>
		         <td align="center" width="100">관리자</td>
		         <td align="center"width = "50"><%= rs.getString("date") %></td>
		      </tr>
		    <%
				}
		    %>  
		   
		    
			</table>	
			<%
	    	 stmt.close();
	    	 conn.close();
	    	%>
			<% if(session.getAttribute("id") != null){if (session.getAttribute("id").equals("admin")){ %>
				<a align ="right" href = "notice_write.jsp" class="btn btn-primary pull-center">글쓰기</a>
			<%}}} %>
	</div>
	</center>
</body>
</html>
