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
tr{text-align:center;}
a{text-decoration:none;color:black;}
</style>
<c:import url="../top.jsp"/>
<div id="third">
<%@ page import="pension.dao.TourDao" %>
<%@ page import="pension.dto.TourDto" %>
<%
	TourDao tdao = new TourDao();
	TourDto tdto = tdao.tcontent(request);
	pageContext.setAttribute("tdto", tdto);
%>
<table width="500" align="center" style="padding-top:50px;">
	<tr>
		<td> 작성자 </td>
		<td> ${tdto.userid } </td>
	</tr>
	<tr>
		<td> 제목 </td>
		<td> ${tdto.title } </td>
	</tr>
	<tr>
		<td> 내용 </td>
		<td> ${tdto.content } </td>
	</tr>
	<tr>
		<td> 사진 </td>
		<td> <img src="img/${tdto.fname }" width="100"> </td>
	</tr>
	<tr>
		<td colspan="2"> 조회수 : ${tdto.readnum } &nbsp;&nbsp;
		작성일 : ${tdto.writeday } </td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="tlist.jsp">목록으로</a> &nbsp;&nbsp;&nbsp;
			<c:if test="${tdto.userid == userid }">
			<a href="tdelete.jsp?id=${tdto.id }">삭제하기</a>&nbsp;&nbsp;&nbsp;
			<a href="tupdate.jsp?id=${tdto.id }">수정하기</a>
			</c:if>
		</td>
		
	</tr>
</table>

</div>
<c:import url="../bottom.jsp"/>