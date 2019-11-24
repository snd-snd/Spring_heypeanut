package com.heypeanut.mapper;

import com.heypeanut.domain.AttachVO;

public interface AttachMapper {

	AttachVO detail(int pno);
	boolean register(AttachVO attach);
}
