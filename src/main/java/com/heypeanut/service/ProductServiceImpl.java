package com.heypeanut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.heypeanut.domain.AttachVO;
import com.heypeanut.domain.OrderInfo;
import com.heypeanut.domain.ProductVO;
import com.heypeanut.mapper.AttachMapper;
import com.heypeanut.mapper.MemberMapper;
import com.heypeanut.mapper.ProductMapper;
import com.heypeanut.util.Criteria;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper p_mapper;
	@Autowired
	AttachMapper a_mapper;
	@Autowired
	MemberMapper m_mapper;
	
	
	@Transactional
	@Override
	public boolean register(ProductVO product) {
		p_mapper.register(product);
		AttachVO attach = product.getAttach();
		attach.setPno(product.getPno());
		return a_mapper.register(attach);
	}
	
	@Override
	public List<ProductVO> list(Criteria cri) {
		return p_mapper.list(cri);
	}
	
	@Override
	public List<ProductVO> nonList(Criteria cri) {
		return p_mapper.nonList(cri);
	}
	
	@Override
	public int listTotalCount(Criteria cri) {
		return p_mapper.listTotalCount(cri);
	}
	
	@Override
	public ProductVO detail(int pno) {
		return p_mapper.detail(pno);
	}
	
	@Transactional
	@Override
	public OrderInfo order(String id, int pno) {
		OrderInfo order = new OrderInfo();
		order.setMember(m_mapper.read(id));
		order.setProduct(p_mapper.detail(pno));
		return order;
	}

	
}
