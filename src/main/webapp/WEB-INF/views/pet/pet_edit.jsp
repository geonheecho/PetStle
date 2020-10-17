<%-- Petsle JSP Common Template 2020/08/11 --%>
<%@page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Petsle</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/themify-icons.css">
    <link rel="stylesheet" href="/css/nice-select.css">
    <link rel="stylesheet" href="/css/flaticon.css">
    <link rel="stylesheet" href="/css/gijgo.css">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/slicknav.css">
    <link rel="stylesheet" href="/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
	<header>
        <div class="header-area ">
            <div class="header-top_area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-8">
                            <div class="short_contact_list">
                                <!--
                                <ul>
                                    <li><a href="/">02 3486 9600</a></li>
                                    <li><a href="/">Mon - Fri 10:00 - 18:00</a></li>
                                </ul>
                                  -->
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-4 ">
                            <div class="header-option">
                               <ul>
                                        <li><a href="">로그인</a></li>
                                        <li><a href="">회원가입</a></li>
                               </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="sticky-header" class="main-header-area">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-3 col-lg-3">
                            <div class="logo">
                                <a href="index">
                                    <img src="img/petslelogo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a href="/">HOME</a></li>
                                        <li><a href="">Petsle?</a></li>
                                        <li><a href="">보금자리 <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li>
                                                	<a href="">우리아이 맡기기</a>
                                                </li>
                                                <li>
                                                	<a href="">펫시터 리뷰</a>
                                                </li>
                                            </ul>               
                                        <li><a href="">반려동물 등록하기</a></li>
                                        <li><a href="">펫시터 지원하기</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    <section class="commonbox">
    <div class="container">
		<form id="pet_form" name="pet_form" method="post" action="edit">
			<div>
				<div>
					<img src="#"/>
					<a href="#">사진 변경</a>
				</div>
				<div>
					<div>
						<span>
							이름
						</span>
						<span>
							<input id="name" type="text" name="name" value="${pet.name }" />
						</span>
					</div>
					<div>
						<span>
							나이
						</span>
						<span>
							<input id="age" type="text" name="age" value="${pet.age }" />
						</span>
					</div>
					<div>
						<span>
							체중
						</span>
						<span>
							<input id="weight" type="text" name="weight" value="${pet.weight }" />
						</span>
					</div>
					<div>
						<span>
							견종
						</span>
						<span>
							<select id="brd_sel" name="brd_sel" onchange="select_brd()">
								<c:forEach items="${attrs['brd'] }" var="brd">
								<option value="${brd.id }">${brd.value }</option>
								</c:forEach>
							</select>
							<input id="brd" type="hidden" name="brd" value="1">
						</span>
					</div>
					<div>
						<span>
							성별
						</span>
						<span>
							<c:forEach items="${attrs['gen'] }" var="gen">
							<input id="${gen.id }" type="radio" name="gen" value="${gen.id }">
							<label for="${gen.id }">${gen.value }</label>
							</c:forEach>
						</span>
					</div>
				</div>
			</div>
			<div>
				<div>
					<span>
						중성화 수술
					</span>
					<span>
						<c:forEach items="${attrs['neu'] }" var="neu">
						<input id="${neu.id }" type="radio" name="neu" value="${neu.id }">
						<label for="${neu.id }">${neu.value }</label>
						</c:forEach>
					</span>
				</div>
				<div>
					<span>
						배변 훈련
					</span>
					<span>
						<c:forEach items="${attrs['bow'] }" var="bow">
						<input id="${bow.id }" type="radio" name="" value="${bow.id }">
						<label for="${bow.id }">${bow.value }</label>
						</c:forEach>
					</span>
				</div>
			</div>
			<div>
				<div>
					<span>
						장애
					</span>
					<span>
						<c:forEach items="${attrs['han'] }" var="han">
						<input id="${han.id }" type="radio" name="han" value="${han.id }">
						<label for="${han.id }">${han.value }</label>
						</c:forEach>
					</span>
				</div>
				<div>
					<span>
						분리불안
					</span>
					<span>
						<c:forEach items="${attrs['sep'] }" var="sep">
						<input id="${sep.id }" type="radio" name="sep" value="${sep.id }">
						<label for="${sep.id }">${sep.value }</label>
						</c:forEach>
					</span>
				</div>
			</div>
			<div>
				<div>
					<span>
						대인 사회성
					</span>
					<span>
						<c:forEach items="${attrs['atm'] }" var="atm">
						<input id="atm${atm.id }" type="radio" name="atm" value="${atm.id }">
						<label for="atm${atm.id }">${atm.value }</label>
						</c:forEach>
					</span>
				</div>
				<div>
					<span>
						동물 사회성
					</span>
					<span>
						<c:forEach items="${attrs['atp'] }" var="atp">
						<input id="atp${atp.id }" type="radio" name="atp" value="${atp.id }">
						<label for="atp${atp.id }">${atp.value }</label>
						</c:forEach>
					</span>
				</div>
			</div>
			<div>
				<a href="#">취소</a>
				<a onClick="reset()">다시</a>
				<a onClick="submit()">쓰기</a>
			</div>
		</form>
    </div>
    
    <script type="text/javascript">
    	
    	
		function select_brd(){
			var val = document.getElementById("brd_sel").selectedIndex;
			document.getElementById("brd").value = val + 1;
		}
		function reset(){
			document.getElementById("name").value = "";
			document.getElementById("age").value = "";
			document.getElementById("weight").value = "";
			document.getElementById("brd").value = "1";
			var e = document.getElementsByName("gen");
			for(var i=0;i<e.length;i++) e[i].checked = false;
			e = document.getElementsByName("neu");
			for(var i=0;i<e.length;i++) e[i].checked = false;
			e = document.getElementsByName("bow");
			for(var i=0;i<e.length;i++) e[i].checked = false;
			e = document.getElementsByName("han");
			for(var i=0;i<e.length;i++) e[i].checked = false;
			e = document.getElementsByName("sep");
			for(var i=0;i<e.length;i++) e[i].checked = false;
			e = document.getElementsByName("atm");
			for(var i=0;i<e.length;i++) e[i].checked = false;
			e = document.getElementsByName("atp");
			for(var i=0;i<e.length;i++) e[i].checked = false;
			document.getElementById("brd_sel").selectedIndex = "0";
		}
		function submit(){
			var form = document.pet_form;
			var fillError = false;
			if(isEmpty(document.getElementById("name").value)) fillError = true;
			if(isEmpty(document.getElementById("age").value)) fillError = true;
			if(isEmpty(document.getElementById("weight").value)) fillError = true;
			if(isEmpty(document.getElementById("brd").value)) fillError = true;
			if(isUnselected(document.getElementsByName("gen"))) fillError = true;
			if(isUnselected(document.getElementsByName("neu"))) fillError = true;
			if(isUnselected(document.getElementsByName("bow"))) fillError = true;
			if(isUnselected(document.getElementsByName("han"))) fillError = true;
			if(isUnselected(document.getElementsByName("sep"))) fillError = true;
			if(isUnselected(document.getElementsByName("atm"))) fillError = true;
			if(isUnselected(document.getElementsByName("atp"))) fillError = true;
			if(fillError)
				alert("모든 정보를 입력 해주세요");
			else
				pet_form.submit();
		}
		function isEmpty(str){
			str = str.trim();
			if(str.length > 0)
				return false;
			return true;
		}
		function isUnselected(e){
			for(var i=0;i<e.length;i++)
				if(e[i].checked)
					return false;
			return true;
		}
	</script>
    
    </section>
    
     <!-- footer_start  -->
    <footer class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-xl-4 col-md-6 col-lg-4">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                	주식회사 펫슬
                            </h3>
                            <ul class="address_line">
                                <li>펫슬 서울시 서초구 <br>강남대로 459(백암빌딩)</li>
                                <li>사업자 등록번호 : 123-45-67891</li>
                                <li>통신판매업 신고번호 : 제 2020-서울강남-12345</li>
                                <li>대표 : 홍길동</li>
                                <li>대표전화 : 02-3486-9600</li>
                                <li>이메일 : help@petsle.co</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-3  col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                	서비스
                            </h3>
                            <ul class="links">
                                <li><a href="#">펫슬?</a></li>
                                <li><a href="#">반려동물 등록하기 </a></li>
                                <li><a href="#">펫시터 지원하기</a></li>
                                <li><a href="#">개인정보 처리방침</a></li>
                                <li><a href="#">이용 약관</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-3  col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                	팻슬에 관하여
                            </h3>
                            <ul class="links">
                                <li><a href="#">펫슬 컴퍼니</a></li>
                                <li><a href="#">채용 공고</a></li>
                                <li><a href="#">비지니스 제휴</a></li>
                                <li><a href="#">오시는 길</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-lg-2 ">
                        <div class="footer_widget">
                            <div class="footer_logo">
                                <a href="#">
                                    <img src="img/petsleflogo.png" alt="">
                                </a>
                            </div>
                            <p class="address_text"> 반려동물을 위한 <br>최고의 경험 
                            						펫슬과<br>함께 하세요!
                            </p>
                            <div class="socail_links">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i class="ti-facebook"></i>
                                        </a>
                                    </li>   
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy-right_text">
            <div class="container">
                <div class="bordered_1px"></div>
                <div class="row">
                    <div class="col-xl-12">
                        <p class="copy_right text-center">
                            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com/" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer_end  -->


    <!-- JS here -->
    <script src="/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/isotope.pkgd.min.js"></script>
    <script src="/js/ajax-form.js"></script>
    <script src="/js/waypoints.min.js"></script>
    <script src="/js/jquery.counterup.min.js"></script>
    <script src="/js/imagesloaded.pkgd.min.js"></script>
    <script src="/js/scrollIt.js"></script>
    <script src="/js/jquery.scrollUp.min.js"></script>
    <script src="/js/wow.min.js"></script>
    <script src="/js/nice-select.min.js"></script>
    <script src="/js/jquery.slicknav.min.js"></script>
    <script src="/js/jquery.magnific-popup.min.js"></script>
    <script src="/js/plugins.js"></script>
    <script src="/js/gijgo.min.js"></script>

    <!--contact js-->
    <script src="/js/contact.js"></script>
    <script src="/js/jquery.ajaxchimp.min.js"></script>
    <script src="/js/jquery.form.js"></script>
    <script src="/js/jquery.validate.min.js"></script>
    <script src="/js/mail-script.js"></script>

    <script src="/js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            disableDaysOfWeek: [0, 0],
        //     icons: {
        //      rightIcon: '<span class="fa fa-caret-down"></span>'
        //  }
        });
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }

        });
        var timepicker = $('#timepicker').timepicker({
         format: 'HH.MM'
     });
    </script>
</body>
</html>