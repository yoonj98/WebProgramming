<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="mystyle.css">
<title> ȸ������ ���� </title>
<style type="text/css">
   .layer {
      display:flex;
      justify-content: center;
      align-items: center;
   }
   .layer1 {
       position: fixed;
       top: 44%;
       left: 45%;
       -webkit-transform: translate(-50%, -50%);
       transform: translate(-50%, -50%);
   }
   .layer2 {
       position: fixed;
       top: 40%;
       left: 83%;
       -webkit-transform: translate(-50%, -50%);
       transform: translate(-50%, -50%);
   }   
   label {
      float: left;
      clear: left;
      width: 8em;
   }
   form{
      display:inline;
      margin:0px;
      padding:0px;
   }
</style>
</head>
<body bgcolor='#F8F8F8'>
<% if (session.getAttribute("id") == null){ %>
	<div style="height:auto; width:auto; padding:12px; background-color: #7aa5d2 !important;">
		<div style="height: auto; width: 100%; text-align : right; word-spacing: 25px; padding:3px; ">
			<a href="front.jsp" style="float : left"><img src="image/logo.png" height=auto></a>
			<a id = "menu" href="find.jsp"><font color="white">�����Ʈã�� </font></a>
			<a href="login.jsp"><font color="white">�����Ʈ��� </font></a>	<%--login X -> login page --%>
			<a href="notice_list.jsp"><font color="white">��������</font></a>
			<a href="login.jsp"><font color="white">����������</font></a>	<%--login X -> login page --%>
			<a href="login.jsp"><font color="white">�α��� </font></a>
		</div>
    </div>
	<%}else{%>
	<div style="height:auto; width:auto; padding:12px; background-color: #7aa5d2 !important;">
		<div style="height: auto; width: 100%; text-align : right; word-spacing: 25px;padding:5px;" >
			<a href="front.jsp" style="float : left"><img src="image/logo.png" height=auto></a>
			<a id = "menu" href="find.jsp"><font color="white">�����Ʈã�� </font></a>
			<a href="enrollment.jsp"><font color="white">�����Ʈ��� </font></a>
			<a href="notice_list.jsp"><font color="white">�������� </font> </a>
			<a href="mypage.jsp"><font color="white">���������� </font> </a>
			<form method="post" action="logout.jsp" >
			<font color="white"><%=session.getAttribute("id") %>��  </font>
				<input type="submit" value="�α׾ƿ�"/>
			</form>
		</div>
	</div>	
	<%}  %>
     <h2 style=" text-align : center;"> ȸ�� ���� ���� </h2><br>
    <div style=" width:13%; height:180px; float:left; margin:0px 40px 0px 0px;border:2px solid #ddd; border-radius: 20px;background-color:white">
       <div style="margin:10px 0px 0px 0px; text-align:center;">
       <a href="mypage.jsp">������ ����</a><br><br>
       <a href="usermodify.jsp" >ȸ������ ����</a><br><br>
       <a href="housetouruser.jsp" >�Ͽ콺 ���� ȸ�� Ȯ��</a><br><br>
       <a href="withdraw.jsp" >ȸ�� Ż��</a><br>
       </div>
    </div>
   <div style="height:auto; width:50%; margin : auto; ">
      <div style="height:350px; width:100%;border:2px solid #7aa5d2; margin : auto; border-radius: 40px;background-color:white">
         <div class="layer">
            <form action="./user_modify" method="post"><br><br><br>                                       
               <label> ���̵� </label>
               <%=session.getAttribute("id") %></p>
               <label>E-mail </label>
               <%=session.getAttribute("e_mail") %></p>
               <label>��й�ȣ </label>
               <input type="password" name="passwd" ><br><br>
               <label>�̸� </label>
               <%=session.getAttribute("name") %>
               (<%=session.getAttribute("sex") %>)<p>
               <label>��ȭ��ȣ </label>
               <input type="text" name="phone" value=<%=session.getAttribute("phone") %>><br><br><br>
               <input type="submit" value="����" style="width:100px; height:30px; margin:auto; border:2px solid lightgray; background-color:lightgray;"><br>
            </form>   
         </div>   
      </div>
   </div>
</body>
</html>