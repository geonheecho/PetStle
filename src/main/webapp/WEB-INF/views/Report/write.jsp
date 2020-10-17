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
<style>
.form-control {  
  width: 30%;
}
</style>
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
				<div class="col-lg-50">
					<div class="breadcrumb_iner">
						<h2>펫시터 보고서 쓰기</h2>
					</div>
				</div>
			</div>
		</div>
	</div>	
	</section>
<br/><br/><br/>
<!--   enctype="multipart/form-data"  --> 
<!-- -------------------FORM---------------------- -->
			<div class= "aaa">
			<form name="input" id="form" method="POST" action="write.do" enctype="multipart/form-data">
			  <div class="mb-3">
					<label for="title" style="margin:0px 20px 20px 100px;">작성자</label>
					<input type="text" style="border: 1px solid #48BAE4;   margin:0px 0px 0px 100px; top:100px; height:80%; width:10%;" class="form-control" name="repid" id="repid" value='${report.repid}' > <!--  value 안에는 펫시터 작성자의 아이디가 자동으로 들어오게끔만들기. -->
					<label for="title" style="margin:10px 20px 20px 100px;">제목</label>
					<input type="text" style="border: 1px solid #48BAE4; height:10%; margin:0px 0px 0px 100px; width:10%;" class="form-control" name="title" id="title" value='${report.title}' > 
				<%--<input type="hidden" class="check" id="f_rst" name="f_rst" value="${f_rst.id}">
				 	<input type="hidden" class="check" id="f_req" name="f_req" value="${f_req.id}">  --%>	
			  </div>
			 <div class="filebox-preview-image" style="margin:10px 20px 10px 100px;">
				 <input style="display:none" type="file" name="file" id="input-file" class="upload-hidden" multiple="multiple">
			 </div>
				<label style="margin-left:9%" class="imageLabel" for="input-file">업로드</label>
		<!-- -------------------FORM---------------------- -->
    <article>
	  <div class="container" role="main" text-align="left">		
		<br/>
		  <br/> 
  		    <div>
			  <span style="margin-left:-28%" >
			         식사
		      </span>
				<span>
				  <c:forEach items="${attrs}" var="f_rst">
					<input id="${f_rst.id}" type="radio" name="f_rst" value="${f_rst.id}">	
					<label for="${f_rst.id}">${f_rst.value }</label>
				  </c:forEach>
				</span>
		    </div>
	   </div>				
			<div class="mb-5" style="margin:20px 0px 0px 80px;">
				<label form="content">하고싶은 말</label>
				<input class="form-control check" rows="5" name="content" id="content" placeholder="내용을 입력하세요">
			</div>		
			<div style="margin:20px 0px 0px 80px; width:50%; height:80%;" >
			  <!-- <a href='content.do'> -->
			  <button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="check()">쓰기</button>
			  <input type="reset" value="다시입력" onclick="reset()">	  
			</div>
	</article>
	</form>
	<br/><br/><br/>
	 </div>

    <script type="text/javascript">
    function reset(){
    	document.getElementById("repid").value="";
    	document.getElementById("title").value="";
    	document.getElementById("content").value="";
    	var e= document.getElementsByName("f_rst");
    	for(var i=0;i<e.length;i++)e[i].checked = false;    
    }
  	  function check(){
  		 var e = document.getElementsByName("f_rst");
   	 	var selectedF_rst;
    	for(var i=0;i<e.length;i++){
    		if(e[i].checked == true)
    			selectedF_rst = i + 1;	
    	}
    	
     	 /* let length = document.getElementsByClassName('check').length;
    	for(let i=0; i<length; i++){
    		if(document.getElementsByClassName('check')[i].value == ""){
    			alert("모든 정보를 입력해주세요.");
    			return false;
    		}
    	}   */
		 
    	let form_submit = document.getElementById('form');
   		let hiddenInputTag = document.createElement('input');
   		hiddenInputTag.setAttribute('name', 'content');
   		hiddenInputTag.setAttribute('type', 'hidden');
   		hiddenInputTag.setAttribute('value', $('#content').val());
    	
    	
    	console.log("repid : "+$('#repid').val());
    	console.log("title : "+$('#title').val());
    	console.log("content : "+$('#content').val());
    	console.log("f_rst : "+$('#f_rst').val());
    	
    	
    	form_submit.append(hiddenInputTag);
    	
    	//1.form 전송
    	form_submit.submit();
    	
    }  
     
    function isEmpty(str){
    	str= str.trim();
    	if(str.length >0)
    		return false;
    	return true;	
    }
    function isUnselectd(e){
    	for(var i=0; i<e.length;i++)
    		if(e[i].checked)
    			return false;
    	return true;
    }
   
    </script>
    
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
   	<script src="/js/regist/imageupload.js"></script>
</body>
</html>