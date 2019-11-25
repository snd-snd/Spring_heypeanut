package com.heypeanut.service;

import java.util.List;

import com.heypeanut.domain.BasketVO;

public interface BasketService {

	boolean register(BasketVO basket);
	List<BasketVO> basket(String id);
	boolean remove(int bno);
}
