package com.heypeanut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heypeanut.domain.PageVO;
import com.heypeanut.domain.ProductVO;
import com.heypeanut.service.ProductService;
import com.heypeanut.util.Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	ProductService p_service;
	
	@GetMapping("/customer/list")
	public void customerList() {
		log.info("AdminController -> 회원관리 페이지 요청");
	}
	
	@GetMapping("/product/list")
	public void productList(Model model, Criteria cri) {
		log.info("AdminController -> 상품관리 페이지 요청: " + cri);
		
		List<ProductVO> list = p_service.list(cri);
		
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("page", new PageVO(cri, p_service.listTotalCount(cri)));		
		}
			
	}
	
	@GetMapping("/product/register")
	public void productRegister() {
		log.info("AdminController -> 상품등록 페이지 요청");
	}
	
	@PostMapping("/product/register")
	public String productRegister(ProductVO product) {
		log.info("AdminController -> 상품등록: " + product);
		
		p_service.register(product);
		
		return "redirect:/admin/product/list";
	}
}
