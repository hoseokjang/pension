<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pension.dao.BoardDao" %>
<%
	BoardDao bdao = new BoardDao();
	int chk = bdao.board_update_ok(request, response, session);
%>