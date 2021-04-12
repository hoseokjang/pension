<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#third{
	width:1100px;
	height:400px;
/*	background:red;	*/
	margin:auto;
}
a{text-decoration:none;color:black;}
tr{text-align:center;}
</style>
<c:import url="../top.jsp"/>
<div id="third">
<table width="500" align="center">
	<caption><h3>여행 후기</h3></caption>
	<tr>
		<td> 작성자 </td>
		<td> 제 목 </td>
		<td> 조회수 </td>
		<td> 작성일 </td>
	</tr>
<%@ page import="pension.dao.TourDao" %>
<%@ page import="pension.dto.TourDto" %>
<%@ page import="java.util.ArrayList" %>
<%
	TourDao tdao = new TourDao();
	TourDto tdto = new TourDto();
	ArrayList<TourDto> tlist = tdao.tlist();
	pageContext.setAttribute("tlist", tlist);
	
%>
	<c:forEach var="tdto" items="${tlist }">
	<tr>
		<td> ${tdto.name } </td>
		<td> ${tdto.title } </td>
		<td> ${tdto.readnum } </td>
		<td> ${tdto.writeday } </td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="4" align="center"> <a href="twrite.jsp">후기 작성</a> </td>
	</tr>
</table>

</div>
<c:import url="../bottom.jsp"/>