package pension.dao;

import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

import pension.dto.RoomDto;
public class ReserveDao {
	Connection conn;
	public ReserveDao() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://localhost:3306/pension";
		conn = DriverManager.getConnection(db,"root","1234");
	}
	public ArrayList<RoomDto> room_info() throws Exception
	{	// 달력에 출력할 방의 이름을 전달(구분을 하기위해 id도 전달)
		String sql = "select id, name from room order by price";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<RoomDto> list = new ArrayList<RoomDto>();
		while(rs.next())
		{
			RoomDto rdto = new RoomDto();
			rdto.setId(rs.getInt("id"));
			rdto.setName(rs.getString("name"));
			list.add(rdto);
		}
		return list;
	}
	public RoomDto reserve_next(HttpServletRequest request) throws Exception
	{
		String id = request.getParameter("id");
		String sql ="select * from room where id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		RoomDto rdto = new RoomDto();
		rdto.setId(rs.getInt("id"));
		rdto.setMin(rs.getInt("min"));
		rdto.setMax(rs.getInt("max"));
		rdto.setPrice(rs.getInt("price"));
		rdto.setName(rs.getString("name"));
		return rdto;
	}
}
