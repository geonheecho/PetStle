package com.petstle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petstle.domain.Review;
import com.petstle.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewMapper rmapper;
	
	@Override
	public List<Review> listReview() {
		return rmapper.listReviewOnUser("%", "%");
	}
	
	@Override
	public List<Review> listReviewOnUser(String rusr, String susr) {
		if(rusr == null)
			rusr = "%";
		else if(rusr.isEmpty())
			rusr = "%";
		if(susr == null)
			susr = "%";
		else if(susr.isEmpty())
			susr = "%";
		return rmapper.listReviewOnUser(rusr, susr);
	}
	@Override
	public Review detailReview(String revid) {
		return rmapper.detailReview(revid);
	}
	
	@Override
	public void newReview(Review rev) {
		rmapper.newReview(rev);
	}
	@Override
	public void updateReview(Review rev) {
		rmapper.updateReview(rev);
	}
	@Override
	public void deleteReview(String revid) {
		rmapper.deleteReview(revid);
	}
}
