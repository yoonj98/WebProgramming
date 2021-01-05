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
	<%}  %>
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
		<h2 style="text-align:center;">공지사항</h2>
	<center>	
			   <div class="container" style="width:80%">
			<table class="table table-striped" style="width:80%;  border:1px solid #dddddd"> 
					
					 <thead>
						<tr><br>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">			<%--타이틀 글자 크기 키우기  --%>
							<%=title %>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr style="background-color:white">
							<td style="height : 350px;"><%=content%></textarea></td>
						</tr>
				
					</tbody>
			</table>
			
						<%
	    	 stmt.close();
	    	 conn.close();
	    	%>
			<% if(session.getAttribute("id") != null){if (session.getAttribute("id").equals("admin")){ %>
			<a align = "center" href = "notice-modify.jsp?id=<%=id%>" class="btn btn-primary pull-center">수정</a>
			<a align = "center" href = "notice-delete-db.jsp?id=<%=id%>" class="btn btn-primary pull-center">삭제</a>			
			<%}} %>
  	</center>
</body>
</html>