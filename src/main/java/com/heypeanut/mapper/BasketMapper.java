package com.heypeanut.mapper;

import java.util.List;

import com.heypeanut.domain.BasketVO;

public interface BasketMapper {

	boolean register(BasketVO basket);
	List<BasketVO> basket(String id);
}
