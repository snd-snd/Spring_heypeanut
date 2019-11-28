package com.heypeanut.service;

import java.util.List;

import com.heypeanut.domain.ReplyVO;

public interface ReplyService {

	boolean add(ReplyVO reply);
	boolean delete(int rno);
	List<ReplyVO> select(int qno);
}
