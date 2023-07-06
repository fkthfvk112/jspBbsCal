<%@page import="dto.UserDto"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("UTF-8");
	String inputId = request.getParameter("id");
	String inputPwd = request.getParameter("pwd");
	UserDao dao = UserDao.getInstance();
	UserDto dto = dao.login(inputId, inputPwd);
	if(dto == null){
		pageContext.forward("./main.jsp?content=login");
		System.out.println("login fail");
	}
	else{
		System.out.println("login success");
		session.setAttribute("login", dto);
		String preUrl = (String)session.getAttribute("preUrl");
		System.out.println(preUrl);
		if(preUrl == null){
			response.sendRedirect("./main.jsp?bbslist");
		}
		else{
			System.out.println("previous url : " + preUrl);
			%>
			<script>
			location.href = "<%=preUrl%>";
			</script>
			<%
		}
	}
	
%>