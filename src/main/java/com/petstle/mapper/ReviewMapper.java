package com.petstle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.petstle.domain.Review;

public interface ReviewMapper {
	public Review rate(String susr);
	public List<Review> listRate();
	public List<Review> listReviewOnRequest(String reqid);
	public List<Review> listReviewOnUser(@Param("rusr") String rusr, @Param("susr") String susr);
	public Review detailReview(String revid);
	
	public void newReview(Review rev);
	public void updateReview(Review rev);
	public void deleteReview(String revid);
}
