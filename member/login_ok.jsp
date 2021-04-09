<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pension.dao.MemberDao" %>
<%
	MemberDao mdao = new MemberDao();
	int chk = mdao.login_ok(request,session);
	
	if(chk == 0)
	{
		response.sendRedirect("../main/index.jsp");
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
%>