package com.heypeanut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.heypeanut.domain.OrderVO;
import com.heypeanut.mapper.OrderMapper;
import com.heypeanut.mapper.ProductMapper;

@Service
public class OrderSerivceImpl implements OrderService {

	@Autowired
	OrderMapper o_mapper;
	@Autowired
	ProductMapper p_mapper;
	
	@Transactional
	@Override
	public boolean register(OrderVO order) {
		p_mapper.weekUp(1, order.getPno());
		return o_mapper.register(order);
	}

	@Override
	public List<OrderVO> history(String id) {
		return o_mapper.history(id);
	}

}
