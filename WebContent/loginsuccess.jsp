<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="mystyle.css">
<title>로그인 완료</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<%
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	
	if(id.equals("admin") && pw.equals("1234")){
		session.setAttribute("id",id);
		response.sendRedirect("front.jsp");
	}else if(id.equals("admin")){
		out.println("<script>alert('비밀번호를 확인하세요.'); history.back();</script>");
	}else if(pw.equals("1234")){
		out.println("<script>alert('이메일을 확인하세요.'); history.back();</script>");
	}else{
		out.println("<script>alert('이메일과 비밀번호를 확인하세요.'); history.back();</script>");
	}
		%>
</body>
</html>