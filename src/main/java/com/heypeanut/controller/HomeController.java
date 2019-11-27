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
	
	@GetMapping("/intro")
	public void inrto() {
		log.info("인트로 요청");
	}
	
	@GetMapping("/error/error400")
	public void error400() {
		log.info("400 에러페이지 요청");
	}
	
	@GetMapping("/error/error404")
	public void error404() {
		log.info("404 에러페이지 요청");
	}
	
	@GetMapping("/error/error500")
	public void error500() {
		log.info("500 에러페이지 요청");
	}

	@GetMapping("/error/error")
	public void error() {
		log.info("기타 에러페이지 요청");
	}
	
}
