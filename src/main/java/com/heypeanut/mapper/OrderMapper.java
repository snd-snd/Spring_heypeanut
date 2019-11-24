package com.heypeanut.mapper;

import java.util.List;

import com.heypeanut.domain.OrderVO;

public interface OrderMapper {

	boolean register(OrderVO order);
	List<OrderVO> history(String id);
}
