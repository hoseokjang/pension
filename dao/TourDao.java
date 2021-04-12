package pension.dao;

import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import java.util.ArrayList;
import pension.dto.TourDto;

public class TourDao {
	Connection conn=null;
	public TourDao() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
   	    String db="jdbc:mysql://localhost:3306/pension";
   	    conn=DriverManager.getConnection(db,"root","1234");
	}
	
	public void twrite_ok(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception
	{
		String path=request.getRealPath("/tour/img");// 절대경로, 상대경로 (주로 상대경로 사용)
		int size=1024*1024*10;
		                        // request,경로,크기,한글,new De.....
		MultipartRequest multi=new MultipartRequest(
				request,path,size,"utf-8",new DefaultFileRenamePolicy()
				);
		String userid = (String)session.getAttribute("userid");
		String title= multi.getParameter("title");
		String content = multi.getParameter("content");
		String fname = multi.getFilesystemName("fname"); // 실제 저장되는 파일 이름
		String sql = "insert into tour(userid, title, content, fname, writeday)";
		sql = sql + " values(?,?,?,?,now())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.setString(4, fname);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		response.sendRedirect("tlist.jsp");
	}
	public ArrayList<TourDto> tlist() throws Exception
	{
		String sql = "select t.*, m.name from tour as t, member as m where t.userid=m.userid order by id desc";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<TourDto> tlist = new ArrayList<TourDto>();
		while(rs.next())
		{
			TourDto tdto = new TourDto();
			tdto.setId(rs.getInt("id"));
			tdto.setUserid(rs.getString("userid"));
			tdto.setTitle(rs.getString("title"));
			tdto.setContent(rs.getString("content"));
			tdto.setFname(rs.getString("fname"));
			tdto.setReadnum(rs.getInt("readnum"));
			tdto.setWriteday(rs.getString("writeday"));
			tdto.setName(rs.getString("name"));
			tlist.add(tdto);
		}
		return tlist;
	}
}

