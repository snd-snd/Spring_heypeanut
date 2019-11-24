package com.heypeanut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heypeanut.domain.BasketVO;
import com.heypeanut.domain.OrderVO;
import com.heypeanut.service.BasketService;
import com.heypeanut.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/order/")
public class OrderController {

	@Autowired
	OrderService o_service;
	@Autowired
	BasketService b_service;
	
	@GetMapping("/basket")
	public void basket(Model model, String id) {
		log.info("OrderController -> 장바구니 페이지 요청");
		
		List<BasketVO> list = b_service.basket(id);
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		}
		
	}
	
	@GetMapping("/history")
	public void history(Model model, String id) {
		log.info("OrderController -> 주문내역 페이지 요청");
		
		List<OrderVO> list = o_service.history(id);
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		}

	}
	
	@PostMapping("/complete")
	public ResponseEntity<String> complete(@RequestBody OrderVO order) {
		log.info("OrderController -> 주문완료");
		
		return o_service.register(order)
				? new ResponseEntity<String>("success", HttpStatus.OK)
						: new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
	@PostMapping("/basket")
	public ResponseEntity<String> basket(@RequestBody BasketVO basket) {
		log.info("CategoryController -> 장바구니 첨삭: " + basket);
		
		return b_service.register(basket)
				? new ResponseEntity<String>("success", HttpStatus.OK)
						: new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
}
