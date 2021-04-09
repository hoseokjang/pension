<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pension.dao.GongjiDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pension.dto.GongjiDto" %>
<%
	GongjiDao gdao = new GongjiDao();
	ArrayList<GongjiDto> glist = gdao.glist();
	pageContext.setAttribute("glist", glist);
%>
<style>
#third{
	width:1100px;
	height:400px;
/*	background:red;	*/
	margin:auto;
}
a{
	text-decoration:none;
	color:black;
}
</style>
<c:import url="../top.jsp"/>
<div id="third">
<!-- 모든 문서의 내용 시작 부분 -->
<table width="700" align="center">
<caption><h3>공 지 사 항</h3></caption>
	<tr align="center">
		<td> 작 성 자 </td>
		<td> 제 목 </td>
		<td> 조 회 수 </td>
		<td> 작 성 일 </td>
		<c:if test="${userid == 'admin' }">
		<td> 삭제 </td>
		</c:if>
	</tr>
	<c:forEach var="gdto" items="${glist }">
		<tr align="center">
			<td> 관리자 </td>
			<td> <a href="greadnum.jsp?id=${gdto.id }">${gdto.title }</a> </td>
			<td> ${gdto.readnum } </td>
			<td> ${gdto.writeday } </td>
			<c:if test="${userid == 'admin' }">
			<td> <a href="gdelete.jsp?id=${gdto.id }">삭제 </a> </td>
			</c:if>
		</tr>
	</c:forEach>
	<c:if test="${userid == 'admin' }">
	<tr align="center">
		<td colspan="5" style="padding-top:10px;"> <a href="gwrite.jsp">작 성</a> </td>
	</tr>
	</c:if>
</table>
</div>
<!-- 모든 문서의 내용 끝 부분 -->
<c:import url="../bottom.jsp"/>