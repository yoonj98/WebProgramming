


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
 * Servlet implementation class login_serv
 */
@WebServlet("/login_serv")
public class login_serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private String id, pw, query, url;
	Connection connection;
	Statement statement;
	ResultSet resultSet;	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login_serv() {
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
		
		id = request.getParameter("user_id");
		pw = request.getParameter("user_pw");

		query = "select * from user where id = '" + id + "'&& passwd = '" + pw + "'";
		PrintWriter out = response.getWriter();
		System.out.println(query);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			url = "jdbc:mysql://localhost:3306/Webp_TP?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
            connection = DriverManager.getConnection(url, "root", "0000");
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            resultSet = statement.executeQuery(query);
            if(resultSet.next()) {
        		session.setAttribute("id", id);
        		session.setAttribute("e_mail", resultSet.getString("e_mail"));
        		session.setAttribute("name", resultSet.getString("name"));
        		session.setAttribute("sex", resultSet.getString("sex"));
        		session.setAttribute("birth", resultSet.getString("birth"));
        		session.setAttribute("phone", resultSet.getString("phone"));
                response.sendRedirect("front.jsp");
            }
            else {
            	//encodeURI
                out.println("<script>");
        		out.println("alert('아이디 또는 비번을 다시 확인해주세요.');");
        		out.println("location.href='login.jsp'");
        		out.println("</script>");          	
            }

        } catch (Exception e) { 
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
        }
		
		
	}

}
