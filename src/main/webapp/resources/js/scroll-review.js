var vars = '<div class="testmonial_wrap" ><div class="single_testmonial d-flex align-items-center"><div class="review-box"><div class="test_thumb"><img src="img/testmonial/1.png" alt=""></div><div class="test_content"><h4>리뷰어1</h4><span>정말 만족스러워요 펫시터님 짱</span><p>우리뽀삐가 약간 불리불안증세가 있어서 걱정이 많이 됐는데 펫시터님꼐서 정말 사랑으로 돌봐주셨는지 펫시터님과 떨어지기 싫어할정도더라구요.   앞으로도 잘 부탁드리겠습니다!</p></div></div><a href="#" class="genric-btn info circle">내용 더 보기</a></div></div>';
	vars += '<div class="testmonial_wrap" ><div class="single_testmonial d-flex align-items-center"><div class="review-box"><div class="test_thumb"><img src="img/testmonial/1.png" alt=""></div><div class="test_content"><h4>리뷰어1</h4><span>정말 만족스러워요 펫시터님 짱</span><p>우리뽀삐가 약간 불리불안증세가 있어서 걱정이 많이 됐는데 펫시터님꼐서 정말 사랑으로 돌봐주셨는지 펫시터님과 떨어지기 싫어할정도더라구요.   앞으로도 잘 부탁드리겠습니다!</p></div></div><a href="#" class="genric-btn info circle">내용 더 보기</a></div></div>';
	vars += '<div class="testmonial_wrap" ><div class="single_testmonial d-flex align-items-center"><div class="review-box"><div class="test_thumb"><img src="img/testmonial/1.png" alt=""></div><div class="test_content"><h4>리뷰어1</h4><span>정말 만족스러워요 펫시터님 짱</span><p>우리뽀삐가 약간 불리불안증세가 있어서 걱정이 많이 됐는데 펫시터님꼐서 정말 사랑으로 돌봐주셨는지 펫시터님과 떨어지기 싫어할정도더라구요.   앞으로도 잘 부탁드리겠습니다!</p></div></div><a href="#" class="genric-btn info circle">내용 더 보기</a></div></div>';
	$(window).scroll(function() {
	    var scrolltop = $(window).scrollTop();
	    console.log(scrolltop);
	    var height = $(document).height();
	    console.log(height);
	    var height_win = $(window).height();
	    console.log(height_win);
    
  if (Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()) {
	  $('.review').append(vars);
    }  
	});