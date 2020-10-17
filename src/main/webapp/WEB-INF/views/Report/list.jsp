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
    
   
    	 
   <section class="breadcrumb_part">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="breadcrumb_iner">
                  <h2>펫시터 보고서</h2>
               </div>
            </div>
         </div>
      </div>
   </section>
<br/><br/><br/>
<article>
<div class="container">
<div class="table-responsive"   style="text-align:center">
<table class="table table-striped table-sm">
      <colgroup>
         <col style="width:10%;" />
         <col style="width:auto;" />
         <col style="width:15%;" />
         
      </colgroup>
      <thead>
         <tr>
            
            <th>작성자</th>         
            <th>제목</th>
            <th>작성일</th>
            <th></th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${empty rlist}" >
               <tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
            </c:when> 
        	<c:otherwise>
        	<c:forEach items="${rlist}" var="report"> 
                 <%--  <tr>
                     <td><c:out value="${report.repid}"/></td>
                     <a href="content.do?seq=${report.repid}">                
                     <td><c:out value="${report.udate}"/></td>
                     <td><c:out value="${report.readed}"/></td>
                  </tr> --%>
	                  <TR align='center' noshade>
						<TD>${report.repid}</TD>
						<!--  <TD>${report.title}</TD>-->
						<TD><a href="content.do?repid=${report.repid}">${report.title}</TD>	      					
						<TD>${report.udate}</TD>
					    <TD>
	      			<!--  <a href="content.do?repid=${report.repid}">
	      				${report.title}-->      			
					</TD>
					
	  				 </TR> 
             </c:forEach>
            </c:otherwise>
         </c:choose>
      </tbody>
</table>
<hr width='1000' size='2' color='gray' noshade>
<font color='black' size='2'>
    (총페이지수 : ${listResult.totalPageCount})
    &nbsp;&nbsp;&nbsp;
    <c:forEach begin="1" end="${listResult.totalPageCount}" var="i">
        <a href="list.do?cp=${i}">
   			<c:choose>
   			    <c:when test="${i==listResult.page}">
                	<strong>${i}</strong>
                </c:when>
                <c:otherwise>
                    ${i}
                </c:otherwise>
			</c:choose>
    	</a>&nbsp;
    </c:forEach>
    ( TOTAL : ${listResult.totalCount} )
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       페이지 싸이즈 : 
    <select id="psId" name="ps" onchange="f(this)">
    	<c:choose>
    		<c:when test="${listResult.pageSize == 3}">
    		   <option value="3" selected>3</option>
		       <option value="5">5</option>
		       <option value="10">10</option>
    		</c:when>
    		<c:when test="${listResult.pageSize == 5}">
    		   <option value="3">3</option>
		       <option value="5" selected>5</option>
		       <option value="10">10</option>
    		</c:when>
    		<c:when test="${listResult.pageSize == 10}">
    		   <option value="3">3</option>
		       <option value="5">5</option>
		       <option value="10" selected>10</option>
    		</c:when>
    	</c:choose>
    </select>
    
    <script language="javascript">
       function f(select){
           //var el = document.getElementById("psId");
           var ps = select.value;
           //alert("ps : " + ps);
           location.href="list.do?ps="+ps;
       }
    </script>
    
</font>
   
</div>
</div>
</article>
<br/><br/><br/>


<!-- <script>
   $(document).on('click', '#btnWriteForm', function(e){
      e.preventDefault();   
      location.href = "${pageContext.request.contextPath}/board/board.do?m=write";
   });
</script> -->
<%-- <c:if test= "${!empty loginUser}"> --%>
<a href='write.do'><input type="button" class="btn btn-primary float-right" id="btnWriteForm" value="글쓰기"  style=" MARGIN-RIGHT: 11.5%;  MARGIN-TOP: -3%;"></a>
<%--</c:if> 이 주석을 풀면 펫시터만 글을 쓸수있음 변수명은 변경해야함--%> 
    
    <section class="commonbox">
    <div class="container">
       
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