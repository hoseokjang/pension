<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../main.css">
<title>Insert title here</title>
<script>
	function menu_over()
	{
		document.getElementById("index_sub").style.visibility = "visible";
	}
	function menu_out()
	{
		document.getElementById("index_sub").style.visibility = "hidden";
	}
</script>
</head>
<body>  <!-- main/index.jsp -->
  <div id="first"> 오픈 기념 50% 할인이벤트를 진행중입니다. 많은 참여 부탁합니다. X</div> <!-- 간단한 광고 -->
  <div id="second">
   <ul id="index_menu">
     <li> Menu </li>
     <li> 펜션소개 </li>
     <li> 주변관광지 </li>
     <li> 예약관련 </li>
     <li onmouseover="menu_over()" onmouseout="menu_out()" id="community"> 커뮤니티
     	<ul id="index_sub"> <!-- css파일에서 second의 li태그를 처리했기 했기 때문에 같이 적용 -->
     		<li onclick="location='../gong/glist.jsp'">공지사항</li>
     		<li onclick="location='../board/board_list.jsp'">게시판</li>
     		<li>여행후기</li>
     	</ul>
      </li>
     <li> 
     <c:if test="${userid == null }">
     	<a href="../member/login.jsp">로그인</a> 
     </c:if>
     <c:if test="${userid != null }">
     	${name }님  <a href="../member/logout.jsp">로그아웃</a>
     </c:if>
     </li>
   </ul>
  </div> <!-- 로고, 각 메뉴  -->