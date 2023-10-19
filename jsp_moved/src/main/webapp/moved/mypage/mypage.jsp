<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../assets/css/mypage.css">
<meta charset="UTF-8">
<title>마이페이지</title>
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
	
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/0743fc8aa3.js" crossorigin="anonymous"></script>

</head>
<body>
    <!-- Spinner Start -->
    <div id="spinner"
        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


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
                        <a href="../../moved/board.jsp" class="nav-item nav-link">신청현황</a>
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
                    <h1 class="display-4 text-white mb-4 animated slideInRight"><i class="fa-solid fa-house"></i> MYPAGE</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center justify-content-lg-start mb-0">
<!--                             <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li> -->
<!--                             <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li> -->
<!--                             <li class="breadcrumb-item text-white active" aria-current="page">Testimonial</li> -->
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


<!-- mypage start-->

<%
	String loginBtn = "로그인";
	String loginLink = "../../moved/login/login.jsp";
	String id = "";
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
		
	}
%>


<body class="woocommerce-account logged-in" style="background-color:#f4f7fe;">
	  <div class="master">
    <div class="master-inner">
      <div class="woocommerce">
        <nav class="woocommerce-MyAccount-navigation">
          <ul>
            <li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--dashboard is-active">
              <a href="mypage.jsp"><i class="fa-solid fa-user"></i> 프로필</a>
            </li>
            <li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders">
              <a href="mypagestatus.jsp"><i class="fa-solid fa-diagram-project"></i> 진행현황</a>
            </li>
            <li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders">
              <a href="mypagesetting.jsp"><i class="fa-solid fa-gear"></i> 설정</a>
            </li>
            <li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--customer-logout">
              <a href="../login/logout.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
            </li>
          </ul>
        </nav>
        <div class="woocommerce-MyAccount-content">
          <p>
            MYPAGE <strong> 프로필 </strong>
          </p>
          <p>
            기본정보
          </p>

          	<style>
	          	.front-container {
				    background: #fff;
/* 				    box-shadow: 0 5px 15px 2px rgba(0, 0, 0, 0.3); */
				    width: 100%;
				    position: relative;
				    margin: auto;
				}
 				.front-container img { 
 				    border-radius: 50%; 
				    width: 70px; 
 				    position: absolute; 
 				    top: -35px; 
 				    left: 40px; 
 				} 
 				.front-container .form-group {
				    padding: 65px 40px 45px;
				    max-width: 100%;
				    display: grid;
				    grid-template-areas:
				        "username username"
				        "first-name last-name"
				        "email email"
				        "bio bio";
				}
 				.username {
				    grid-area: username;
				}
          	</style>
          <div>
          	<div class="front-container">
          		<img src="../../assets/img/hero-img.jpg" alt="" />
	          		<form class="form-group">
		          		<div class="username">
							<label for="username"><h2><strong><%= resultvo.getName() %></strong></h2><i class="fa-regular fa-envelope"></i><strong>  <%= id %></strong></label><br><hr>	
							
						</div>
							
						
							<label for="username"><strong><i class="fa-solid fa-user"></i> 이름</strong></label>
							<label for="username"><strong><%= resultvo.getName() %></strong></label>							
							<label for="username"><strong><i class="fa-solid fa-envelope"></i> 이메일</strong></label>
							<label for="username"><strong> <%= resultvo.getEmail() %></strong></label>
							<label for="username"><strong><i class="fa-solid fa-phone"></i> 전화번호</strong></label>
							<label for="username"><strong> <%= resultvo.getPhone() %></strong></label>
							<hr><hr>
					<h2>M<span style="color:skyblue;">O</span>VED</h2>
					
					</form>				
          	</div>
          	
            
            </div>
        </div><!-- woocommerce-MyAccount-content -->
      </div><!-- woocommerce -->
    </div><!-- master-inner -->
  </div><!-- master -->
</body>
<!-- mypage end-->


 <!-- Newsletter Start -->
    <div class="container-fluid bg-primary newsletter py-5">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-md-5 ps-lg-0 pt-5 pt-md-0 text-start wow fadeIn" data-wow-delay="0.3s">
                    <img class="img-fluid" src="../../assets/img/newsletter.png" alt="">
                </div>
                <div class="col-md-7 py-5 newsletter-text wow fadeIn" data-wow-delay="0.5s">
                    <div class="btn btn-sm border rounded-pill text-white px-3 mb-3">Newsletter</div>
                    <h1 class="text-white mb-4">Let's subscribe the newsletter</h1>
                    <div class="position-relative w-100 mt-3 mb-2">
                        <input class="form-control border-0 rounded-pill w-100 ps-4 pe-5" type="text"
                            placeholder="Enter Your Email" style="height: 48px;">
                        <button type="button" class="btn shadow-none position-absolute top-0 end-0 mt-1 me-2"><i
                                class="fa fa-paper-plane text-primary fs-4"></i></button>
                    </div>
                    <small class="text-white-50">Diam sed sed dolor stet amet eirmod</small>
                </div>
            </div>
        </div>
    </div>
    <!-- Newsletter End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white-50 footer pt-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.1s">
                    <a href="index.html" class="d-inline-block mb-3">
                        <h1 class="text-white">AI<span class="text-primary">.</span>Tech</h1>
                    </a>
                    <p class="mb-0">Tempor erat elitr rebum at clita. Diam dolor diam ipsum et tempor sit. Aliqu diam
                        amet diam et eos labore. Clita erat ipsum et lorem et sit, sed stet no labore lorem sit. Sanctus
                        clita duo justo et tempor</p>
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.3s">
                    <h5 class="text-white mb-4">Get In Touch</h5>
                    <p><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                    <p><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                    <p><i class="fa fa-envelope me-3"></i>info@example.com</p>
                    <div class="d-flex pt-2">
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-instagram"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.5s">
                    <h5 class="text-white mb-4">Popular Link</h5>
                    <a class="btn btn-link" href="">About Us</a>
                    <a class="btn btn-link" href="">Contact Us</a>
                    <a class="btn btn-link" href="">Privacy Policy</a>
                    <a class="btn btn-link" href="">Terms & Condition</a>
                    <a class="btn btn-link" href="">Career</a>
                </div>
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.7s">
                    <h5 class="text-white mb-4">Our Services</h5>
                    <a class="btn btn-link" href="">Robotic Automation</a>
                    <a class="btn btn-link" href="">Machine learning</a>
                    <a class="btn btn-link" href="">Predictive Analysis</a>
                    <a class="btn btn-link" href="">Data Science</a>
                    <a class="btn btn-link" href="">Robot Technology</a>
                </div>
            </div>
        </div>
        <div class="container wow fadeIn" data-wow-delay="0.1s">
            <div class="copyright">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved.

                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <div class="footer-menu">
                            <a href="">Home</a>
                            <a href="">Cookies</a>
                            <a href="">Help</a>
                            <a href="">FAQs</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top pt-2"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../../assets/js/main.js"></script>
</body>
</html>