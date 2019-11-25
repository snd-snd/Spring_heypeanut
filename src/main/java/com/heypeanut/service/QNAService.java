package com.heypeanut.service;

import java.util.List;

import com.heypeanut.domain.QNAVO;
import com.heypeanut.util.Criteria;

public interface QNAService {

	boolean register(QNAVO qna);
	List<QNAVO> list(Criteria cri);
	int listTotalCount(Criteria cri);
	
	QNAVO read(int qno);
}
