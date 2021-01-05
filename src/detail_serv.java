

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
 * Servlet implementation class detail_serv
 */
@WebServlet("/detail_serv")
public class detail_serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String owner_id, mate_id, mate_email, structure, url;
	      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detail_serv() {
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
		
		mate_id = (String)session.getAttribute("id");
		mate_email = (String)session.getAttribute("e_mail");
		owner_id = (String) request.getParameter("id");
		System.out.println(owner_id);
		
		
		url = "INSERT INTO matching VALUES ('" +owner_id+ "', '"+mate_id + "', '"+ mate_email  + "')";
		PrintWriter out = response.getWriter();
		System.out.println(url);
		if(m_sql.modify(url)) {
            out.println("<script>");
    		out.println("alert('신청이  성공하였습니다.');");
    		out.println("location.href='detailpage.jsp?id=" + owner_id + "'");
    		out.println("</script>");    
		}
		else {
            out.println("<script>");
    		out.println("alert('신청을 실패하였습니다.');");
    		out.println("location.href='detailpage.jsp?id=" + owner_id + "'");
    		out.println("</script>");			
		}
		m_sql.close();
	}

}
