<%@page import="util.UserUtil"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
LocalDate currentDate = LocalDate.now();
int year = currentDate.getYear();
int month = currentDate.getMonthValue();

boolean isLogIn = UserUtil.isLogIn(request);

%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="./main.jsp?content=home"">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./main.jsp?content=bbslist">게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link"  href="./main.jsp?content=calendarList&year=<%=year %>&month=<%=month %>">내 일정</a>
        </li>
        <li class="nav-item">
        <% if(isLogIn){%>
         	<a class="nav-link" href="./logOut.jsp">로그아웃</a>
        <%}else{ %>
        	<a class="nav-link" href="./main.jsp?content=login">로그인</a>
        <%} %>
        </li>
      </ul>
      
    </div>
  </div>
</nav>