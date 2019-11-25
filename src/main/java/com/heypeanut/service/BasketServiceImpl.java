package com.heypeanut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heypeanut.domain.BasketVO;
import com.heypeanut.mapper.BasketMapper;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	BasketMapper b_mapper;
	
	@Override
	public boolean register(BasketVO basket) {
		return b_mapper.register(basket);
	}

	@Override
	public List<BasketVO> basket(String id) {
		return b_mapper.basket(id);
	}

	@Override
	public boolean remove(int bno) {
		return b_mapper.remove(bno);
	}
}
