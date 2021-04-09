package pension.dao;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pension.dto.BoardDto;

public class BoardDao {
	Connection conn;
	public BoardDao() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://localhost:3306/pension?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		conn = DriverManager.getConnection(db,"root","chang1267");
	}
	public void board_write_ok(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String name = (String) session.getAttribute("name");
		String content = request.getParameter("content");
		String sql = "insert into board(name, title, content, writeday)";
		sql = sql+" values(?,?,?,now())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		response.sendRedirect("board_list.jsp");
	}
	public ArrayList<BoardDto> board_list() throws Exception
	{
		String sql = "select * from board order by id desc";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		while(rs.next())
		{
			BoardDto bdto = new BoardDto();
			bdto.setId(rs.getInt("id"));
			bdto.setName(rs.getString("name"));
			bdto.setTitle(rs.getString("title"));
			bdto.setContent(rs.getString("content"));
			bdto.setReadnum(rs.getInt("readnum"));
			bdto.setWriteday(rs.getString("writeday"));
			
			list.add(bdto);
		}
		return list;
	}
	public void board_readnum(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id = request.getParameter("id");
		String sql = "update board set readnum=readnum+1 where id="+id;
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
		response.sendRedirect("board_content.jsp?id="+id);
	}
	public BoardDto board_content(HttpServletRequest request) throws Exception
	{
		String id = request.getParameter("id");
		String sql = "select * from board where id="+id;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		BoardDto bdto = new BoardDto();
		bdto.setId(rs.getInt("id"));
		bdto.setName(rs.getString("name"));
		bdto.setTitle(rs.getString("title"));
		bdto.setContent(rs.getString("content"));
		bdto.setReadnum(rs.getInt("readnum"));
		bdto.setWriteday(rs.getString("writeday"));
		return bdto;
	}
	public int board_delete(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception
	{
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String userid = (String) session.getAttribute("userid");
		String sql2 = "select pwd from member where userid='"+userid+"'";
		Statement stmt2 = conn.createStatement();
		ResultSet rs = stmt2.executeQuery(sql2);
		rs.next();
		int chk = 1;
		if(pwd.equals(rs.getString("pwd")))
		{
			String sql = "delete from board where id="+id;
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
			chk = 0;
			response.sendRedirect("board_list.jsp");
		}
		else
		{
			response.sendRedirect("board_content.jsp?chk=1&id="+id);
		}
		return chk;
	}
	public BoardDto board_update(HttpServletRequest request) throws Exception
	{
		String id = request.getParameter("id");
		String sql = "select * from board where id="+id;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		BoardDto bdto = new BoardDto();
		bdto.setId(rs.getInt("id"));
		bdto.setTitle(rs.getString("title"));
		bdto.setName(rs.getString("name"));
		bdto.setContent(rs.getString("content"));
		bdto.setReadnum(rs.getInt("readnum"));
		bdto.setWriteday(rs.getString("writeday"));
		return bdto;
	}
	public int board_update_ok(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String userid = (String) session.getAttribute("userid");
		String sql2 = "select pwd from member where userid='"+userid+"'";
		Statement stmt2 = conn.createStatement();
		ResultSet rs = stmt2.executeQuery(sql2);
		rs.next();
		int chk = 1;
		if(pwd.equals(rs.getString("pwd")))
		{
			String sql = "update board set title=?, content=? where id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, id);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			chk = 0;
			response.sendRedirect("board_content.jsp?id="+id);
		}
		else
		{
			response.sendRedirect("board_update.jsp?chk=1&id="+id);
		}
		return chk;
	}
}
