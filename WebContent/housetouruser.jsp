<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="serv.Setup_sql" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyle.css">
<link rel="stylesheet" href="slider.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.column-contents{
	width: 70%;
	}
	.user_table{
	width:100%;
	padding:0px 30px 0px 30px;
	}
</style>
<script type = "text/javascript" src="https://code.jquery.com/jQuery-3.5.1.js"></script>
<script>
$(function(){
	  var $slider = $('.slider'),
	      $firstSlide = $slider.find('li').first() // ù��° �����̵�
	  .stop(true).animate({'opacity':1},200); // ù��° �����̵常 ���̰� �ϱ�

	  function PrevSlide(){ // ������ư �Լ�
	    var $lastSlide = $slider.find('li').last() //������ �����̵�
	    .prependTo($slider); //������ �����̵带 �� ������ ������  
	    $secondSlide = $slider.find('li').eq(1)
	   //�� ��° �����̵� ���ϱ�
	   .stop(true).animate({'opacity':0},400); //�з��� �� ��° �����̵�� fadeOut ��Ű��
	    $firstSlide = $slider.find('li').first() //�� ó�� �����̵� �ٽ� ���ϱ�
	    .stop(true).animate({'opacity':1},400);
	    //���� ���� ù ��° �����̵�� fadeIn ��Ű��
	  }
	  function NextSlide(){ // ���� ��ư �Լ�
	    $firstSlide = $slider.find('li').first() // ù ��° �����̵�
	    .appendTo($slider); // �� ���������� ������
	    var $lastSlide = $slider.find('li').last() // �� ���������� ���� �����̵�
	    .stop(true).animate({'opacity':0},400); // fadeOut��Ű��
	    $firstSlide = $slider.find('li').first()
	    // �� ó�� �����̵�
	    .stop(true).animate({'opacity':1},400);
	    // fadeIn ��Ű��
	  }
	  
	  $('#next').on('click', function(){ //������ư Ŭ��
	    NextSlide();
	  });
	    $('#prev').on('click', function(){ //���� ��ư Ŭ���ϸ�
	    PrevSlide();
	  });
	  
	  //setInterval(NextSlide, 5000); //�ڵ� �����̵� ����

	});
</script>
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
	<%} %>
	<div style="text-align:center;">
		<div>
			<h2 style="text-align:center;">�Ͽ콺 ���� ȸ�� Ȯ��</h2>
				<div style=" width:13%; height:180px; float:left; margin:0px 40px 0px 0px;border:2px solid #ddd; border-radius: 20px;background-color:white">
       <div style="margin:10px 0px 0px 0px; text-align:center;">
       <a href="mypage.jsp">������ ����</a><br><br>
       <a href="usermodify.jsp" >ȸ������ ����</a><br><br>
       <a href="housetouruser.jsp" >�Ͽ콺 ���� ȸ�� Ȯ��</a><br><br>
       <a href="withdraw.jsp" >ȸ�� Ż��</a><br>
       </div>
    </div>
		</div>
		<div style="border:2px solid #7aa5d2; border-radius: 40px; width:60%; margin:auto;background-color:white">
		  <ul class="slider" style="width:100%; height:360px; padding:0; margin:auto;">
	
	<%
	Setup_sql m_sql1, m_sql2;
    m_sql1 = new Setup_sql(); //sql ����
    ResultSet matching_rs, profile_rs;
	String id = (String)session.getAttribute("id");
	String sql = "select * from matching where owner_id ='" + id +"'";
	m_sql1.search(sql); matching_rs = m_sql1.resultSet;
	if(matching_rs != null){
		while(matching_rs.next()){
			m_sql2 = new Setup_sql(); //sql ����
			sql = "select * from profile where e_mail ='" + matching_rs.getString("mate_email") +"'";
			m_sql2.search(sql); profile_rs = m_sql2.resultSet; profile_rs.next();
			System.out.println(sql);
			
	%>
		    <li>
		        <dl>
		          <dd style="width:100%; margin:0px 0px 0px 0px;">
					<div class="user_table">
						<div class="column-title">
							E-mail
						</div>
						<div class="column-contents">
							<%=matching_rs.getString("mate_email") %>
						</div>	
						<div class="column-title">
							�ڱ�Ұ�
						</div>
						<div class="column-contents">
							<%=profile_rs.getString("introduce") %>							
						</div>
						<div class="column-title">
							����
						</div>
						<div class="column-contents">
							<%=profile_rs.getString("job") %>							
						</div>
						<div class="column-title">
							����
						</div>
						<div class="column-contents">
							<%=profile_rs.getString("tendency") %>							
						</div>
						<div class="column-title">
							�� ����
						</div>
						<div class="column-contents">
							<%=profile_rs.getString("smoking") %>							
						</div>
						<div class="column-title">
							�ݷ����� ����
						</div>
						<div class="column-contents">
							<%=profile_rs.getString("pet") %>							
						</div>
					</div>
				  </dd>
		        </dl>
		    </li>
	   <% 
	    m_sql2.close();
	    profile_rs.close();  
		}
	}
   matching_rs.close();
   m_sql1.close();
    %> 
    
    		  </ul>
		</div>
		
		<br>
			<button type="button" id="prev" style="width:100px; height:30px; margin:auto; border:2px solid lightgray; background-color:lightgray;"><</button>
		    <button type="button" id="next" style="width:100px; height:30px; margin:auto; border:2px solid lightgray; background-color:lightgray;">></button>
	</div>
    
</body>
</html>