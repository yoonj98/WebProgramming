


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import serv.Setup_sql;
/**
 * Servlet implementation class withdraw_serv
 */
@WebServlet("/withdraw_serv")
public class withdraw_serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String id, passwd, phone, query, url;       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public withdraw_serv() {
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

		Setup_sql m_sql0 = new Setup_sql(); //sql 연결
		Setup_sql m_sql = new Setup_sql(); //sql 연결
		
		HttpSession session = request.getSession();

		id = (String)session.getAttribute("id");
		passwd = request.getParameter("passwd");
		url = "select * from user where id = '" + id + "' && passwd = '" + passwd + "'";
		m_sql0.search(url);
		
		PrintWriter out = response.getWriter();
		
		try {
			if(m_sql0.resultSet.next()) {
				url = "delete from user where id = '" + id + "' && passwd = '" + passwd + "'";
				m_sql.modify(url);
				url = "delete from profile where nickname = '" + id + "'";	
				m_sql.modify(url);
				url = "delete from matching where owner_id = '" + id + "' || mate_id = '" + id + "'";
				m_sql.modify(url);
				url = "delete from enroll where id = '" + id + "'";	
				m_sql.modify(url);
				session.invalidate();
			    out.println("<script>");
				out.println("alert('사용해주셔서 감사합니다.');");
				out.println("location.href='front.jsp'");
				out.println("</script>");    
			}
			else {
			    out.println("<script>");
				out.println("alert('탈퇴가 실패하였습니다 고객센터로 문의주세요.');");
				out.println("location.href='withdraw.jsp'");
				out.println("</script>");			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		m_sql.close();
		m_sql0.close();
	}

}
