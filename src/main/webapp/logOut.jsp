<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
HttpSession sess = request.getSession();
sess.invalidate();

response.sendRedirect("./main.jsp?content=home");

%>