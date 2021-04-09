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
div{text-align:center;}
a{text-decoration:none;color:black;}
</style>
<c:import url="../top.jsp"/>
<div id="third">
<!-- 모든 문서의 내용 시작 부분 -->
<%
	pageContext.setAttribute("chk", request.getParameter("chk"));
%>
<c:if test="${pwd == null }">
<form method="post" action="pwd_search_ok.jsp">
	<table width="310" align="center" class="pwd_search_form">
	<caption><h3>비밀번호 찾기</h3></caption>
		<tr>
			<td> <input type="text" class="text_form" name="userid" placeholder="아이디" autocomplete="off"> </td>
		</tr>
		<tr>
			<td> <input type="text" class="text_form" name="name" placeholder="이 름" autocomplete="off"> </td>
		</tr>
		<tr>
			<td> <input type="text" class="text_form" name="phone" placeholder="전화번호" autocomplete="off"> </td>
		</tr>
		<tr>
			<td> <input type="submit" class="submit_form" value="비밀번호 찾기"> </td>
		</tr>
		<c:if test="${chk ==1 }">
		<tr>
			<td style="color:red;"> 다시 입력해주세요. </td>
		</tr>
		</c:if>
	</table>
</form>
</c:if>
<c:if test="${pwd != null }">
	<div>비밀번호는 ${pwd }입니다.</div> <p>
	<div><a href="login.jsp">로그인</a></div>
</c:if>
<%
	session.invalidate();
%>
</div>
<!-- 모든 문서의 내용 끝 부분 -->
<c:import url="../bottom.jsp"/>