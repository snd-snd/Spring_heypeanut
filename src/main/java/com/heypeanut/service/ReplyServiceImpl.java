package com.heypeanut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heypeanut.domain.ReplyVO;
import com.heypeanut.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper r_mapper;
	
	@Override
	public boolean add(ReplyVO reply) {
		return r_mapper.add(reply);
	}

	@Override
	public boolean delete(int rno) {
		return r_mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> select(int qno) {
		return r_mapper.select(qno);
	}

}
