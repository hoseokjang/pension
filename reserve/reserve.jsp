<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#third{
	width:1100px;
	height:800px;
/*	background:red;	*/
	margin:auto;
	padding-top:50px;
}
.sun{color:red;}
.sat{color:blue;}
</style>
<c:import url="../top.jsp"/>
<div id="third">
<%@ page import="java.time.LocalDate" %>
<%
	// 이번달 달력 : 1일의 요일, 해당 월의 총 일수, 몇 주
	LocalDate today = LocalDate.now(); // 현재시간
	double chong = today.lengthOfMonth(); // 총 일수
	int y = today.getYear();
	int m = today.getMonthValue();
	LocalDate dday = LocalDate.of(y,m,1); // 1일의 요일
	int yoil = dday.getDayOfWeek().getValue();
	if (yoil == 7)
		yoil = 0; // 일요일을 0으로 바꿔줌
	int ju = (int)Math.ceil((chong + yoil)/7);
	
	pageContext.setAttribute("yoil", yoil);
	pageContext.setAttribute("ju", ju);
	pageContext.setAttribute("chong", chong);
	pageContext.setAttribute("y",y);
	pageContext.setAttribute("m",m);
%>
	<table width="800" align="center" border="1" style="border-collapse:collapse">
	<caption><h3>예 약</h3></caption>
	<tr align="center">
		<td class="sun"> 일 </td>
		<td> 월 </td>
		<td> 화 </td>
		<td> 수 </td>
		<td> 목 </td>
		<td> 금 </td>
		<td class="sat"> 토 </td>
	</tr>
	<c:set var="day" value="1"/>
	<c:forEach var="i" begin="0" end="${ju-1 }">
		<tr align="right">
		<c:forEach var="j" begin="0" end="6">
			<c:if test="${(yoil > j && i == 0) || (chong < day) }">
					<td> &nbsp; </td>
			</c:if>
<%@ page import="pension.dao.ReserveDao" %>
<%@ page import="pension.dto.RoomDto" %>
<%@ page import="java.util.ArrayList" %>
<%
	ReserveDao rdao = new ReserveDao();
	ArrayList<RoomDto> list = rdao.room_info();
	pageContext.setAttribute("list", list);
%>
			<c:if test="${!((yoil > j && i == 0) || (chong < day)) }">
				<td> ${day }<br> 
				<c:forEach var="rdto" items="${list }">
					<a href="reserve_next.jsp?id=${rdto.id }&y=${y}&m=${m}&day=${day}">${rdto.name }</a><br>
				</c:forEach>
				</td>
				<c:set var="day" value="${day+1 }"/>
			</c:if>
			</c:forEach>
		</tr>
	</c:forEach>
	</table>

</div>
<c:import url="../bottom.jsp"/>