<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pension.dao.GongjiDao" %>
<%@ page import="pension.dto.GongjiDto" %>
<%
	GongjiDao gdao = new GongjiDao();
	GongjiDto gdto = gdao.gcontent(request);
	pageContext.setAttribute("gdto", gdto);
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

<table width="700" height="200" align="center" border="1" style="border-collapse:collapse;margin-top:100px;">
	<tr align="center" height="30">
		<td width="50"> 제 목 </td>
		<td> ${gdto.title } </td>
	</tr>
	<tr align="center" height="30">
		<td> 내 용 </td>
		<td> ${gdto.content } </td>
	</tr>
	<tr align="center" height="30">
		<td colspan="2"> 조 회 수 :
		${gdto.readnum } &nbsp; &nbsp; &nbsp; &nbsp;
		작 성 일 :
		${gdto.writeday } </td>
	</tr>
	<tr align="center" height="30">
		<td colspan="2"><a href="glist.jsp">목록으로</a></td>
	</tr>
</table>

</div>
<!-- 모든 문서의 내용 끝 부분 -->
<c:import url="../bottom.jsp"/>