package com.heypeanut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.heypeanut.domain.QNAVO;
import com.heypeanut.mapper.QNAMapper;
import com.heypeanut.util.Criteria;

@Service
public class QNAServiceImpl implements QNAService {

	@Autowired
	QNAMapper q_mapper;
	
	@Override
	public boolean register(QNAVO qna) {
		return q_mapper.register(qna);
	}

	@Override
	public List<QNAVO> list(Criteria cri) {
		return q_mapper.list(cri);
	}
	
	@Override
	public int listTotalCount(Criteria cri) {
		return q_mapper.listTotalCount(cri);
	}
	
	@Transactional
	@Override
	public QNAVO read(int qno) {
		q_mapper.readUp(qno);
		return q_mapper.read(qno);
	}

}
