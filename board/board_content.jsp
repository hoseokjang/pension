<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pension.dao.BoardDao" %>
<%@ page import="pension.dto.BoardDto" %>
<style>
#third{
	width:1100px;
	height:400px;
/*	background:red;	*/
	margin:auto;
}
a{
	text-decoration:none;color:black;
}
</style>
<script>
	function del()
	{
		document.getElementById("del").style.display = "table-row";
	}
</script>
<c:import url="../top.jsp"/>
<div id="third">
<%
	BoardDao bdao = new BoardDao();
	BoardDto bdto = bdao.board_content(request);
	pageContext.setAttribute("bdto", bdto);
	pageContext.setAttribute("chk", request.getParameter("chk"));
%>
<table width="700" height="200" align="center" border="1" style="border-collapse:collapse;margin-top:100px;">
	<tr align="center" height="30">
		<td width="50"> 제 목 </td>
		<td> ${bdto.title } </td>
	</tr>
	<tr align="center" height="30">
		<td> 내 용 </td>
		<td> ${bdto.content } </td>
	</tr>
	<tr align="center" height="30">
		<td colspan="2"> 조 회 수 :
		${bdto.readnum } &nbsp; &nbsp; &nbsp; &nbsp;
		작 성 일 :
		${bdto.writeday } </td>
	</tr>
	<tr align="center" height="30">
		<td colspan="2"><a href="board_list.jsp">목록으로</a></td>
	</tr>
	<c:if test="${bdto.name == name }">
		<tr align="center" height="30">
			<td colspan="2">
				<a href="javascript:del()">삭제</a> &nbsp;&nbsp;&nbsp;
				<a href="board_update.jsp?id=${bdto.id }">수정</a>
			</td>
		</tr>
	</c:if>
	<tr align="center" id="del" style="display:none;">
		<td colspan="2">
			<form name="del" method="post" action="board_delete.jsp?id=${bdto.id }">
				<input type="hidden" name="id" value="${bdto.id }">
				비밀번호 <input type="password" name="pwd">
				<input type="submit" value="삭제">
			</form>
		</td>
	</tr>
	<c:if test="${chk != null }">
		<tr align="center" height="30">
			<td colspan="2" style="color:red"> 비밀번호가 틀렸습니다. </td>
		</tr>
	</c:if>
	
</table>

</div>
<c:import url="../bottom.jsp"/>