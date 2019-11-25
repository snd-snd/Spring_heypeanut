package com.heypeanut.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.heypeanut.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class Scheduler {
	
	@Autowired
	ProductService p_service;
	
	@Scheduled(cron = "0 0 9 ? * SUN")
	public void autoUpdate(){
		log.info("Scheduler -> 매주 일요일 09:00 에 주간 리스트 초기화");
		p_service.weekSet();
	}


}
