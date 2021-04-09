<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pension.dao.MemberDao" %>
<%
	MemberDao mdao = new MemberDao();
	mdao.userid_search_ok(request,response,session);
%>