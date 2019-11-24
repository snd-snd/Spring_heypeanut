package com.heypeanut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heypeanut.domain.OrderVO;
import com.heypeanut.mapper.OrderMapper;

@Service
public class OrderSerivceImpl implements OrderService {

	@Autowired
	OrderMapper o_mapper;
	
	@Override
	public boolean register(OrderVO order) {
		return o_mapper.register(order);
	}

	@Override
	public List<OrderVO> history(String id) {
		return o_mapper.history(id);
	}

}
