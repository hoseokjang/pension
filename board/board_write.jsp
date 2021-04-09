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
tr{align:center;}
</style>
<c:import url="../top.jsp"/>
<div id="third">

<form method="post" action="board_write_ok.jsp" autocomplete="off">
	<table width="500" align="center">
		<caption><h3>게시판 작성</h3></caption>
		<tr>
			<td> 제목 </td>
			<td> <input type="text" name="title"> </td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td> <textarea cols="40" rows="5" name="content"></textarea> </td>
		</tr>
		<tr>
			<td colspan="2"> <input type="submit" value="작성"> </td>
		</tr>
	</table>
</form>

</div>
<c:import url="../bottom.jsp"/>