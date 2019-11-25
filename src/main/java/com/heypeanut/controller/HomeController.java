package com.heypeanut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.heypeanut.domain.ProductVO;
import com.heypeanut.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

	@Autowired
	ProductService p_service;
	
	@GetMapping({"/","/index"})
	public String index(Model model) {
		log.info("HomeController -> index 페이지 요청");
		
		List<ProductVO> topList = p_service.topList();
		List<ProductVO> newList = p_service.newList();
		List<ProductVO> weekList = p_service.weekList();
			
		model.addAttribute("topList", topList);
		model.addAttribute("newList", newList);
		model.addAttribute("weekList", weekList);
		
		return "/index";
	}
	
	
	
}
