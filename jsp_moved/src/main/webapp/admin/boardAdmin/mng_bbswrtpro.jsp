<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String filename = request.getParameter("filename");
		
		MultipartRequest multi = null;
		String savePath="C:/Users/User/Documents/workspace-spring-tool-suite-4-4.19.1.RELEASE/jspwebproject4/src/main/webapp/upload/";
		int maxsize = 1024*1024*10;
		
		try{
			multi = new MultipartRequest(request, savePath, maxsize, "utf-8", new DefaultFileRenamePolicy());
			writer = multi.getParameter("writer");
			subject = multi.getParameter("subject");
			content = multi.getParameter("content");
			filename = multi.getFilesystemName("filename");
					
			out.println(writer+"<br>");
	 		out.println(subject+"<br>");
	 		out.println(content+"<br>");
	 		out.println(filename+"<br>"); 
		}catch(Exception e){
			out.println("에러: " + e.getMessage());
			
			
		}
		
		BoardVo tempvo = new BoardVo();
		tempvo.setWriter(writer);
		tempvo.setSubject(subject);
		tempvo.setContent(content);
		tempvo.setFilename(filename);
		
		BoardDao bbsdao = new BoardDao();
		int result = bbsdao.regBoard(tempvo);
		
		out.println("등록결과 : " + result);
		
		if(result==2){
			out.println("<script>alert('게시글 등록 및 첨부 등록 완료');</script>");
			out.println("<script>location.href='mng_bbswrite.html';</script>");
		}else if(result==1){
			out.println("<script>alert('게시글 등록 완료');</script>");
			out.println("<script>location.href='mng_bbswrite.html';</script>");			
		}
	%>
</body>
</html>