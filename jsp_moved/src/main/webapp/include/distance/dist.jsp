<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.*"%>
<%@ page import="human.dao.MemberDao" %>
<%@ page import="human.vo.MemberVo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 및 결제 정보</title>
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
<!--                    <img class="img-fluid" src="../../../assets/img/hero-img.png" alt="" style="max-height: 300px;">-->
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
    <div class="container-fluid bg-light py-5">
        <div class="container py-5">
            <div class="mx-auto text-center wow fadeIn" data-wow-delay="0.1s" style="max-width: 1000px; width:800px;">
                <div class="btn btn-sm border rounded-pill text-primary px-3 mb-3">주소 선택</div>
                <h1 class="mb-4"> 주소 입력 </h1>
                <img src="../../assets/img/logo.png" />
	<div style="margin-top: 20px;" id="imageContainer"></div>
	
	
	
	
	<p>출발주소와 도착주소를 선택하세요.</p>



<form action="../../include/distance/distres.jsp" type="POST">
<div style=" float: left; width: 40%; height:300px;">
	<label for="searchO" id="searchLabelO" onmouseover="changeSearch('mouseover')" onmouseout="changeSearch('mouseout')" onclick="changeSearch('click')">출발주소</label>
	<input type="button" id="searchO" onclick="execDaumPostcode('origin')" value="검색" style="display: none;" ><br>
	
	<input type="text" id="origin_postcode" placeholder="출발지 우편번호" style="border: 0;">
	
	<input type="text" id="origin_address"  name="origin_address" placeholder="출발지 주소" style="border: 0;"><br>
	<input type="text" id="origin_extraAddress" placeholder="출발지 주소2" style="border: 0;"><br>
	<input type="text" id="origin_detailAddress" name="origin_detail" placeholder="출발지 상세주소" style="border: 0;">
</div>

<div style="float: left; width: 20%; height:250px; display:flex; justify-content: center; align-items: center;"><i class="fa-solid fa-arrow-right" style="font-size:30px;"></i></div>

<div style=" float: left; width: 40%; height:300px;">
	<label for="searchD" id="searchLabelD" onmouseover="changeSearch2('mouseover')" onmouseout="changeSearch2('mouseout')" onclick="changeSearch2('click')">도착주소</label>
	<input type="button" id ="searchD" onclick="execDaumPostcode('destination')" value="검색" style="display: none;"><br>
	<input type="text" id="destination_postcode" placeholder="도착지 우편번호" style="border: 0;">
	<input type="text" id="destination_address" name="destination_address" placeholder="도착지 주소" style="border: 0;"><br>
	<input type="text" id="destination_extraAddress" placeholder="도착지 주소2" style="border: 0;"><br>
	<input type="text" id="destination_detailAddress" name="destination_detail" placeholder="도착지 상세주소" style="border: 0;">
</div>


<br>
<label for="submit" id="submitLabel" onmouseover="changeSubmit('mouseover')" onmouseout="changeSubmit('mouseout')" onclick="changeSubmit('click')">확정</label>
<button id="submit" type="submit"style=" display: none;">확정</button>

</form>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

const body = document.body;
const submit = document.getElementById("submit");
const submitLabel = document.getElementById("submitLabel");

// 새로 생성한 검색 버튼
const searchLabelO = document.getElementById("searchLabelO");
const searchLabelD = document.getElementById("searchLabelD");
// 우편번호 입력창
const origin_postcode = document.getElementById("origin_postcode");
const destination_postcode = document.getElementById("destination_postcode");
// 출발지/도착지 주소
const origin_address = document.getElementById("origin_address");
const destination_address = document.getElementById("destination_address");
// 출발지/도착지 주소2
const origin_extraAddress = document.getElementById("origin_extraAddress");
const destination_extraAddress = document.getElementById("destination_extraAddress");
// 출발지/도착지 상세주소
const origin_detailAddress = document.getElementById("origin_detailAddress");
const destination_detailAddress = document.getElementById("destination_detailAddress");

const imageContainer = document.getElementById('imageContainer');
const imageElement = document.createElement('img');
// imageElement.src = '../../assets/img/logo.png';

// 이미지를 imageContainer에 추가
imageContainer.appendChild(imageElement);
imageElement.style.marginTop ='20px';
imageElement.style.marginBottom ='20px';

//body
body.style.display = 'flex';
body.style.flexDirection = 'column';
body.style.alignItems = 'center';
body.style.justifyContent = 'center';

//출발지 검색 버튼
searchLabelO.style.backgroundColor = "#7ABDE9";
searchLabelO.style.color = "white";
searchLabelO.style.height = "40px";
searchLabelO.style.padding = "8px 20px";
searchLabelO.style.marginLeft = "5px";
searchLabelO.style.marginBottom = "20px";

// 도착지 검색 버튼
searchLabelD.style.backgroundColor = "#7ABDE9";
searchLabelD.style.color = "white";
searchLabelD.style.height = "40px";
searchLabelD.style.padding = "8px 20px";
searchLabelD.style.marginLeft = "5px";
searchLabelD.style.marginBottom = "20px";

//출발지 입력창
origin_postcode.style.backgroundColor = '#f0f0f0';
origin_postcode.style.height = "30px";
origin_postcode.style.width = "300px";
origin_postcode.style.marginLeft = "10px";
origin_postcode.style.padding = "10px 20px";
origin_postcode.style.marginBottom ="5px";

origin_address.style.backgroundColor = '#f0f0f0';
origin_address.style.height = "30px";
origin_address.style.width = "300px";
origin_address.style.marginLeft = "10px";
origin_address.style.padding = "10px 20px";
origin_address.style.marginBottom ="5px";

origin_extraAddress.style.backgroundColor = '#f0f0f0';
origin_extraAddress.style.height = "30px";
origin_extraAddress.style.width = "300px";
origin_extraAddress.style.marginLeft = "10px";
origin_extraAddress.style.padding = "10px 20px";
origin_extraAddress.style.marginBottom ="5px";

origin_detailAddress.style.backgroundColor = '#f0f0f0';
origin_detailAddress.style.height = "30px";
origin_detailAddress.style.width = "300px";
origin_detailAddress.style.marginLeft = "10px";
origin_detailAddress.style.padding = "10px 20px";
origin_detailAddress.style.marginBottom ="5px";

// 도착지 입력창
destination_postcode.style.backgroundColor = '#f0f0f0';
destination_postcode.style.height = "30px";
destination_postcode.style.width = "300px";
destination_postcode.style.marginLeft = "10px";
destination_postcode.style.padding = "10px 20px";
destination_postcode.style.marginBottom ="5px";

destination_address.style.backgroundColor = '#f0f0f0';
destination_address.style.height = "30px";
destination_address.style.width = "300px";
destination_address.style.marginLeft = "10px";
destination_address.style.padding = "10px 20px";
destination_address.style.marginBottom ="5px";

destination_extraAddress.style.backgroundColor = '#f0f0f0';
destination_extraAddress.style.height = "30px";
destination_extraAddress.style.width = "300px";
destination_extraAddress.style.marginLeft = "10px";
destination_extraAddress.style.padding = "10px 20px";
destination_extraAddress.style.marginBottom ="5px";

destination_detailAddress.style.backgroundColor = '#f0f0f0';
destination_detailAddress.style.height = "30px";
destination_detailAddress.style.width = "300px";
destination_detailAddress.style.marginLeft = "10px";
destination_detailAddress.style.padding = "10px 20px";
destination_detailAddress.style.marginBottom ="5px";

// 확정
submitLabel.style.backgroundColor = '#1363c6';
submitLabel.style.color = 'white';
submitLabel.style.height = "30px";
submitLabel.style.padding ="10px 20px";
submitLabel.style.display = 'flex';
submitLabel.style.marginTop = '10px';
submitLabel.style.flexDirection = 'column';
submitLabel.style.alignItems = 'center';
submitLabel.style.justifyContent = 'center';

// 호버/클릭시 색변경 함수
function changeSearch(eventType) {
	  if (eventType === 'mouseover') {
	    searchLabelO.style.backgroundColor = '#A4D1F0';
	  } else if (eventType === 'mouseout') {
	    searchLabelO.style.backgroundColor = '#7ABDE9';
	  } else if (eventType === 'click') {
	    searchLabelO.style.backgroundColor = '#A4D1F0';
	  }
	}

function changeSearch2(eventType) {
	  if (eventType === 'mouseover') {
	    searchLabelD.style.backgroundColor = '#A4D1F0';
	  } else if (eventType === 'mouseout') {
	    searchLabelD.style.backgroundColor = '#7ABDE9';
	  } else if (eventType === 'click') {
	    searchLabelD.style.backgroundColor = '#A4D1F0';
	  }
	}

//호버, 클릭 시 색 변경 함수
function changeSubmit(eventType) {
  if (eventType === 'mouseover') {
    submitLabel.style.backgroundColor = '#7ABDE9';
  } else if (eventType === 'mouseout') {
    submitLabel.style.backgroundColor = '#1363c6';
  } else if (eventType === 'click') {
    submitLabel.style.backgroundColor = 'd0d0d0';
  }
}

function execDaumPostcode(type) {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if (data.userSelectedType === 'R') {
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById(type + "_extraAddress").value = extraAddr;
            } else {
                document.getElementById(type + "_extraAddress").value = '';
            }

            document.getElementById(type + '_postcode').value = data.zonecode;
            document.getElementById(type + "_address").value = addr;
            document.getElementById(type + "_detailAddress").focus();
        }
    }).open();
}

</script>


                
            </div>
        </div>
    </div>
    
    
    <!-- Case End -->


    <!-- FAQs Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="mx-auto text-center wow fadeIn" data-wow-delay="0.1s" style="max-width: 500px;">
                <div class="btn btn-sm border rounded-pill text-primary px-3 mb-3">Popular FAQs</div>
                <h1 class="mb-4">Frequently Asked Questions</h1>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="accordion" id="accordionFAQ1">
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.1s">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    How to build a website?
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
                                data-bs-parent="#accordionFAQ1">
                                <div class="accordion-body">
                                    Dolor nonumy tempor elitr et rebum ipsum sit duo duo. Diam sed sed magna et magna diam aliquyam amet dolore ipsum erat duo. Sit rebum magna duo labore no diam.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.2s">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    How long will it take to get a new website?
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                                data-bs-parent="#accordionFAQ1">
                                <div class="accordion-body">
                                    Dolor nonumy tempor elitr et rebum ipsum sit duo duo. Diam sed sed magna et magna diam aliquyam amet dolore ipsum erat duo. Sit rebum magna duo labore no diam.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.3s">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    Do you only create HTML websites?
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                                data-bs-parent="#accordionFAQ1">
                                <div class="accordion-body">
                                    Dolor nonumy tempor elitr et rebum ipsum sit duo duo. Diam sed sed magna et magna diam aliquyam amet dolore ipsum erat duo. Sit rebum magna duo labore no diam.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.4s">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                                    Will my website be mobile-friendly?
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                                data-bs-parent="#accordionFAQ1">
                                <div class="accordion-body">
                                    Dolor nonumy tempor elitr et rebum ipsum sit duo duo. Diam sed sed magna et magna diam aliquyam amet dolore ipsum erat duo. Sit rebum magna duo labore no diam.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="accordion" id="accordionFAQ2">
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.5s">
                            <h2 class="accordion-header" id="headingFive">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                    Will you maintain my site for me?
                                </button>
                            </h2>
                            <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive"
                                data-bs-parent="#accordionFAQ2">
                                <div class="accordion-body">
                                    Dolor nonumy tempor elitr et rebum ipsum sit duo duo. Diam sed sed magna et magna diam aliquyam amet dolore ipsum erat duo. Sit rebum magna duo labore no diam.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.6s">
                            <h2 class="accordion-header" id="headingSix">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                    I’m on a strict budget. Do you have any low cost options?
                                </button>
                            </h2>
                            <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix"
                                data-bs-parent="#accordionFAQ2">
                                <div class="accordion-body">
                                    Dolor nonumy tempor elitr et rebum ipsum sit duo duo. Diam sed sed magna et magna diam aliquyam amet dolore ipsum erat duo. Sit rebum magna duo labore no diam.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.7s">
                            <h2 class="accordion-header" id="headingSeven">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                                    Will you maintain my site for me?
                                </button>
                            </h2>
                            <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven"
                                data-bs-parent="#accordionFAQ2">
                                <div class="accordion-body">
                                    Dolor nonumy tempor elitr et rebum ipsum sit duo duo. Diam sed sed magna et magna diam aliquyam amet dolore ipsum erat duo. Sit rebum magna duo labore no diam.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item wow fadeIn" data-wow-delay="0.8s">
                            <h2 class="accordion-header" id="headingEight">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                                    I’m on a strict budget. Do you have any low cost options?
                                </button>
                            </h2>
                            <div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight"
                                data-bs-parent="#accordionFAQ2">
                                <div class="accordion-body">
                                    Dolor nonumy tempor elitr et rebum ipsum sit duo duo. Diam sed sed magna et magna diam aliquyam amet dolore ipsum erat duo. Sit rebum magna duo labore no diam.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- FAQs Start -->


    <!-- Newsletter Start -->
    <div class="container-fluid bg-primary newsletter py-5">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-md-5 ps-lg-0 pt-5 pt-md-0 text-start wow fadeIn" data-wow-delay="0.3s">
                    <img class="img-fluid" src="../../../assets/img/newsletter.png" alt="">
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
