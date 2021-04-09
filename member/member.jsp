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
	function check() // 유효성 검사 (사용자가 값을 올바르게 입력했는지)
	{
		// return true => 전송이 가능, return false => 전송 취소
		// 우선 이름(입력유무), 아이디(길이:4글자 이상), 비밀번호(길이:4글자 이상, 같은 지 확인)만 체크
		var my = document.pkc;
		if(my.name.value=="")
		{
			alert("이름을 적으세요");
			my.name.focus();
			return false;
		}
		else if(my.userid.value.length <4)
		{
			alert("아이디를 4자 이상 적어주세요");
			return false;
		}
		else if(my.pwd.value.length < 4)
		{
			alert("비밀번호를 4자 이상 적어주세요");
			return false;
		}
		else if(my.pwd.value != my.pwd2.value)
		{
			alert("비밀번호가 서로 다릅니다");
			my.pwd.value="";
			my.pwd2.value="";
			return false
		}
		else
			return true;
	}
</script>
<c:import url="../top.jsp"/>
<div id="third">
<!-- 모든 문서의 내용 시작 부분 -->
<form name="pkc" method="post" action="member_ok.jsp" onsubmit="return check()">
<table width="350" align="center" class="member_form">
	<caption><h3>회 원 가 입</h3></caption>
	<tr>
		<td> 이 름 </td>
		<td> <input type="text" name="name" autocomplete="off"> </td>
	</tr>
	<tr>
		<td> 아 이 디 </td>
		<td> <input type="text" name="userid" autocomplete="off"> </td>
	</tr>
	<tr>
		<td> 비 밀 번 호 </td>
		<td> <input type="password" name="pwd"> </td>
	</tr>
	<tr>
		<td> 비밀번호 확인 </td>
		<td> <input type="password" name="pwd2"> </td>
	</tr>
	<tr>
		<td> 전화번호 </td>
		<td> <input type="text" name="phone" autocomplete="off"> </td>
	</tr>
	<tr align="center">
		<td colspan="2"> <input type="submit" value="회원가입"> </td>
	</tr>
</table>
</form>
</div>
<!-- 모든 문서의 내용 끝 부분 -->
<c:import url="../bottom.jsp"/>