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
</style>
<script>
	function chg_view()
	{
		document.getElementById("upd_img").style.display="table-row";
	}
</script>
<c:import url="../top.jsp"/>
<div id="third">
<%@ page import="pension.dao.TourDao" %>
<%@ page import="pension.dto.TourDto" %>
<%
	TourDao tdao = new TourDao();
	TourDto tdto = tdao.tupdate(request);
	pageContext.setAttribute("tdto", tdto);
%>
<form method="post" action="tupdate_ok.jsp" enctype="multipart/form-data" autocomplete="off">
<input type="hidden" name="id" value="${tdto.id }">
<table width="400" align="center">
	<caption><h3>수 정</h3></caption>
	<tr>
		<td> 제목 </td>
		<td> <input type="text" name="title" value="${tdto.title }"> </td>
	</tr>
	<tr>
		<td> 내용 </td>
		<td> <textarea rows="6" cols="40" name="content">${tdto.title }</textarea> </td>
	</tr>
	<tr>
		<td> 첨부 파일 </td>
		<td> <img src="img/${tdto.fname }" width="80">
			 <span onclick="chg_view()"> 그림바꾸기 </span>
		</td>
	</tr>
	<tr style="display:none;" id="upd_img">
		<td> 수정 첨부 </td>
		<td> <input type="file" name="fname"> </td>
	</tr>
	<tr align="center">
		<td colspan="2"> <button type="submit"> 수정 </button> </td>
	</tr>
</table>
</form>

</div>
<c:import url="../bottom.jsp"/>