<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>회원가입</title>
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
    <link href="../../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../../assets/css/style.css" rel="stylesheet">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css'>
  <link rel="stylesheet" href="../../assets/css/join.css">


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
    




   <!-- Hero Start -->
    <div class="container-fluid pt-5 bg-primary hero-header">
        <div class="container pt-5">
            <div class="row g-5 pt-5">
                <div class="col-lg-6 align-self-center text-center text-lg-start mb-lg-5">
                    <h1 class="display-4 text-white mb-4 animated slideInRight">M<span style="color:skyblue;">O</span>VED</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center justify-content-lg-start mb-0">
                            <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                            <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Contact Us</li>
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


    

   <!-- join Start -->
   <section>
   <form class="joincontainer" action="../../moved/join/joinpro.jsp" method="POST">
        <h2 class="heading">회원가입</h2>
        <div class="steps-container">
            <hr>
            <hr class="active">
            <div class="steps"><i class="fa-solid fa-user"></i></div>
            <div class="steps"><i class="fa-solid fa-envelope"></i></div>
            <div class="steps"><i class="fa-solid fa-key"></i></div>
            <div class="steps"><i class="fa-solid fa-trophy"></i></div>
        </div>
        
        <div class="input-slide-contianer">
            <scroller>
                <div class="input-slide">
                <h3>사용자 이름</h3>
                <p><i>온라인에서 사용되는 이름입니다.</i></p>
                <ul class="rules">

                    <li>사용자 이름에는 문자, 숫자, 밑줄, 하이픈만 포함해야 합니다. </li>
                    <li>공백이나 특수 문자는 허용되지 않습니다.</li>
                    <li>귀하의 사용자 이름은 불쾌감을 주거나 욕설을 포함해서는 안 됩니다.</li>
                </ul>
                
                <div class="full-name">
                	<input type="text" placeholder="이름" name="memname">
				</div>
              <!--       <input type="text" name="lastname" class="lastname" placeholder="성"> -->
                <button class="button-nex" onclick="NextSlide(1)">Next</button>
            </div>
            <div class="input-slide user-detail">
                <h3>Email</h3>
                <p><i>Email을 입력해 주세요.</i></p>
                <ul class="rules">
                    <li>"example@example.com" 형식으로 유효한 이메일을 입력해 주세요.</li>
                    <li>MOVED는 귀하의 개인 정보를 소중히 여기며 귀하의 이메일을 승인되지 않은 목적으로 사용하지 않을 것입니다.</li>
                </ul>
                <input type="email" id="memid" name="memid" class="email" placeholder="Email">
 
                <input class="join_inner_btn" type="button" value="중복확인" onclick="idcheck();" style="background-color:#1363c6; color:white;">
                <span class="id_check_msg"></span>
                <script>
					function idcheck() {
						id = $('#memid').val();	// GET방식
			
						window.open("../../moved/join/checkid.jsp?memid="+id, "chkid", "width=400, height=200");
					}
					
					function useable_id() {
						$('.id_check_msg').text('사용할 수 있는 아이디입니다').css('color','blue');
					}
					function unuseable_id() {
						$('.id_check_msg').text('중복된 아이디입니다').css('color','red');
					}
				</script>
                <button class="button-nex" onclick="NextSlide(2)">Next</button>
            </div>
            <div class="input-slide password-slide">
                <h3>Password</h3>
                <p><i>안전한 비밀번호로 계정을 보호하세요</i></p>
                <ul class="rules">
                    <li>대문자, 소문자, 숫자, 특수문자를 혼합하여 포함하세요.</li>
                    <li>일반적이거나 쉽게 추측할 수 있는 비밀번호를 사용하지 마세요.</li>
                    <li>개인정보를 사용하지 마세요.</li>
                </ul>
                <input type="password" name="mempw" class="password" placeholder="비밀번호">
                <input type="password" name="confirm-password" class="confirm-password" placeholder="한번 더 비밀번호를 입력하세요.">
                <div class="check-password"></div>
                <script>
				// 비밀번호 일치 여부를 확인하는 함수
				function checkPasswordMatch() {
				  // 입력한 비밀번호와 확인 비밀번호를 가져온다.
				  const mempw = document.querySelector("input[name='mempw']").value;
				  const confirmpw = document.querySelector("input[name='confirm-password']").value;
				
				  // 두 비밀번호가 일치하는지 확인한다.
				  if (mempw === confirmpw) {
				    // 일치하는 경우
				    document.querySelector(".check-password").innerHTML = "비밀번호가 일치합니다.";
				    document.querySelector(".check-password").style.color = "blue";
				  } else {
				    // 일치하지 않는 경우
				    document.querySelector(".check-password").innerHTML = "비밀번호가 일치하지 않습니다.";
				    document.querySelector(".check-password").style.color = "red";
				  }
				}
				
				// 비밀번호 입력 시마다 함수를 호출한다.
				document.querySelector("input[name='confirm-password']").addEventListener("input", checkPasswordMatch);
				</script>
                
                <button class="button-nex" onclick="NextSlide(3)">Next</button>
            </div>
            <div class="input-slide finish-slide">
                <h3>축하해요!</h3>
                <p><i>등록에 필요한 모든 단계를 완료했습니다.</i></p>
                <ul class="rules">
                <li>정보를 제출하기 전에 잠시 시간을 내어 제공된 모든 세부 정보가 올바른지 확인하시기 바랍니다. </li>
                <li>우리는 사용자의 개인정보 보호와 보안을 매우 중요하게 생각하며, 제공되는 모든 정보가 정확하고 최신 정보인지가 중요합니다.</li> 
                <li>정보가 제대로 되어 있는지 확인한 후 '제출' 버튼을 클릭하세요.</li>
                </ul> 
              
                <input type="submit" class="button-nex" ></input>
            </div>
        </scroller> 
        </div>
      <button class="GoBack" onclick="GoBack()"><i class="fa-solid fa-arrow-left"></i></button> 
    </form>
    </section>
<!-- partial -->
  <script  src="../../assets/js/join.js"></script>
   <!-- join End -->
   


    


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white-50 footer pt-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-md-6 col-lg-3 wow fadeIn" data-wow-delay="0.1s">
                    <a href="../../include/index.jsp" class="d-inline-block mb-3">
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