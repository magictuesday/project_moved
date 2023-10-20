<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.ManagerDao" %>
<%@ page import="human.vo.ManagerVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
			String id = request.getParameter("memid");
			String pw = request.getParameter("mempw");
			// out.println(id+"<br>");
			// out.println(pw+"<br>");
			
			
			// DTO에 처리할 값을 저장
			ManagerVO tempvo = new ManagerVO();
			tempvo.setName(id);
			tempvo.setPwd(pw);
			
			ManagerDao comdao = new ManagerDao();
			
			//int result = memdao.loginCheck(id,pw);
			int result = comdao.loginCheck(id, pw);
			
			if(result==1) {
		session.setAttribute("memid", id); // id는 로그인시 받은 값
		out.println("<script>alert('로그인성공')</script>");
		out.println("<script>location.href='../../admin/adminHome.html'</script>");
			}else{
		out.println("<script>alert('로그인실패')</script>");
		out.println("<script>location.href='../../admin/login/adminlogin.jsp'</script>");
			}
	%>

</body>
</html>