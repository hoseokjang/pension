<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pension.dao.BoardDao" %>
<%
	BoardDao bdao = new BoardDao();
	bdao.board_readnum(request, response);
%>
