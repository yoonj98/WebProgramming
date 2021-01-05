<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="serv.Setup_sql" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="mystyle.css">
<meta charset="UTF-8">
<title> 마이페이지 </title>
<style type="text/css">
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
			<a id = "menu" href="find.jsp"><font color="white">룸메이트찾기 </font></a>
			<a href="login.jsp"><font color="white">룸메이트등록 </font></a>	<%--login X -> login page --%>
			<a href="notice_list.jsp"><font color="white">공지사항</font></a>
			<a href="login.jsp"><font color="white">마이페이지</font></a>	<%--login X -> login page --%>
			<a href="login.jsp"><font color="white">로그인 </font></a>
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
	<%} 
	Setup_sql m_sql = new Setup_sql(); //sql 연결
	String nickname, introduce, job, tendency, date, smoking, pet;
	String e_mail = (String)session.getAttribute("e_mail");
	String sql = "select * from profile where e_mail ='" + e_mail +"'";
	m_sql.search(sql);
	if(m_sql.resultSet != null) { //검색 결과 유무 체크
		try {
			m_sql.resultSet.next(); 
			nickname = m_sql.resultSet.getString("nickname");
			introduce = m_sql.resultSet.getString("introduce");
			job = m_sql.resultSet.getString("job");
			tendency = m_sql.resultSet.getString("tendency");
			date = m_sql.resultSet.getString("date");
			smoking = m_sql.resultSet.getString("smoking");
			pet = m_sql.resultSet.getString("pet");

   %>
    <h2 style="position:fixed; left:50%;">프로필 설정</h2><br><br><br><br>
    <div style=" width:13%; height:180px; float:left; margin:0px 50px 0px 0px;border:2px solid #ddd; border-radius: 20px;background-color:white">
       <div style="margin:10px 0px 0px 0px; text-align:center;">
       <a href="mypage.jsp">프로필 수정</a><br><br>
       <a href="usermodify.jsp" >회원정보 수정</a><br><br>
       <a href="housetouruser.jsp" >하우스 투어 회원 확인</a><br><br>
       <a href="withdraw.jsp" >회원 탈퇴</a><br>
       </div>
    </div>
    <div style="height:auto; border:2px solid #7aa5d2; padding:0px 0px 10px 0px;border-radius: 20px; width:80%; float:left;background-color:white">
      <form action="./mypage" method="post">
         <div style="text-align:center; height:auto; width:45%; float : left; margin-left:10px; margin-right:50px;"><br>
               <h3><label >아이디 </label></h3>
               <p><%=session.getAttribute("id") %></p>   
               
               <h3><label>자기소개 </label></h3>
               <textarea rows="10" cols="35" name="introduce" id="introduce"><%=introduce %></textarea><br>            
         </div><br>
         <div style="text-align:center; height:auto; width : 45%; float : left;">
               <h3><label>직업 </label></h3>
               <select id="job" name="job" style="width:150px;"> 
                  <option selected value="<%=job %>"><%=job %></option> 
                     <option value="대학생">대학생</option> 
                     <option value="대학원생">대학원생</option>
                     <option value="취업준비생">취업준비생</option> 
                     <option value="직장인">직장인</option>
                     <option value="프리랜서">프리랜서</option> 
               </select><br>
               
               <h3><label>성향 </label></h3>
               <select id="tendency" name="tendency" style="width:150px;"> 
                  <option selected value="<%=tendency %>"><%=tendency %></option> 
                     <option value="외향적">외향적</option> 
                     <option value="적극적">적극적</option>
                     <option value="집순이">집순이</option>
                     <option value="내향적">내향적</option>
                     <option value="조용한">조용한</option>
                     <option value="깔끔한">깔끔한</option> 
               </select><br><br>               
               <h3 style="display:inline; width:100px;"><label>흡연 여부 </label></h3> 
                  <select id="smoking" name="smoking" style="width:150px;">
                     <option selected value="<%=smoking %>"><%=smoking %></option> 
                     <option value="흡연자">흡연자</option>
                     <option value="비흡연자">비흡연자</option> 
                  </select><br><br>
                  
               <h3 style="display:inline; width:100px;"><label>반려동물 여부</label></h3> 
                  <select id="pet" name="pet" style="width:150px;">   
                     <option selected value="<%=pet %>"><%=pet %></option> 
                     <option value="키운다">키운다</option>
                     <option value="안키운다">안키운다</option> 
                  </select>
               <input type="hidden" id="e_mail" name="e_mail" value="<%=session.getAttribute("e_mail") %>"> 
               <br><br><br>
         <input type="submit" value="확인" style="width:100px; height:30px; border:2px solid lightgray; background-color:lightgray; float:right;"><br><br><br>         
         </div>
         </form>
      </div>
      			<% 
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		m_sql.close();
	}
   %>   
</body>
</html>