<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- fmt는 format의 약자 -->
<style>
#third{
	width:1100px;
	height:800px;
/*	background:red;	*/
	margin:auto;
}
tr{text-align:center;}
</style>

<c:import url="../top.jsp"/>
<div id="third">
<%@ page import="pension.dao.ReserveDao" %>
<%@ page import="pension.dto.RoomDto" %>
<%
	ReserveDao rdao = new ReserveDao();
	RoomDto rdto = rdao.reserve_next(request);
	pageContext.setAttribute("rdto",rdto);
	String nalja = request.getParameter("y")+"년 ";
	nalja = nalja + request.getParameter("m")+"월 ";
	nalja = nalja + request.getParameter("day")+"일";
	pageContext.setAttribute("nalja", nalja);
%>
<div align="center"><h3>방 예약하기</h3></div>
<form name="reser" method="post" action="reserve_ok.jsp">
<table width="600" align="center">
	<caption><h4>${rdto.name }방 정보</h4></caption>
	<tr>
		<td> 사진 </td>
		<td> 방 이름</td>
		<td> 기준 인원 </td>
		<td> 최대 인원 </td>
		<td> 가격(1박 당) </td>
	</tr>
	<tr>
		<td> <img src="img/room.png"> </td>
		<td> ${rdto.name } </td>
		<td> ${rdto.min } </td>
		<td> ${rdto.max } </td>
		<td> <fmt:formatNumber value="${rdto.price }"/>원</td>
	</tr>
</table>
<!-- 몇 박, 인원, 추가 옵션, 총 금액 -->
<table width="600" align="center">
	<caption><h4> 숙박 일자 </h4></caption>
	<tr>
		<td> 입실일</td>
		<td> 숙박 일수</td>
		<td> 금액 </td>
	</tr>
	<tr>
		<td> ${nalja } </td>
		<td>
			<select name="suk" onchange="price_change(this.value,${rdto.price })">
				<c:forEach var="i" begin="1" end="8">
				<option value="${i }"> ${i }박 </option>
				</c:forEach>
			</select>
		</td>
		<td id="price"> <fmt:formatNumber value="${rdto.price }"/>원 </td>
	</tr>
</table>

<table widhth="600" align="center">
<caption><h4>숙박 인원</h4></caption>
	<tr>
		<td> 성인 </td>
		<td> 청소년 </td>
		<td> 초등이하(무료) </td>
		<td> 총 인원 </td>
		<td> 추가 금액</td>
	</tr>
	<tr>
		<td>
			<select name="inwon1" onchange="inwon_check()">
				<c:forEach var="i" begin="1" end="${rdto.max }">
					<option value="${i }"> ${i }명 </option>
				</c:forEach>
			</select>
		</td>
		<td>
			<select name="inwon2" onchange="inwon_check()">
				<c:forEach var="i" begin="0" end="${rdto.max-1 }">
					<option value="${i }"> ${i }명 </option>
				</c:forEach>
			</select>
		</td>
		<td>
			<select name="inwon3" onchange="inwon_check()">
				<c:forEach var="i" begin="0" end="${rdto.max-1 }">
					<option value="${i }"> ${i }명 </option>
				</c:forEach>
			</select>
		</td>
		<td id="inwon"> 1명 </td>
		<td id="inwon_price"> 0원 </td>
	</tr>
</table>

</form>

<script>
	function price_change(s,p)
	{
		var result = s * p;
		result = new Intl.NumberFormat().format(result);
		document.getElementById("price").innerText=result+"원";
	}
	function inwon_check()
	{	// 성인, 청소년, 초등이하의 select의 value를 가져와서 더하면 => 총인원
		var inwon1 = parseInt(document.reser.inwon1.value);
		var inwon2 = eval(document.reser.inwon2.value);
		var inwon3 = Number(document.reser.inwon3.value);
		var chong = inwon1 + inwon2 + inwon3;
		
		if(chong <= ${rdto.max})// 최대 인원을 초과하지 않는다면
		{
			var chuga = chong-${rdto.min};
			if(chuga >= 1) // 기준 인원보다 많을 때 추가 금액 계산
			{
				var result = chuga * 5000;
				result = new Intl.NumberFormat().format(result);
				document.getElementById("inwon_price").innerText=result+"원";
			}
			else
				document.getElementById("inwon_price").innerText="0원";
			document.getElementById("inwon").innerText = chong+"명";
		}
		else
		{	// 초과했을때 2가지 방법 => 1. 되돌리기, 2.초기화 >>> 초기화 방법 선택
			alert("인원이 초과되었습니다.");
			document.reser.inwon1.selectedIndex=0; // 0은 첫 번째 옵션
			document.reser.inwon2.selectedIndex=0;
			document.reser.inwon3.selectedIndex=0;
			document.getElementById("inwon_price").innerText="0원";
			document.getElementById("inwon").innerText = "1명";
		}
	}
</script>

</div>
<c:import url="../bottom.jsp"/>