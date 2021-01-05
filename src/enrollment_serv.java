


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class enrollment_serv
 */
@WebServlet("/enrollment_serv")
@MultipartConfig
public class enrollment_serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private String id, form, type, floor, structure, 
							smoking, pet, region ,deposit , monthly,date, image, lat, lng, query, url;
	private String[] ho, ro, ages;
	Connection connection;
	Statement statement;
	ResultSet resultSet;
	
    public enrollment_serv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");		
		Part part = request.getPart("file");
		HttpSession session = request.getSession();
		
		id =  (String)session.getAttribute("id");
		form = request.getParameter("form");
		type = request.getParameter("type");
		floor = request.getParameter("floor");
		structure = request.getParameter("structure");
		ho = request.getParameterValues("houseoption");
		ro = request.getParameterValues("roomoption");
		ages = request.getParameterValues("age");
		smoking = request.getParameter("smoking");
		pet = request.getParameter("pet");
		region = request.getParameter("region");
		deposit = request.getParameter("deposit");
		monthly = request.getParameter("monthly");
		date = request.getParameter("date");
		image = request.getParameter("image");
		lat = (String)request.getParameter("lat");
		lng = (String)request.getParameter("lng");
		
		String path = "C:\\Users\\yoonj\\eclipse-work\\Project_WebP_real_final\\WebContent\\upload\\" + id; //폴더 경로
		File Folder = new File(path);
		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			} 
		    catch(Exception e){
			    e.getStackTrace();
			}        
	    }
		else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}		
		 
		query = "INSERT INTO enroll (id, form, type, floor, structure, houseoption, roomoption, age, smoking, pet, region, deposit, monthly, date, lat, lng) VALUES ('" + id + "','" + form + "','" + type + "','" 
											 + floor + "','" + structure + "','" + Arrays.toString(ho) + "','" + Arrays.toString(ro) + "','" + Arrays.toString(ages) + "','"
											 + smoking + "','" +pet + "','" +region + "','" + deposit + "','" + monthly + "','" +date + "','" + String.format("%.5f", Double.parseDouble(lat)) + "','" + String.format("%.5f", Double.parseDouble(lng)) + "')";
		PrintWriter out = response.getWriter();
		System.out.println(query);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			url = "jdbc:mysql://localhost:3306/Webp_TP?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
            connection = DriverManager.getConnection(url, "root", "0000");
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            statement.executeUpdate(query);
            part.write(path + "/image.jpg");
            out.println("<script>");
    		out.println("alert('룸메이트 등록이 완료되었습니다.');");
    		out.println("location.href='front.jsp'");
    		out.println("</script>");
        } catch (Exception e) { 
            out.println("<script>");
    		out.println("alert('룸메이트 등록이 실패하였습니다.');");
    		out.println("location.href='enrollment.jsp'");
    		out.println("</script>");
    		e.printStackTrace();
        } finally {
        	out.close();
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (Exception e2) {
            	e2.printStackTrace(); 
            }
            //response.sendRedirect("loginResult.jsp");   
        }
		
		
	}

}
