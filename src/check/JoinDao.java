package check;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JoinDao {
	
	Connection conn = null;  

	JoinDao(Connection conn){
		this.conn = conn;
	}
	
	public boolean idCheck(String userId) throws Exception{
	    boolean flag=false;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int cnt = 0;
	    String sql="select count(*) as cnt from user where id=?"; // 데이터 삽입 쿼리
	 try{
	  pstmt=conn.prepareStatement(sql); //기본 sql을 넣음
	  pstmt.setString(1, userId); //첫번째 ?를 스트링 id로 넣음
	  rs=pstmt.executeQuery();//쿼리를 실행해서 결과값을 rs로 저장
	  while(rs.next()){ //rs가 끝날때까지 반복
	   cnt=rs.getInt("cnt"); //cnt를 디비에서 가져온 cnt에 저장  
	  }
	  if(cnt>0){
	   flag=true; //쿼리가 정상적으로 실행되면 참   
	  }
	 }catch(Exception e){
	  System.out.println(e);
	 }finally{ //무조건 디비를 종료한다
	 if(rs!=null)try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	 }
	 return flag;
	}
	public boolean e_mail(String e_mail) throws Exception{
	    boolean flag=false;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int cnt = 0;
	    String sql="select count(*) as cnt from user where e_mail=?"; // 데이터 삽입 쿼리
	 try{
	  pstmt=conn.prepareStatement(sql); //기본 sql을 넣음
	  pstmt.setString(1, e_mail); //첫번째 ?를 스트링 id로 넣음
	  rs=pstmt.executeQuery();//쿼리를 실행해서 결과값을 rs로 저장
	  while(rs.next()){ //rs가 끝날때까지 반복
	   cnt=rs.getInt("cnt"); //cnt를 디비에서 가져온 cnt에 저장  
	  }
	  if(cnt>0){
	   flag=true; //쿼리가 정상적으로 실행되면 참   
	  }
	 }catch(Exception e){
	  System.out.println(e);
	 }finally{ //무조건 디비를 종료한다
	 if(rs!=null)try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	 }
	 return flag;
	}
}
