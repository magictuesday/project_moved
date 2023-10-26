<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOVED 견적방법</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../../assets/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Ubuntu:wght@500;700&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../../assets/css/style.css" rel="stylesheet">
</head>
<body>

    <!-- Navbar Start -->
    <div class="container-fluid sticky-top">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark p-0">
                <a href="../../include/index.jsp" class="navbar-brand">
                    <h1 class="text-white">M<span style="color:skyblue;">O</span><span class="text-white">VED</span></h1>
                </a>
                <button type="button" class="navbar-toggler ms-auto me-0" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                     <div class="navbar-nav ms-auto">
                        <a href="../../include/index.jsp" class="nav-item nav-link active">Home</a>
                        <a href="../../moved/movedint.jsp" class="nav-item nav-link">Moved 소개</a>
                        <a href="../../include/calendar/cal.jsp" class="nav-item nav-link">Moved 이사견적</a>
                        <a href="../../moved/statusBoard.jsp" class="nav-item nav-link">신청현황</a>
                        <a href="../../moved/board.jsp" class="nav-item nav-link">고객센터</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu bg-light mt-2">
                                <a href="../../html/feature.html" class="dropdown-item">Features</a>
                                <a href="../../html/team.html" class="dropdown-item">Our Team</a>
                                <a href="../../html/faq.html" class="dropdown-item">FAQs</a>
                                <a href="../../html/testimonial.html" class="dropdown-item">Testimonial</a>
                                <a href="../../html/404.html" class="dropdown-item">404 Page</a>
                            </div>
                        </div>
                        <a href="../../html/contact.html" class="nav-item nav-link">Contact</a>
                    </div>
                    <butaton type="button" class="btn text-white p-0 d-none d-lg-block" data-bs-toggle="modal"
                        data-bs-target="#searchModal"><i class="fa fa-search"></i></butaton>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->

<!-- Hero Start -->
    <div class="container-fluid pt-5 bg-primary hero-header">
        <div class="container pt-5">
            <div class="row g-5 pt-5">
                <div class="col-lg-6 align-self-center text-center text-lg-start mb-lg-5">
                    <h1 class="display-4 text-white mb-4 animated slideInRight">M<span style="color:skyblue;">O</span>VED 이사견적</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center justify-content-lg-start mb-0">
                            <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                            <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Our Projects</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-lg-6 align-self-end text-center text-lg-end">
<!--                     <img class="img-fluid" src="../../assets/img/hero-img.png" alt="" style="max-height: 300px;"> -->
                </div>
            </div>
        </div>
    </div>
    <!-- Hero End -->


    <!-- Full Screen Search Start -->
    <div class="modal fade" id="searchModal" tabindex="-1">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content" style="background: rgba(20, 24, 62, 0.7);">
                <div class="modal-header border-0">
                    <button type="button" class="btn btn-square bg-white btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex align-items-center justify-content-center">
                    <div class="input-group" style="max-width: 600px;">
                        <input type="text" class="form-control bg-transparent border-light p-3"
                            placeholder="Type search keyword">
                        <button class="btn btn-light px-4"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Full Screen Search End -->


<!-- Case Start -->
<%
	String loginBtn = "로그인";
	String loginLink = "../../moved/login/login.jsp";
	String id = "";
	String name ="";
	MemberVo resultvo = new MemberVo();
	// 세션정보를 확인해서 페이지를 보여줄지 여부를 판단
	if(session.getAttribute("memid")==null){
	   loginBtn = "로그인";
	   loginLink = "../../moved/login/login.jsp";
	   out.println("<script>alert('로그인 후 사용가능합니다');</script>");
	   out.println("<script>location.href='../../moved/login/login.jsp'</script>");
	}else{
   id = (String)session.getAttribute("memid");
   loginBtn = "로그아웃";
   loginLink = "../../moved/login/logout.jsp";
   
   // 세션이 생성 확인 후 
   // 지역변수 자리
   MemberDao memdao = new MemberDao();
   resultvo = memdao.getMemberById(id);
   
   //이름 가져오기
   name = resultvo.getName();     
	}
	String most1 = request.getParameter("most1");
	
	// 오라클 데이터베이스 연결 설정
	String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
	String user = "jsp";
	String password = "123456";

	try {
	    Class.forName("oracle.jdbc.driver.OracleDriver");

	    Connection conn = DriverManager.getConnection(url, user, password);
	    
	    PreparedStatement pstmt = conn.prepareStatement("DELETE FROM CLIENT WHERE NAME = (?)");
	    pstmt.setString(1, name);
	    PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO CLIENT (NAME, ID) VALUES (?, ?)");
	    pstmt2.setString(1, name);
	    pstmt2.setString(2, id);
		PreparedStatement pstmt3 = conn.prepareStatement("UPDATE CLIENT SET M_DATE = (?) WHERE ID = (?)");
	    pstmt3.setString(1, most1);
	    pstmt3.setString(2, id);
	    int rowsAffected = pstmt.executeUpdate();
	    rowsAffected = pstmt2.executeUpdate();
	    rowsAffected = pstmt3.executeUpdate();
	    
	} catch (Exception e) {
	    out.println("오류 발생: " + e.getMessage());
	}
%>
    <div class="container-fluid bg-light py-5">
        <div class="container py-5">
            <div class="mx-auto text-center wow fadeIn" data-wow-delay="0.1s" style="max-width: 500px;">
                <div class="btn btn-sm border rounded-pill text-primary px-3 mb-3">Selection</div>
                <h1 class="mb-4">견적 방법을 선택하세요.</h1>
                <p> 신 청 자  : "<%=name%>"님</p>
                <p> 이사희망일 : <%=most1 %></p>
            </div>
            <div class="row g-4" style="justify-content: space-around;">
                <div class="col-lg-4 wow fadeIn" data-wow-delay="0.3s">
                    <div class="case-item position-relative overflow-hidden rounded mb-2">
                        <img class="img-fluid" src="../../assets/img/1.png" alt="">
                        <a class="case-overlay text-decoration-none" href="../../include/select/direct/man.jsp">
                            <small>직접 선택</small>
                            <h5 class="lh-base text-white mb-3">직접 선택으로 가구를 분류하세요 예상견적을 측정해드립니다.
                            </h5>
                            <span class="btn btn-square btn-primary"><i class="fa fa-arrow-right"></i></span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 wow fadeIn" data-wow-delay="0.5s">
                    <div class="case-item position-relative overflow-hidden rounded mb-2">
                        <img class="img-fluid" src="../../assets/img/2.png" alt="">
                        <a class="case-overlay text-decoration-none" href="../../include/select/aiSelect/sol.jsp">
                            <small>Machine learning</small>
                            <h5 class="lh-base text-white mb-3">AI 가 자동으로 가구를 인식하여 견적을 측정해드립니다.
                            </h5>
                            <span class="btn btn-square btn-primary"><i class="fa fa-arrow-right"></i></span>
                        </a>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <!-- Case End -->

</body>
</html>