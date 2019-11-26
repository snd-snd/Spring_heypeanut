package com.heypeanut.mapper;

import java.util.List;

import com.heypeanut.domain.QNAVO;
import com.heypeanut.util.Criteria;

public interface QNAMapper {

	boolean register(QNAVO qna);
	List<QNAVO> list(Criteria cri);
	int listTotalCount(Criteria cri);
	
	QNAVO read(int qno);
	boolean readUp(int qno);
	boolean modify(QNAVO qna);
	boolean remove(int qno);
}
