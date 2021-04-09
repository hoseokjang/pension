<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pension.dao.BoardDao" %>
<%@ page import="pension.dto.BoardDto" %>
<%@ page import="java.util.ArrayList" %>
<%
	BoardDao bdao = new BoardDao();
	ArrayList<BoardDto> blist = bdao.board_list();
	pageContext.setAttribute("blist", blist);
%>
<style>
#third{
	width:1100px;
	height:400px;
/*	background:red;	*/
	margin:auto;
}
tr{text-align:center;}
a{text-decoration:none;color:black;}
</style>
<c:import url="../top.jsp"/>
<div id="third">
<!-- 모든 문서의 내용 시작 부분 -->

<table width="700" align="center">
	<caption><h3>게시판</h3></caption>
	<tr>
		<td> 작 성 자 </td>
		<td> 제 목 </td>
		<td> 조 회 수 </td>
		<td> 작 성 일 </td>
	</tr>
	<c:forEach var="bdto" items="${blist }">
		<tr>
			<td> ${bdto.name } </td>
			<td> <a href="board_readnum.jsp?id=${bdto.id }">${bdto.title }</a> </td>
			<td> ${bdto.readnum } </td>
			<td> ${bdto.writeday } </td>
		</tr>
	</c:forEach>
	<c:if test="${userid != null }">
	<tr>
		<td colspan="4"> <a href="board_write.jsp">글 작 성</a> </td>
	</tr>
	</c:if>
</table>

</div>
<!-- 모든 문서의 내용 끝 부분 -->
<c:import url="../bottom.jsp"/>