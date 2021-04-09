<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../top.jsp"/>

<!-- 모든 문서의 내용 시작 부분 -->
<!-- 유효성 검사 해보기 -->
<div>
<form name="login" method="post" action="login_ok.jsp" class="login_table">
	<table width="310" align="center">
		<caption> <h3> 로 그 인 </h3></caption>
		<tr>
			<td> <input type="text" class="text_form" name="userid" placeholder="아이디" autocomplete="off"> </td>
		</tr>
		<tr>
			<td> <input type="password" class="pwd_form" name="pwd" placeholder="비밀번호"> </td>
		</tr>
		<tr>
			<td> <input type="submit" class="submit_form" value="로그인"> </td>
		</tr>
		<tr>
			<td>
				<a href="userid_search.jsp">아이디 찾기</a> &nbsp;
				<a href="pwd_search.jsp">비밀번호 찾기</a> &nbsp;
				<a href="member.jsp">회원가입</a>
			</td>
		</tr>
	</table>
</form>
</div>

<!-- 모든 문서의 내용 끝 부분 -->

<c:import url="../bottom.jsp"/>