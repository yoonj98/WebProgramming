


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import serv.Setup_sql;
/**
 * Servlet implementation class find_serv
 */
@WebServlet("/find_serv")
public class find_serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private String lat, lng, type;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public find_serv() {
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
		type = request.getParameter("type");
		lat = (String)request.getParameter("lat");
		lng = (String)request.getParameter("lng");

		m_sql.search(type);
		if(m_sql.resultSet != null) { //검색 결과 유무 체크
			try {
				while(m_sql.resultSet.next()) {
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


}
