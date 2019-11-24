package com.heypeanut.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heypeanut.domain.AttachVO;
import com.heypeanut.mapper.AttachMapper;

@Service
public class AttachServiceImpl implements AttachService {

	@Autowired
	AttachMapper mapper;

	@Override
	public AttachVO detail(int pno) {
		return mapper.detail(pno);
	}







}
