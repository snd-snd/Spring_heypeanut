package com.heypeanut.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.heypeanut.domain.AttachVO;
import com.heypeanut.service.AttachService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FileController {

	@Autowired
	AttachService a_service;
	
	@PostMapping("/upload")	
	public ResponseEntity<AttachVO> upload(MultipartFile uploadFile){
		log.info("FileController -> 이미지 업로드: " + uploadFile);
		System.out.println(uploadFile);
		
		String uploadFolder = "d://upload";
		String uploadFolderPath = getFolder(); // 2019/10/29
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
			
		String uploadOriginalFileName = uploadFile.getOriginalFilename(); 
		String uploadFileName = uploadOriginalFileName.substring(uploadOriginalFileName.lastIndexOf("\\")+1);
					
		//uuid 생성
		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString()+"_"+uploadFileName;
		//AttachFileVO에 생성된 정보 담기
		AttachVO attach = new AttachVO();
		attach.setFileName(uploadOriginalFileName);;
		attach.setUploadPath(uploadFolderPath);
		attach.setUuid(uuid.toString());
		
		try {
			File saveFile = new File(uploadPath, uploadFileName);		
			uploadFile.transferTo(saveFile); //서버에 파일 저장
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}	

		return new ResponseEntity<AttachVO>(attach, HttpStatus.OK);
	}

	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(int pno){
		log.info("FileController -> 섬네일 이미지 요청: " + pno);
		
		AttachVO attach = a_service.detail(pno);	
		File file = new File("d://upload/"+attach.getUploadPath()+"/"+ attach.getUuid() +"_"+ attach.getFileName());
				
		ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	
	//폴더 생성을 위한 폴더명 만들기
	private String getFolder() {
		log.info("FileController -> 폴더명 생성");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		String str = format.format(date);
		return str.replace("-", File.separator);
	}
}
