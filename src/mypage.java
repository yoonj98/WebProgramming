


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class mypage
 */
@WebServlet("/mypage")
public class mypage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String e_mail, image, nickname, introduce, job, tendency, date, smoking, pet, query, url;
	Connection connection;
	Statement statement;
	ResultSet resultSet;
	
    public mypage() {
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
		HttpSession session = request.getSession();
		
		e_mail = request.getParameter("e_mail");
		image = request.getParameter("image");
		nickname = (String)session.getAttribute("id");
		introduce = request.getParameter("introduce");
		job = request.getParameter("job");
		tendency = request.getParameter("tendency");
		date = request.getParameter("date");
		smoking = request.getParameter("smoking");
		pet = request.getParameter("pet");

		query = "update profile set e_mail='" + e_mail + "', nickname = '" + nickname + "', introduce = '" + introduce + "', job = '" + job + "', tendency = '" + tendency + 
											"', date = '" + date + "', smoking = '" + smoking + "', pet = '" + pet + "' where e_mail ='" + e_mail + "'" ;
		
		PrintWriter out = response.getWriter();
		System.out.println(query);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			url = "jdbc:mysql://localhost:3306/Webp_TP?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
            connection = DriverManager.getConnection(url, "root", "0000");
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            statement.executeUpdate(query);
            out.println("<script>");
    		out.println("alert('프로필 수정이 완료되었습니다.');");
    		out.println("location.href='mypage.jsp'");
    		out.println("</script>");
        } catch (Exception e) { 
            out.println("<script>");
    		out.println("alert('프로필 수정이 실패하였습니다.');");
    		out.println("location.href='mypage.jsp'");
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
