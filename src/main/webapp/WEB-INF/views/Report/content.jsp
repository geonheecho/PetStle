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
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
											
					</div>
				</div>
			</div>
		</div>
	</section>
<br/><br/><br/>
	<article>
		<div class="container" role="main">
			<h2>상황일지</h2>
			<hr>
			<br/>
			
			
			<div class="bg-white rounded shadow-sm"></div>			
				<div class="mb-3">
				<h4>작성자</h4>
				<input type="text" value="${report.repid}" style="border: 1px solid #48BAE4; height:auto; width:20%;" class="form-control" readonly><div class="board_title"></div>
				<div class="board_info_box">
				<br/>
				<h4>제목</h4>
				<input type="text" value="${report.title}" style="border: 1px solid #48BAE4; height:auto; width:20%;" class="form-control" readonly><div class="board_title"></div>
				<div class="board_info_box">
				</div>	
				<br/>
				  <br/>
				    <br/>
				<h4>이미지 들어올자리</h4>				
				<br/>
				<br/>
					<div id="alertNeu" class="textFilter"><br></div>
					<div class="attributeset">
							<label class="attributeLabel2">컨디션</label>
							 <span> <!--  [] 이건 map방식에서만 사용 가능  -->
							 		<!-- 리스트 쓸때는 이 방식 -->
								<c:forEach items="${attrs }" var="f_rst">
								<input id="${f_rst.id }" type="radio" name="f_rst" value="${f_rst.id  }" <c:if test="${f_rst.value == Report.f_rst }">checked</c:if> onchange="delAlert(this.name)" disabled>
								<label style="margin-right:84px; cursor:context-menu" for="${f_rst.id}">${f_rst.value}</label>
								</c:forEach>		             
							</span>
							</div>
							
			
	
				
				<div class="mb-5">
					<label >내용</label>
					<input class="form-control" rows="5" name="content" id="content" value="${report.content}" readonly>
				</div>
			    	
			<!--  <div style="margin-top : 20px">
				<!--<c:if test="${loginUser.email eq sitter.email}">
				  현재 로그인된 이메일과 게시판에 등록된 이메일과 같다면 true 그러면 삭제 수정 가능. -->
				<button type="submit" class="btn btn-sm btn-primary" id="btnUpdate" onclick="location.href='update.do?repid=${report.repid}'">수정</button>
				<button type="submit" class="btn btn-sm btn-primary" id="btnDelete" onclick="location.href='del.do?repid=${report.repid}'">삭제</button>
				<!--</c:if>-->
				<a href="list.do"><button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button></a>
				<hr>
			</div>
		</div>
	  	<table>
          <thead>
            <tr>
              <th>
           <!--  댓글  -->
    <div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" id="c_repid" name="c_repid" value="${report.repid}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력해주세요.">
               <span class="input-group-btn">
                  <button class="btn btn-default" type="button" name="commentInsertButton">등록</button>                 
               </span>
            </div>
        </form>
    </div>   
    
    <div class="container">
        <div class="CommentList"></div>
     </div>
              </th>
             </tr>
           </thead>                 
        </table>       
		</article>
    </div>
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
    <script src="/js/comment.js"></script>

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