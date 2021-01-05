<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
	<%} %>
	<%
  		int id, ref= 0;
  		String name = "", e_mail ="", title ="", content = "";
  		Connection conn = null;
  		Statement stmt = null;
  		ResultSet rs = null;
  		
  	id = Integer.parseInt(request.getParameter("id"));
  	
  	try{
  		Class.forName("com.mysql.jdbc.Driver");
 		String url = "jdbc:mysql://localhost:3306/Webp_TP?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
 		conn = DriverManager.getConnection(url, "root", "0000");
 		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
 		rs = stmt.executeQuery("select * from notice where id = " + id);
  	
  	}
  	catch(Exception e){
  		out.println("DB 연동 오류입니다.:" + e.getMessage());
  	}
  	
  	while(rs.next()){
  		title =rs.getString("title");
    	content = rs.getString("content");
  		
  	}
  	%>
  	<Br>
  	<div class="container">
	<div class="row">
		<form method="post" action="notice-modify-db.jsp">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">

				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">공지사항 수정
						</th>
					</tr>
				</thead>
				<tbody >
					<tr>
						<td><input type="text" class="form-control" value="<%=title %>" name="title" maxlength="50"/></td>
					</tr>
					<tr>
						<td><textarea type="text" class="form-control" name="content" maxlength="2048" style="height: 350px;"><%=content %></textarea></td>
					</tr>
					
				</tbody>
			</table>
			<input type="hidden" name = "id" value="<%=request.getParameter("id") %>">
			<div class = "nButtongCenter">	
			<a href = "notice_list.jsp" class="btn btn-primary pull-right">취소</a>
			<input type="submit" class="btn btn-primary pull-right" value="수정" />
			</div>
		</form>
		
	</div>
		
</div>
  	
  	
 
</body>
</html>