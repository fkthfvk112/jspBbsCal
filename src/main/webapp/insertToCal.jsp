<%@ page import="java.time.LocalDate" %>
<%@page import="util.CalendarUtil"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.CalendarDto"%>
<%@page import="dao.CalendarDao"%>
<%@page import="dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

UserDto login = (UserDto)session.getAttribute("login");
String seq_s = request.getParameter("seq");
int seq = Integer.parseInt(seq_s);

BbsDao bbsDao = BbsDao.getInstance();
BbsDto bbsDto = bbsDao.getBbs(seq);

String title = bbsDto.getTitle();
String content = bbsDto.getContent();
System.out.println(title);


LocalDate now = LocalDate.now();
String year = now.getYear()+"";


String monthPre = now.getMonthValue()+"";
String month = CalendarUtil.two(monthPre);
 
String dayPre = now.getDayOfMonth() +"";
String day = CalendarUtil.two(dayPre);


String rdate = year + month + day + "0000";
System.out.println(rdate);

CalendarDao dao = CalendarDao.getInstance();
boolean isS = dao.addCalendar(new CalendarDto(login.getId(), title, content, rdate));
if(isS){
	%>
	<script>
	alert('일정이 추가되었습니다.');
	location.href = "./main.jsp?content=calendarList&year=<%=year%>&month=<%=month%>";
	</script>
	<%
}else{
	%>
	<script>
	alert('오류 : 일정이 추가되지 않았습니다.');
	location.href = "calendarList.jsp?year=<%=year%>&month=<%=month%>";
	</script>
	<%
}
%>