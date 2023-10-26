<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>
<%@ page import="human.dao.FilesDao" %>
<%@ page import="human.vo.FilesVo" %>       
    
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/jquery-3.7.0.min.js"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../../assets/css/admin.css">
    <title>admin Document</title>
</head>

<body>
    <div class="dash">
        <div class="dash-nav dash-nav-dark">
            <header>
                <a href="#!" class="menu-toggle">
                    <i class="fas fa-bars"></i>
                </a>
                <a href="index.html" class="spur-logo"><i class="fas fa-bolt"></i> <span>관리자</span></a>
            </header>
            <nav class="dash-nav-list">
                <a href="../adminHome.html" class="dash-nav-item">
                    <i class="fas fa-home"></i> ADMIN HOME </a>
                                    
                <div class="dash-nav-dropdown ">
                    <a href="../boardAdmin/mng_board.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-cube"></i> 게시판관리 </a>
                    <div class="dash-nav-dropdown-menu">                                            
                        <a href="board.html" class="dash-nav-dropdown-item">공지사항</a>
                    </div>
                </div>
                <div class="dash-nav-dropdown">
                    <a href="../memberAdmin/mng_member.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-file"></i> 회원관리 </a>
                    <div class="dash-nav-dropdown-menu">
                        <a href="blank.html" class="dash-nav-dropdown-item">회원목록</a>                        
                    </div>
                </div>
                <div class="dash-nav-dropdown">
                    <a href="../costAdmin/mng_cost.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-file"></i> 가격관리 </a>
                    <div class="dash-nav-dropdown-menu">
                        <a href="blank.html" class="dash-nav-dropdown-item">가격관리</a>                        
                    </div>
                </div>
                 <div class="dash-nav-dropdown">
                    <a href="../companyAdmin/mng_company.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-file"></i> 업체관리 </a>
                    <div class="dash-nav-dropdown-menu">
                        <a href="blank.html" class="dash-nav-dropdown-item">업체관리</a>                        
                    </div>
                </div>
                <div class="dash-nav-dropdown">
                    <a href="../appStatusAdmin/mng_app_status.jsp" class="dash-nav-item dash-nav-dropdown-toggle">
                        <i class="fas fa-file"></i> 진행현황 </a>
                    <div class="dash-nav-dropdown-menu">
                        <a href="blank.html" class="dash-nav-dropdown-item">진행현황</a>                        
                    </div>
                </div>
            </nav>
        </div>
        <div class="dash-app">
            <header class="dash-toolbar">
                <a href="#!" class="menu-toggle">
                    <i class="fas fa-bars"></i>
                </a>
                <a href="#!" class="searchbox-toggle">
                    <i class="fas fa-search"></i>
                </a>
                <form class="searchbox" action="#!">
                    <a href="#!" class="searchbox-toggle"> <i class="fas fa-arrow-left"></i> </a>
                    <button type="submit" class="searchbox-submit"> <i class="fas fa-search"></i> </button>
                    <input type="text" class="searchbox-input" placeholder="type to search">
                </form>
                <div class="tools">
                    <a href="#" target="_blank" class="tools-item">
                        <i class="fab fa-github"></i>
                    </a>
                    <a href="#!" class="tools-item">
                        <i class="fas fa-bell"></i>
                        <i class="tools-item-count">4</i>
                    </a>
                    <div class="dropdown tools-item">
                        <a href="#" class="" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
                            <a class="dropdown-item" href="#">관리자정보</a>
                            <a class="dropdown-item" href="../../boardAdmin/mng_login.html">로그아웃</a>
                        </div>
                    </div>
                </div>
            </header>
            
            <%
            String no = request.getParameter("no");
         
            BoardVo tempvo = new BoardVo();
            BoardDao bbsdao = new BoardDao();      
            tempvo = bbsdao.readBoardByNo(no);
            
            FilesVo filesvo = new FilesVo();
            FilesDao filedao = new FilesDao();
            filesvo = filedao.readFilesByNo(no);
            
         %>
            <main class="dash-content">
                <div class="container-fluid">
                    <h1 class="dash-title">공지사항</h1>
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card spur-card">
                                <div class="card-header">
                                    <div class="spur-card-icon">
                                        <i class="fas fa-chart-bar"></i>
                                    </div>
                                    <div class="spur-card-title"> 글읽기 </div>
                                </div>
                                <div class="card-body ">
                                    <form action="mng_bbswrtpro.jsp" method="POST" enctype="multipart/form-data">
                                       
                                        <div class="form-row">                                       
                                           <div class="form-group col-md-4">
                                               <label for="exampleFormControlInput1">작성자</label>
                                               <input type="text" class="form-control" id="exampleFormControlInput1" name="writer" value="<%= tempvo.getWriter() %>" readonly="readonly">
                                           </div>
                                           <div class="form-group col-md-4">
                                               <label for="exampleFormControlInput1">작성일</label>
                                               <input type="text" class="form-control" id="exampleFormControlInput1" name="regdate" value="<%= tempvo.getRegdate() %>" readonly="readonly">
                                           </div>
                                           <div class="form-group col-md-4">
                                               <label for="exampleFormControlInput1">조회수</label>
                                               <input type="text" class="form-control" id="exampleFormControlInput1" name="hit" value="<%= tempvo.getHit() %>" readonly="readonly">
                                           </div>
                                       </div>                                             
                                        
                                        <div class="form-row"> 
                                           <div class="form-group col-md-6">
                                               <label for="exampleFormControlInput1">이메일</label>
                                               <input type="text" class="form-control" id="exampleFormControlInput1" name="email" value="<%= tempvo.getEmail() %>">
                                           </div>
                                           <div class="form-group col-md-6">
                                               <label for="exampleFormControlInput1">전화번호</label>
                                               <input type="text" class="form-control" id="exampleFormControlInput1" name="phone" value="<%= tempvo.getHp() %>">
                                           </div>
                                       </div>    
                                           
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">제목</label>
                                            <input type="text" class="form-control" id="exampleFormControlInput1" name="subject" value="<%= tempvo.getSubject() %>">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="exampleFormControlTextarea1">글내용</label>
                                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content"><%= tempvo.getContent() %></textarea>                                           
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="exampleFormControlTextarea1">첨부파일</label>
                                            <br><%= filesvo.getFilename() %> &nbsp; &nbsp; 
<!--                                             <button type="button" class="btn btn-primary">파일삭제</button> -->
                                            <input type="file" class="form-control" id="exampleFormControlInput1" name="filename">
                                        </div>
                                        
                                        <button type="submit" class="btn btn-primary">글수정</button>
                                        <button type="button" class="btn btn-primary" onclick="del_bbs(<%= tempvo.getNo() %>);">글삭제</button>
                                        <button type="button" class="btn btn-primary" onclick="location.href='../../boardAdmin/mng_board.jsp'">목록</button>
                                    </form>
                                </div>
                            </div>
                        </div> <!--  put your rows / columns here -->
                    </div>
                </div>
            </main>
        </div>
    </div>
    <script src="../../assets/js/admin.js"></script>
    <script>
    	function del_bbs(tempno){
    		ok = confirm("해당글을 삭제하시겠습니까?"); //확인 - true, 취소- false
    		if(ok==true){
    			alert(tempno);
//     			location.href = '../../boardAdmin/mng_bbsdel.jsp?no='+tempno;
    		}else{
    			alert('삭제 취소 되었습니다.');
    		}
    	}
    </script>
</body>

</html>