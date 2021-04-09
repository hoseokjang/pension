package pension.dao;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class MemberDao {
	Connection conn;
	public MemberDao() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://localhost:3306/pension?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		conn = DriverManager.getConnection(db,"root","chang1267");
	}
	public void member_ok(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String phone = request.getParameter("phone");
		String sql = "insert into member(name, phone, userid, pwd, writeday)";
		sql = sql+" values(?,?,?,?,now())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		pstmt.setString(3, userid);
		pstmt.setString(4, pwd);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		response.sendRedirect("login.jsp");
	}
	public int login_ok(HttpServletRequest request, HttpSession session) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String sql = "select * from member where userid=? and pwd=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, pwd);
		ResultSet rs = pstmt.executeQuery();
		
		int chk=1;
		if(rs.next())
		{
			session.setAttribute("userid", rs.getString("userid"));
			session.setAttribute("name", rs.getString("name"));
			session.setAttribute("pwd", rs.getString("pwd"));
			chk = 0;
		}
		return chk;
	}
	public void userid_search_ok(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String sql = "select userid from member where name=? and phone=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		ResultSet rs = pstmt.executeQuery();
		int chk = 1;
		if(rs.next())
		{
			session.setAttribute("userid", rs.getString("userid"));
			chk = 1;
		}
		response.sendRedirect("userid_search.jsp?chk="+chk);
	}
	public void pwd_search_ok(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String sql = "select pwd from member where userid=? and name=? and phone=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, name);
		pstmt.setString(3, phone);
		ResultSet rs = pstmt.executeQuery();
		int chk=1;
		if(rs.next())
		{
			session.setAttribute("pwd", rs.getString("pwd"));
			chk = 0;
		}
		response.sendRedirect("pwd_search.jsp?chk="+chk);
	}
}
