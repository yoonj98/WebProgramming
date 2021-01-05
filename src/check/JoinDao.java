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
	    String sql="select count(*) as cnt from user where id=?"; // ������ ���� ����
	 try{
	  pstmt=conn.prepareStatement(sql); //�⺻ sql�� ����
	  pstmt.setString(1, userId); //ù��° ?�� ��Ʈ�� id�� ����
	  rs=pstmt.executeQuery();//������ �����ؼ� ������� rs�� ����
	  while(rs.next()){ //rs�� ���������� �ݺ�
	   cnt=rs.getInt("cnt"); //cnt�� ��񿡼� ������ cnt�� ����  
	  }
	  if(cnt>0){
	   flag=true; //������ ���������� ����Ǹ� ��   
	  }
	 }catch(Exception e){
	  System.out.println(e);
	 }finally{ //������ ��� �����Ѵ�
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
	    String sql="select count(*) as cnt from user where e_mail=?"; // ������ ���� ����
	 try{
	  pstmt=conn.prepareStatement(sql); //�⺻ sql�� ����
	  pstmt.setString(1, e_mail); //ù��° ?�� ��Ʈ�� id�� ����
	  rs=pstmt.executeQuery();//������ �����ؼ� ������� rs�� ����
	  while(rs.next()){ //rs�� ���������� �ݺ�
	   cnt=rs.getInt("cnt"); //cnt�� ��񿡼� ������ cnt�� ����  
	  }
	  if(cnt>0){
	   flag=true; //������ ���������� ����Ǹ� ��   
	  }
	 }catch(Exception e){
	  System.out.println(e);
	 }finally{ //������ ��� �����Ѵ�
	 if(rs!=null)try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	 }
	 return flag;
	}
}
