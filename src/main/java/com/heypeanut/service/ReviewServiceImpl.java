package com.heypeanut.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.heypeanut.domain.ReviewPageVO;
import com.heypeanut.domain.ReviewVO;
import com.heypeanut.mapper.ProductMapper;
import com.heypeanut.mapper.ReviewMapper;
import com.heypeanut.util.Criteria;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewMapper r_mapper;
	@Autowired
	ProductMapper p_mapper;
	
	@Transactional
	@Override
	public boolean add(ReviewVO review) {
		p_mapper.scoreUp(review.getScore(), review.getPno());
		return r_mapper.add(review);
	}

	@Override
	public ReviewPageVO list(Criteria cri, int pno) {
		return new ReviewPageVO(r_mapper.list(cri, pno), r_mapper.totalCount(pno));
	}
}
