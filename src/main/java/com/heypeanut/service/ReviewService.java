package com.heypeanut.service;

import com.heypeanut.domain.ReviewPageVO;
import com.heypeanut.domain.ReviewVO;
import com.heypeanut.util.Criteria;

public interface ReviewService {

	boolean add(ReviewVO review);
	ReviewPageVO list(Criteria cri, int pno);
	ReviewVO read(int rno);
}
