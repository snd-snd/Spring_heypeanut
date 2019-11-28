package com.heypeanut.mapper;

import java.util.List;

import com.heypeanut.domain.ReplyVO;

public interface ReplyMapper {

	boolean add(ReplyVO reply);
	boolean delete(int rno);
	List<ReplyVO> select(int qno);
}
