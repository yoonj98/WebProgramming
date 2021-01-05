package check;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JoinService {

	public boolean idcheck(String userId) throws Exception{ //아이디 중복체크
		boolean check;
		Connection conn = null;  
		       Class.forName("com.mysql.jdbc.Driver");
		try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/Webp_TP?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
		String dbUser = "root";
		String dbPass = "0000";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		//DAO 객체를 생성 시 Connection 전달 
		JoinDao joinDao = new JoinDao(conn);
		check = joinDao.idCheck(userId);
		}
		finally {
		if (conn != null) try { conn.close(); } catch(SQLException ex) {};
		}
		return check;
	}
	public boolean e_mail_check(String e_mail) throws Exception{ //e_mail 중복체크
		boolean check;
		Connection conn = null;  
		Class.forName("com.mysql.jdbc.Driver");
		try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/Webp_TP?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true&useSSL=false";
		String dbUser = "root";
		String dbPass = "0000";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		//DAO 객체를 생성 시 Connection 전달 
		JoinDao joinDao = new JoinDao(conn);
		check = joinDao.e_mail(e_mail);
		}
		finally {
		if (conn != null) try { conn.close(); } catch(SQLException ex) {};
		}
		return check;
	}
}
