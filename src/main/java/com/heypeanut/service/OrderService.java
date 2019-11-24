package com.heypeanut.service;

import java.util.List;

import com.heypeanut.domain.OrderVO;

public interface OrderService {

	boolean register(OrderVO order);
	List<OrderVO> history(String id);
}
