<%@ page language="java" contentType="text/html; charset=EUC-KR"

 pageEncoding="EUC-KR"%>

<%@ page import="check.JoinService"%>

<%
  request.setCharacterEncoding("EUC-KR");
  String userId=request.getParameter("userId");
  JoinService joinService = new JoinService();
  boolean flag=joinService.idcheck(userId);
%>

<HTML>

<SCRIPT> 
  if(<%=!flag%>){
   window.opener.document.getElementById("info").innerHTML="사용가능한 아이디 입니다.";
   window.close();
  }else{
   window.opener.document.getElementById("info").innerHTML="중복되는 아이디 입니다.";
   window.close();
  }
    </SCRIPT>
</HTML>