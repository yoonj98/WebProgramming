<%@ page language="java" contentType="text/html; charset=EUC-KR"

 pageEncoding="EUC-KR"%>

<%@ page import="check.JoinService"%>

<%
  request.setCharacterEncoding("EUC-KR");
  String e_mail=request.getParameter("e_mail");
  JoinService joinService = new JoinService();
  boolean flag=joinService.e_mail_check(e_mail);
%>

<HTML>

<SCRIPT> 
  if(<%=!flag%>){
   window.opener.document.getElementById("info2").innerHTML="��밡���� �̸��� �Դϴ�.";
   window.close();
  }else{
   window.opener.document.getElementById("info2").innerHTML="�ߺ��Ǵ� �̸��� �Դϴ�.";
   window.close();
  }
    </SCRIPT>
</HTML>