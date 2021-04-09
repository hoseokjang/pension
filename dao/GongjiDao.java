package pension.dao;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pension.dto.GongjiDto;

public class GongjiDao {
	Connection conn;
	public GongjiDao() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://localhost:3306/pension?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		conn = DriverManager.getConnection(db,"root","chang1267");
	}
	public void gwrite_ok(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String sql = "insert into gongji(title,content,writeday)";
		sql = sql+" values(?, ?, now())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		response.sendRedirect("glist.jsp");
	}
	public ArrayList<GongjiDto> glist() throws Exception
	{
		String sql = "select * from gongji order by id desc";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<GongjiDto> glist = new ArrayList<GongjiDto>();
		while(rs.next())
		{
			GongjiDto gdto = new GongjiDto();
			gdto.setId(rs.getInt("id"));
			gdto.setTitle(rs.getString("title"));
			gdto.setContent(rs.getString("content"));
			gdto.setReadnum(rs.getInt("readnum"));
			gdto.setWriteday(rs.getString("writeday"));
			glist.add(gdto);
		}
		return glist;
	}
	public void greadnum(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id = request.getParameter("id");
		String sql = "update gongji set readnum=readnum+1 where id="+id;
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
		response.sendRedirect("gcontent.jsp?id="+id);
	}
	public GongjiDto gcontent(HttpServletRequest request) throws Exception
	{
		String id=request.getParameter("id");
		String sql = "select * from gongji where id="+id;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		GongjiDto gdto = new GongjiDto();
		gdto.setId(rs.getInt("id"));
		gdto.setTitle(rs.getString("title"));
		gdto.setContent(rs.getString("content").replace("\r\n", "<br>"));
		gdto.setReadnum(rs.getInt("readnum"));
		gdto.setWriteday(rs.getString("writeday"));
		return gdto;
	}
	public void gdelete(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String id = request.getParameter("id");
		String sql = "delete from gongji where id="+id;
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
		response.sendRedirect("glist.jsp");
	}
}
