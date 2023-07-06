<%@page import="util.UserUtil"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
LocalDate currentDate = LocalDate.now();
int year = currentDate.getYear();
int month = currentDate.getMonthValue();


%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center" class="p-3 homeContainer">
	<h1 class="mt" style="color:white; font-weight:bold;">We show recuit infomation</h1>
	<div style="margin-top:5em">
		<button type="button" onclick=(location.href="./main.jsp?content=bbslist")>채용 정보 게시판</button>
		<button type="button" onclick=(location.href="./main.jsp?content=calendarList&year=<%=year %>&month=<%=month %>")>나의 일정 관리</button>
	</div>

</div>
</body>
<style>
	.homeContainer{
		background-image: url("./images/homeBack.png");
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
		margin-top:30px;
		display: flex;
				height:300px;
		
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	
	.homeContainer button{
		border-radius:0.3rem;
		border:1px solid black;
		margin:0.2rem;
		background-color:#3a0ca3;
		color:white;
		padding:0.3rem;
		transition: background-color 0.3s ease;
	}
	
	.homeContainer button:hover{
		background-color:#4361ee;
	}
</style>
</html>
