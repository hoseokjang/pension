<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pension.dao.BoardDao" %>
<%@ page import="pension.dto.BoardDto" %>
<%
	BoardDao bdao = new BoardDao();
	BoardDto bdto = bdao.board_update(request);
	pageContext.setAttribute("bdto", bdto);
	pageContext.setAttribute("chk", request.getParameter("chk"));
%>
    
<style>
#third {
   width:1100px;
   height:400px;	
   margin:auto;	 		
}
tr{text-align:center;}
</style>  
<c:import url="../top.jsp"/>
<div id="third"> <!-- 항상 top에 오는 부분 -->
<form method="post" action="board_update_ok.jsp" autocomplete="off">
	<table width="500" align="center">
	<input type="hidden" name="id" value="${bdto.id }">
		<caption><h3>게시판 수정</h3></caption>
		<tr>
			<td> 제목 </td>
			<td> <input type="text" name="title" value="${bdto.title }" size="38"> </td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td> <textarea cols="40" rows="5" name="content" value="${bdto.content }"></textarea> </td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td> <input type="password" name="pwd" size="10">
				<c:if test="${chk != null }">
					<span style="color:red;">비밀번호가 틀렸습니다.</span>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2"> <input type="submit" value="수정"> </td>
		</tr>
	</table>
</form>
</div>
<c:import url="../bottom.jsp"/>
