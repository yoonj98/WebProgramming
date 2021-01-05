


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import serv.Setup_sql;

/**
 * Servlet implementation class user_modify
 */
@WebServlet("/user_modify")
public class user_modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private String id, passwd, phone, query, url;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_modify() {
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
		Setup_sql m_sql = new Setup_sql(); //sql 연결
		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");		
		
		id = (String)session.getAttribute("id");
		passwd = request.getParameter("passwd");
		phone = request.getParameter("phone");
		url = "update user set passwd = '" + passwd + "', phone = '" + phone + "' where id ='"  + id + "'";
		PrintWriter out = response.getWriter();
		
		if(m_sql.modify(url)) {
            out.println("<script>");
    		out.println("alert('정보를 성공적으로 변경하였습니다.');");
    		out.println("location.href='front.jsp'");
    		out.println("</script>");    
		}
		else {
            out.println("<script>");
    		out.println("alert('프로필 등록이 실패하였습니다.');");
    		out.println("location.href='usermodify.jsp'");
    		out.println("</script>");			
		}
		m_sql.close();
	}
}
