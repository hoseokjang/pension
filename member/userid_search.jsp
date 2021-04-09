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
<c:import url="../top.jsp"/>
<div id="third">
<!-- 모든 문서의 내용 시작 부분 -->
<style>
	tr{text-align:center;}
	a{text-decoration:none;color:black;}
</style>
<c:if test="${imsi == null }">
	<%
		pageContext.setAttribute("chk", request.getParameter("chk"));
	%>
<form method="post" action="userid_search_ok.jsp">
	<table width="310" align="center" class="userid_form">
	<caption><h3>아이디 찾기</h3></caption>
		<tr>
			<td> <input type="text" class="text_form" name="name" placeholder="이 름" autocomplete="off"> </td>
		</tr>
		<tr>
			<td> <input type="text" class="text_form" name="phone" placeholder="전화번호" autocomplete="off"> </td>
		</tr>
		<tr>
			<td> <input type="submit" class="submit_form" value="아이디 찾기"> </td>
		</tr>
		<c:if test="${chk == 1 }">
			<tr>
				<td style="color:red;"> 이름 또는 전화번호가 틀렸습니다. </td>
			</tr>
		</c:if>
	</table>
</form>
</c:if>
<c:if test="${userid != null }">
	<p align="center"> 당신의 아이디는 ${userid } 입니다. </p>
	<div align="center">
	<a href="login.jsp">로그인</a>&nbsp;&nbsp;&nbsp;
	<a href="pwd_search.jsp">비밀번호 찾기</a>	
	</div>
</c:if>
<%
	session.invalidate();
%>
</div>
<!-- 모든 문서의 내용 끝 부분 -->
<c:import url="../bottom.jsp"/>