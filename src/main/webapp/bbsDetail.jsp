<%@page import="dto.UserDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	BbsDao dao = BbsDao.getInstance();
	BbsDto dto = dao.getBbsAll(seq);
	if(dto.getDel() == 1) {
		System.out.println("삭제된 글" + dto.getDel());
%>
<script>
	alert("삭제된 글입니다.");
	location.href = "./main.jsp?content=bbslist";
</script>
<%
	}
	dao.increaseViews(dto);
%>
<div align="center" class="p-3">
	<table border="1" class="table">
		<col width="80"><col width="500">
		
		<tr align="center">
			<th class="table-secondary">아이디</th>
			<td>
				<div style="text-align:left;"><%=dto.getId() %></div>
			</td>
		</tr>
		<tr align="center">
			<th class="table-secondary">제목</th>
			<td>
				<div><%=dto.getTitle() %></div>
			</td>
		</tr>
		
		<tr align="center">
			<th class="table-secondary" >내용</th>
			<td>
				<div style="text-align:left;"><%=dto.getContent() %></div>
			</td>
		</tr>
		
		</table>
	<br />

<%

UserDto user = (UserDto)request.getSession().getAttribute("login");
if(user!=null){%>
	<div class="m-3">
		<button class="btn btn-primary" type="button" onclick="answerBbs(<%=dto.getSeq()%>)">답글</button>
		<button class="btn btn-primary" type="button" onclick="insertTocal()">내 일정에 추가</button>
	</div>
<%
}
if(user!=null&&user.getId().equals(dto.getId())){
%>
	<button class="btn btn-success" type="button" onclick="updateBbs(<%=dto.getSeq()%>)">수정</button>
	<button class="btn btn-secondary" type="button" onclick="deleteBbs(<%=dto.getSeq()%>)">삭제</button>
<%
}

%>

</div>
<script>
	function answerBbs(seq){
		location.href = "answer.jsp?seq=" + <%=seq%>;
	}
	
	function updateBbs(seq){
		location.href = "update.jsp?seq=" + <%=seq%>;
	}
	
	function deleteBbs(seq){
		location.href = "delete.jsp?seq=<%=seq%>";
	}
	
	function insertTocal(){
		location.href = "insertToCal.jsp?seq=<%=seq%>";
	}

</script>

</body>
</html>