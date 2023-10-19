<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="human.dao.BoardDao" %>
<%@ page import="human.vo.BoardVo" %>
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>
<%@ page import="human.dao.ClientDao" %>
<%@ page import="human.vo.ClientVo" %>
<%@ page import="human.dao.FilesDao" %>
<%@ page import="human.vo.FilesVo" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>신청현황</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../assets/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Ubuntu:wght@500;700&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../assets/css/style.css" rel="stylesheet">
    
    <!-- fontawesome -->
	<script src="https://kit.fontawesome.com/0743fc8aa3.js" crossorigin="anonymous"></script>
</head>

<body>
<style>
section{
    background:#f3f3f3;
    
    color: #616f80;
}
.card {
    border: none;
    margin-bottom: 24px;
    -webkit-box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
    box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
}

.avatar-xs {
    height: 2.3rem;
    width: 2.3rem;
}
</style>

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
<!--     <div class="container-fluid sticky-top">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark p-0">
                <a href="index.html" class="navbar-brand">
                    <h1 class="text-white">M<span style="color:skyblue;">O</span><span class="text-white">VED</span></h1>
                </a>
                <button type="button" class="navbar-toggler ms-auto me-0" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto">
                        <a href="index.html" class="nav-item nav-link active">Home</a>
                        <a href="movedint.html" class="nav-item nav-link">Moved 소개</a>
                        <a href="select.html" class="nav-item nav-link">Moved 이사견적</a>
                        <a href="board.html" class="nav-item nav-link">신청현황</a>
                        <a href="board.html" class="nav-item nav-link">고객센터</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu bg-light mt-2">
                                <a href="feature.html" class="dropdown-item">Features</a>
                                <a href="team.html" class="dropdown-item">Our Team</a>
                                <a href="faq.html" class="dropdown-item">FAQs</a>
                                <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                <a href="404.html" class="dropdown-item">404 Page</a>
                            </div>
                        </div>
                        <a href="contact.html" class="nav-item nav-link">Contact</a>
                    </div>
                    <butaton type="button" class="btn text-white p-0 d-none d-lg-block" data-bs-toggle="modal"
                        data-bs-target="#searchModal"><i class="fa fa-search"></i></butaton>
                </div>
            </nav>
        </div>
    </div> -->
    <!-- Navbar End -->


    <!-- Hero Start -->
    <div class="container-fluid pt-5 hero-header" style="background-color:black;">
        <div class="container pt-5">
            <div class="row g-5 pt-5">
                <div class="col-lg-6 align-self-center text-center text-lg-start mb-lg-5">
                    <h1 class="display-4 text-white mb-4 animated slideInRight">M<span style="color:skyblue;">O</span>VED 업체페이지</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center justify-content-lg-start mb-0">
                            <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                            <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Our Projects</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-lg-6 align-self-end text-center text-lg-end">
<!--                    <img class="img-fluid" src="img/hero-img.png" alt="" style="max-height: 300px;">-->
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


    <!-- board Start -->
    <section>
    <div class="container">
    <div class="row" style="padding-top:50px; padding-bottom:50px;">
        <div class="col-xl-3 col-md-6">
            <div class="card bg-pattern">
                <div class="card-body">
                    <div class="float-right">
                        <i class="fa fa-archive text-primary h4 ml-3"></i>
                    </div>
                    
                    <h5 class="font-size-20 mt-0 pt-1"> 24 </h5>

                    <p class="text-muted mb-0">총 신청</p>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card bg-pattern">
                <div class="card-body">
                    <div class="float-right">
                        <i class="fa fa-th text-primary h4 ml-3"></i>
                    </div>
                    <h5 class="font-size-20 mt-0 pt-1">18</h5>
                    <p class="text-muted mb-0">완료</p>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card bg-pattern">
                <div class="card-body">
                    <div class="float-right">
                        <i class="fa fa-file text-primary h4 ml-3"></i>
                    </div>
                    <h5 class="font-size-20 mt-0 pt-1">06</h5>
                    <p class="text-muted mb-0">미처리</p>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card">
                <div class="card-body">
                    <form>
                        <div class="form-group mb-0">
                            <label>Search</label>
                            <div class="input-group mb-0">
                                <input type="text" class="form-control" placeholder="Search..." aria-describedby="project-search-addon" />
                                <div class="input-group-append">
                                    <button class="btn btn-danger" type="button" id="project-search-addon"><i class="fa-solid fa-magnifying-glass"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- end row -->


		
		<%
			String curPage = request.getParameter("page");
			String no = request.getParameter("no");
			
		%>
		
		
	<!-- 메인영역 -->
<!-- 	<div class="main_wrap">
		
		<div class="content_wrap">
			<br> -->
			<!-- <h5>고객 상세</h5> -->
  <%
    String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    String username = "jsp";
    String password = "123456";
    String orderNo = request.getParameter("orderNo");
    
    String query = "SELECT " +
            "NVL(SUM(CASE WHEN PROD = 'refrigerator' THEN QUANT ELSE 0 END), 0) AS refrigerator_quant, " +
            "NVL(SUM(CASE WHEN PROD = 'refrigerator' THEN PRICE ELSE 0 END), 0) AS refrigerator_price, " +
            "NVL(SUM(CASE WHEN PROD = 'washing_machine' THEN QUANT ELSE 0 END), 0) AS washing_machine_quant, " +
            "NVL(SUM(CASE WHEN PROD = 'washing_machine' THEN PRICE ELSE 0 END), 0) AS washing_machine_price, " +
            "NVL(SUM(CASE WHEN PROD = 'chair' THEN QUANT ELSE 0 END), 0) AS chair_quant, " +
            "NVL(SUM(CASE WHEN PROD = 'chair' THEN PRICE ELSE 0 END), 0) AS chair_price, " +
            "NVL(SUM(CASE WHEN PROD = 'bed' THEN QUANT ELSE 0 END), 0) AS bed_quant, " +
            "NVL(SUM(CASE WHEN PROD = 'bed' THEN PRICE ELSE 0 END), 0) AS bed_price, " +
            "NVL(SUM(CASE WHEN PROD = 'table' THEN QUANT ELSE 0 END), 0) AS table_quant, " +
            "NVL(SUM(CASE WHEN PROD = 'table' THEN PRICE ELSE 0 END), 0) AS table_price, " +
            "NVL(SUM(CASE WHEN PROD = 'tv' THEN QUANT ELSE 0 END), 0) AS tv_quant, " +
            "NVL(SUM(CASE WHEN PROD = 'tv' THEN PRICE ELSE 0 END), 0) AS tv_price " +
            "FROM SELECTED_GOODS " +
            "WHERE ORDER_NO = ?";
    String query2 = "SELECT * FROM CLIENT WHERE ORDER_NO = ?";
    
    try {
        Connection conn = DriverManager.getConnection(url, username, password);
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, orderNo);
        
        PreparedStatement pstmt2 = conn.prepareStatement(query2);
        pstmt2.setString(1, orderNo);
        
        ResultSet rs = pstmt.executeQuery();
        ResultSet rs2 = pstmt2.executeQuery();
        
        rs.next();
        rs2.next();
        
        int refrigerator_quant = rs.getInt("refrigerator_quant");
        int refrigerator_price = rs.getInt("refrigerator_price");
        int washing_machine_quant = rs.getInt("washing_machine_quant");
        int washing_machine_price = rs.getInt("washing_machine_price");
        int chair_quant = rs.getInt("chair_quant");
        int chair_price = rs.getInt("chair_price");
        int bed_quant = rs.getInt("bed_quant");
        int bed_price = rs.getInt("bed_price");
        int table_quant = rs.getInt("table_quant");
        int table_price = rs.getInt("table_price");
        int tv_quant = rs.getInt("tv_quant");
        int tv_price = rs.getInt("tv_price");
        String name = rs2.getString("NAME");
        String origin = rs2.getString("ORIGIN");
        String destin = rs2.getString("DESTIN");
        int moving_cost = rs2.getInt("moving_cost");
        
        int total_price = refrigerator_price + washing_machine_price + chair_price + bed_price + table_price + tv_price + moving_cost;
    %>
        <h2>상세 정보</h2>
	       <table border="1" style="width: 50%; margin: 0 auto;">
	    <tr>
	        <th>항목</th>
	        <th>수량</th>
	        <th>가격</th>
	    </tr>
	    <tr>
	        <td>신청자명</td>
	        <td colspan="2"><%= name %></td>
	    </tr>
	    <tr>
	        <td>냉장고</td>
	        <td><%= refrigerator_quant %></td>
	        <td><%= refrigerator_price %></td>
	    </tr>
	    <tr>
	        <td>세탁기</td>
	        <td><%= washing_machine_quant %></td>
	        <td><%= washing_machine_price %></td>
	    </tr>
	    <tr>
	        <td>의자</td>
	        <td><%= chair_quant %></td>
	        <td><%= chair_price %></td>
	    </tr>
	    <tr>
	        <td>침대</td>
	        <td><%= bed_quant %></td>
	        <td><%= bed_price %></td>
	    </tr>
	    <tr>
	        <td>테이블</td>
	        <td><%= table_quant %></td>
	        <td><%= table_price %></td>
	    </tr>
	    <tr>
	        <td>텔레비전</td>
	        <td><%= tv_quant %></td>
	        <td><%= tv_price %></td>
	    </tr>
	     <tr>
	        <td>운송료</td>
	        <td colspan="2"><%= moving_cost %></td>
	    </tr>
	    <tr>
	        <td>합계</td>
	        <td colspan="2"><%= total_price %></td>
	    </tr>
	</table>
			
			<div class="board_btns">
				<form class="control" action="../company/com_board.jsp" method="GET">
					<input type="hidden" name="page" value="<%=curPage%>">
					<input class="control_btn" type="submit" value="목록">
				</form>
			</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">
				
<h2>업체용 견적 입력창</h2>
<form action="estimate_submit.jsp" method="POST">
  <table border="1" style="width: 50%; margin: 0 auto;">
    <tr>
      <th>항목</th>
      <th>수량</th>
      <th>가격</th>
    </tr>
    <tr>
      <td>냉장고</td>
      <td><input type="text" name="refrigerator" id="refrigerator" value="<%= refrigerator_quant %>" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td>
      <td><input type="text" id="refrigerator_price" name="refrigerator_price" placeholder="<%= refrigerator_price %>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    <tr>
      <td>세탁기</td>
      <td><input type="text" id="washing_machine" name="washing_machine" value="<%= washing_machine_quant %>" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td>
      <td><input type="text" id="washing_machine_price" name="washing_machine_price" placeholder="<%= washing_machine_price %>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    <tr>
      <td>의자</td>
      <td><input type="text" id="chair" name="chair" value="<%= chair_quant %>" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td>
      <td><input type="text" id="chair_price" name="chair_price" placeholder="<%= chair_price %>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    <tr>
      <td>침대</td>
      <td><input type="text" id="bed" name="bed" value="<%= bed_quant %>" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td>
      <td><input type="text" id="bed_price" name="bed_price" placeholder="<%= bed_price %>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    <tr>
      <td>테이블</td>
      <td><input type="text" id="table" name="table" value="<%= table_quant %>" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td>
      <td><input type="text" id="table_price" name="table_price" placeholder="<%= table_price %>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    <tr>
      <td>텔레비전</td>
      <td><input type="text" id="tv" name="tv" value="<%= tv_quant %>" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly/></td>
      <td><input type="text" id="tv_price" name="tv_price" placeholder="<%= tv_price %>" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    <tr>
      <th>출발지</th>
      <th>도착지</th>
      <th>운송료</th>
    </tr>
       <tr>
      <td><%=origin %></td>
      <td><%=destin %></td>
      <td><input type="text" id="distance_price" name="distance_price" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
    </tr>
    
  </table>
   <input type="hidden" name="order_number" value ="<%=orderNo%>">
  <br>
  <input type="submit" value="견적 제출">
</form>
    <%
        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white-50 footer pt-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.1s">
                    <a href="../include/index.jsp" class="d-inline-block mb-3">
 						<h1 class="display-4 text-white mb-4 animated slideInRight">M<span style="color:skyblue;">O</span>VED</h1>
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
    <script src="../lib/wow/wow.min.js"></script>
    <script src="../lib/easing/easing.min.js"></script>
    <script src="../lib/waypoints/waypoints.min.js"></script>
    <script src="../lib/counterup/counterup.min.js"></script>
    <script src="../lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../assets/js/main.js"></script>
</body>
</html>		
		
		






