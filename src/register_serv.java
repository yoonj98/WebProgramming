


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
 * Servlet implementation class register_serv
 */
@WebServlet("/register_serv")
public class register_serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private String id, e_mail, passwd, name, sex, birth, phone, query, url;
	Connection connection;
	Statement statement;
	ResultSet resultSet;	
	
    public register_serv() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		
		id = request.getParameter("id");
		e_mail = request.getParameter("e_mail");
		passwd = request.getParameter("passwd");
		name = request.getParameter("name");
		sex = request.getParameter("sex");
		birth = request.getParameter("birth");
		phone = request.getParameter("phone");
		
		query = "INSERT INTO user VALUES ('" +id+"','"+ e_mail + "','" + passwd + "','" 
											 + name + "','" + sex + "','" + birth + "','"
											 + phone + "')";
		PrintWriter out = response.getWriter();
		System.out.println(query);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			url = "jdbc:mysql://localhost:3306/Webp_TP?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
            connection = DriverManager.getConnection(url, "root", "0000");
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            statement.executeUpdate(query);
    		session.setAttribute("id", id);
    		session.setAttribute("e_mail", e_mail);
    		session.setAttribute("name", name);
    		session.setAttribute("sex", sex);
    		session.setAttribute("birth", birth);
    		session.setAttribute("phone", phone);
            out.println("<script>");
    		out.println("alert('회원가입이 완료되었습니다.');");
    		session.setAttribute("id", id);
    		out.println("location.href='mypage_regist.jsp'");
    		out.println("</script>");
        } catch (Exception e) { 
            out.println("<script>");
    		out.println("alert('회원가입이 실패했습니다.');");
    		out.println("location.href='login.jsp'");
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
