package com.heypeanut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heypeanut.domain.BasketVO;
import com.heypeanut.domain.OrderInfo;
import com.heypeanut.domain.ProductVO;
import com.heypeanut.service.BasketService;
import com.heypeanut.service.ProductService;
import com.heypeanut.util.Category;
import com.heypeanut.util.Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product/")
public class ProductController {

	@Autowired
	ProductService p_service;
	
	@GetMapping("/list")
	public void list(Model model, String cate, Criteria cri) {
		log.info("CategoryController -> 해당 카테고리의 제품을 GET");		
		
		if (cate != null) {
			cri.setType("cate");
			cri.setKeyword(cate);
		}
		
		
		List<ProductVO> list = p_service.nonList(cri);
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			if (cate != null) {
				model.addAttribute("cate", new Category(cate));				
			} 
		}
		if (cate == null) {
			model.addAttribute("cate", new Category(cri.getKeyword()));			
		}

	}
	
	@GetMapping("/detail")
	public void read(Model model, int pno, String message) {
		log.info("CategoryController -> 해당 제품을 GET");
				
		ProductVO product = p_service.detail(pno);
		
		
		if (product != null) {
			model.addAttribute("pro", product);
			if (message != null) {
				model.addAttribute("message", message);
			}
		}
		
	}
	
	@PostMapping("/order")
	public String order(Model model, String id, int pno, int amount, int bno) {
		log.info("CategoryController -> 구매 페이지로 이동: " + id +","+ pno +","+ amount+","+bno);
		
		OrderInfo info = p_service.order(id, pno);
		if (info != null) {
			info.setAmount(amount);
			model.addAttribute("info", info);
			if (bno != 0)
				model.addAttribute("bno", bno);
		}
		
		return "/product/order";
	}
	
	
	
	
}
