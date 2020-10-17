package com.petstle.service;

import java.util.List;

import com.petstle.domain.Review;

public interface ReviewService {
	public List<Review> listReview();
	
	/*
	 * 특정 사용자로 정렬된 리뷰 목록 생성
	 * rusr : 고객
	 * susr : 시터
	 * 둘 중 한 파라미터만 사용 가능하며 사용하지 않는 파라미터는 null로 입력 하면 자동으로 생략
	 * 두 파라미터 모두 null일 경우 모든 리뷰 목록 반환
	 */
	public List<Review> listReviewOnUser(String rusr, String susr);
	public Review detailReview(String revid);
	
	public void newReview(Review rev);
	public void updateReview(Review rev);
	public void deleteReview(String revid);
}
