package serv;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Setup_sql {
	Connection connection;
	public Statement statement;
	public ResultSet resultSet;
	String url;
	public Setup_sql(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			url = "jdbc:mysql://localhost:3306/Webp_TP?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
            connection = DriverManager.getConnection(url, "root", "0000");
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        } catch (Exception e) { 
    		e.printStackTrace();
        } finally {
        }	
	}
	public void close() {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (Exception e2) {
        	e2.printStackTrace(); 
        }
	}	
	public boolean modify(String url) {
		try {
			statement.executeUpdate(url);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	public void insert(String url) {
		
	}
	public void delete(String url) {
		
	}
	public void search(String url) {
		try {
			this.resultSet = statement.executeQuery(url);
		} catch (SQLException e) {
			this.resultSet = null;
		}
	}
	
	public static double distanceInKilometerByHaversine(String x1, String y1, String x2, String y2) {
		double x1_, x2_, y1_, y2_;
		x1_ = Double.parseDouble(x1);	
		x2_ = Double.parseDouble(x2);	
		y1_ = Double.parseDouble(y1);	
		y2_ = Double.parseDouble(y1);
	    double distance;
	    double radius = 6371; // 지구 반지름(km)
	    double toRadian = Math.PI / 180;
	    double deltaLatitude = Math.abs(x1_ - x2_) * toRadian;
	    double deltaLongitude = Math.abs(y1_ - y2_) * toRadian;
	    double sinDeltaLat = Math.sin(deltaLatitude / 2);
	    double sinDeltaLng = Math.sin(deltaLongitude / 2);
	    double squareRoot = Math.sqrt(
	    sinDeltaLat * sinDeltaLat +
	    Math.cos(x1_ * toRadian) * Math.cos(x2_ * toRadian) * sinDeltaLng * sinDeltaLng);
	    distance = 2 * radius * Math.asin(squareRoot);
	    return distance;
	}
}
