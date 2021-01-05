<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="serv.Setup_sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="mystyle.css">
<link rel="stylesheet" href="slider.css">
<title>Insert title here</title>
<style type="text/css">
	form{
	display:inline;
	margin:0px;
	padding:0px;
	}
	.column-contents{
	width: 70%;
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
	<%}
	Setup_sql m_sql1, m_sql2, m_sql3;
    m_sql1 = new Setup_sql(); //sql ����
    ResultSet user_rs, profile_rs, enroll_rs;
	String id = request.getParameter("id");
	session.setAttribute("recent", id);
	String sql = "select * from user where id ='" + id +"'";
	m_sql1.search(sql); user_rs = m_sql1.resultSet; user_rs.next();
	
	m_sql2 = new Setup_sql(); //sql ����
	sql = "select * from enroll where id ='" + id +"'";
	m_sql2.search(sql); enroll_rs = m_sql2.resultSet; enroll_rs.next();

	m_sql3 = new Setup_sql(); //sql ����
	sql = "select * from profile where e_mail ='" + user_rs.getString("e_mail") +"'";
	m_sql3.search(sql); profile_rs = m_sql3.resultSet; profile_rs.next();
	%>
	<br><br>
	<fieldset>
		<div style="width:100%">
			<div style="height:50vh; width:49%; float:left; border:1px solid black;"><img src="./upload/<%=id %>/image.jpg" style='height: 100%; width: 100%; object-fit: contain' alt="��������"></div>   <%--�� ���� 1�� --%>
			<div id="map" style="width:49%; height: 50vh; float:right; border:1px solid black;"></div>	<%--������ ���� map ��� --%>
			
			<script async defer
			//API KEY : AIzaSyAa-SWbG7bI_h3EiTOxFx8C6gJFBxMNWuk
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAa-SWbG7bI_h3EiTOxFx8C6gJFBxMNWuk&callback=initMap&region=kr">
			</script>
			
			<script>
			  var map;
			
			  function initMap() {
			    var house = { lat: <%=enroll_rs.getString("lat") %> ,lng: <%=enroll_rs.getString("lng") %> };					<%-- ����� �� ���浵�� ���� ���� �� --%>
			    map = new google.maps.Map( document.getElementById('map'), {
			        zoom:16,
			        center: house
			      });
			
			    new google.maps.Marker({
			      position: house,
			      map: map
			    });
			  }
			  </script><br>

			<%--�� �ѷ����� ��û �� ȣ��Ʈ���� �ش� ����� ������ ���� ������ --%>
			<%if(session.getAttribute("id") != null){if(!session.getAttribute("id").equals(id)){ %>
			<form method="post" action="./detail_serv" name=f>
			<input type="hidden" value="<%=id %>" name="id" id="id">
			<input type="submit" value="�� �ѷ����� ��û" style="height:30px; margin:10px 0px 0px 10px; width:100%; color:white; border:2px solid #FE605C; background-color:#FE605C;">
			</form>
			<%}else{ %>
			<input type="button" value="���� ����� ���Դϴ�." style="height:30px; margin:10px 0px 0px 10px; width:100%; color:white; border:2px solid #FE605C; background-color:#FE605C;">
			
			<%}} else{%>
			<input type="button" value="�α����� �ʿ��� �����Դϴ�." style="height:30px; margin:10px 0px 0px 10px; width:100%; color:white; border:2px solid #FE605C; background-color:#FE605C;">			
			<%} %>
			<div>
			<h3>ȣ��Ʈ ����</h3>
			 <div class=user_table>
            <div class="column">
               <div class="column-title">
                  �ڱ�Ұ�
               </div>
               <div class="column-contents">
               <%=profile_rs.getString("introduce") %>
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  ����
               </div>
               <div class="column-contents">
			   <%=user_rs.getString("sex") %>
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  ����
               </div>
               <div class="column-contents">
               <%=profile_rs.getString("job") %>             
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  ����
               </div>
               <div class="column-contents">
               <%=profile_rs.getString("tendency") %>                            
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  ��� ������
               </div>
               <div class="column-contents">
               <%=profile_rs.getString("date") %>
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  �� ����
               </div>
               <div class="column-contents">
			   <%=profile_rs.getString("smoking") %>                            
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  �ݷ����� ����
               </div>
               <div class="column-contents">
               <%=profile_rs.getString("pet") %>
               </div>
            </div>
         </div><br><br>
         
         <h3>�� ����</h3>
         <div class=house_table>
            <div class="column">
               <div class="column-title">
                  �ּ�
               </div>
               <div class="column-contents">
               <%=enroll_rs.getString("region") %>
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  ��� ������
               </div>
               <div class="column-contents">
               <%=enroll_rs.getString("date") %>               
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  ������
               </div>
               <div class="column-contents">
               <%=enroll_rs.getString("deposit") %>
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  ����
               </div>
               <div class="column-contents">
               <%=enroll_rs.getString("monthly") %>               
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  �ǹ� ����
               </div>
               <div class="column-contents">
               <%=enroll_rs.getString("form") %>                              
               </div>
            </div>   
            <div class="column">
               <div class="column-title">
                  �ǹ� ��
               </div>
               <div class="column-contents">
               <%=enroll_rs.getString("floor") %>                              
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  �ǹ� ����
               </div>
               <div class="column-contents">
               <%=enroll_rs.getString("structure") %>                              
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  �ְ� ����
               </div>
               <div class="column-contents">
               <%=enroll_rs.getString("type") %>                                             
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  �Ͽ콺 �ɼ�
               </div>
               <div class="column-contents">
               <%=enroll_rs.getString("houseoption") %>                                             
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  �� �ɼ�
               </div>
               <div class="column-contents">
               <%=enroll_rs.getString("roomoption") %>                                             
               </div>
            </div>
            <div class="column">
               <div class="column-title">
                  ��� ���ɴ�
               </div>
               <div class="column-contents">
			   <%=enroll_rs.getString("age") %>                                             
               </div>
            </div>
         </div>
         
      </div>
   </fieldset>
   <% 
   user_rs.close();
   profile_rs.close();
   enroll_rs.close();
   m_sql1.close();
   m_sql2.close();
   m_sql3.close();
    %> 
</body>
</html>