package com.hk.poom.controller;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hk.poom.HomeController;
import com.hk.poom.dto.CategoryDTO;
import com.hk.poom.dto.CommunityAddDTO;
import com.hk.poom.dto.CommunityUpdateDTO;
import com.hk.poom.dto.RehomeUpdateDTO;
import com.hk.poom.service.CommunityService;

import net.sf.json.JSONArray;

@Controller
public class CommunityController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	CommunityService communityService;
	
	@Autowired
	ServletContext sc;
	
	@GetMapping("/poom/community/list")
	public String communityList(Model model ) {
		model.addAttribute("communityList",communityService.communityList());
		
		return "community/communityList";
	}
	
	@GetMapping("/poom/community/read")
	public String community(@RequestParam("bno") int bno, Model model ) {
		logger.info("bno=" + bno);
		model.addAttribute("communityRead",communityService.communityRead(bno));
		
		return "community/communityRead";
	}
	
	
	@PostMapping("/poom/community/read")
	public String communityReadPost( ) {
		
		
		return "community/communityReadPost";
	}
	
	@GetMapping("/poom/community/add")
	public String communityAdd(Model model, CommunityAddDTO communityAddDTO ) {
		List<CategoryDTO> category =null;
		category = communityService.category();
		model.addAttribute("category",JSONArray.fromObject(category));

		logger.info("category" + model);
		
		return "community/communityAdd";
	}
	
	
	@PostMapping("/poom/community/add")
	public String communityAddPost(@RequestParam("file") MultipartFile[] file, Model model, CommunityAddDTO communityAddDto,@RequestParam("cateCode") String cateCode ) {
		
		 for(int i=0; i<file.length; i++) {
//           System.out.println("================== file start ==================");
//           System.out.println("파일 이름: "+file[i].getName());
//           System.out.println("파일 실제 이름: "+file[i].getOriginalFilename());
//           System.out.println("파일 크기: "+file[i].getSize());
//           System.out.println("content type: "+file[i].getContentType());
//           System.out.println("================== file   END ==================");
           
           String realPath = sc.getRealPath("/resources/img/community/");
           String genID = UUID.randomUUID().toString();
           String oriName = file[i].getOriginalFilename();
           String img_r = genID+"."+FilenameUtils.getExtension(oriName);
           
           if (i==0) { communityAddDto.setImg_c2("");communityAddDto.setImg_c3(""); communityAddDto.setImg_c4(""); communityAddDto.setImg_c5("");} 
           else if (i==1) { communityAddDto.setImg_c3(""); communityAddDto.setImg_c4(""); communityAddDto.setImg_c5(""); }
           else if (i==2) { communityAddDto.setImg_c4(""); communityAddDto.setImg_c5(""); }
           else if (i==3) { communityAddDto.setImg_c5(""); }
           
           if (i==0) { communityAddDto.setImg_c1(img_r); } 
           else if (i==1) { communityAddDto.setImg_c2(img_r); }
           else if (i==2) { communityAddDto.setImg_c3(img_r); }
           else if (i==3) { communityAddDto.setImg_c4(img_r); }
           else if (i==4) { communityAddDto.setImg_c5(img_r); }
           
           File oldProfFile = new File(realPath + file[i].getOriginalFilename());	// 업로드한 파일이 실제로 저장되는 위치  + 파일명 (확장자 포함) => 실행 디렉토리
   	    File newProfFile = new File(realPath + img_r);
   	    oldProfFile.renameTo(newProfFile);	// 파일명 변경
   	  
//   	  System.out.println("-----------완성 파일명 : "+ img_r);
   	  try {
   			// 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
   			InputStream fileStream = file[i].getInputStream();
   			FileUtils.copyInputStreamToFile(fileStream, newProfFile);
   		} catch (Exception e) {
   			FileUtils.deleteQuietly(newProfFile);
   			e.printStackTrace();
   		}
       }

      model.addAttribute("communityAdd",communityAddDto);   
      communityService.communityAdd(communityAddDto);
      
      String cateName = communityService.communityCateName(cateCode);
		//System.out.println("cateName=" + cateName);
      communityAddDto.setCateName(cateName);
		//RehomeAddDTO catNameSet = rehomeAddDTO;
      communityService.communityCateUpdate(communityAddDto);
		
		return "community/communityAddPost";
	}
	
	@GetMapping("/poom/community/update")
	public String communityUpdate(@RequestParam("bno") int bno, Model model ) {
		model.addAttribute("communityGetOne",communityService.communityGetOne(bno));
		
		return "community/communityUpdate";
	}
	
	
	@PostMapping("/poom/community/update")
	public String communityUpdatePost(@RequestParam("file1")MultipartFile mf1,@RequestParam("file2")MultipartFile mf2,
			@RequestParam("file3")MultipartFile mf3,@RequestParam("file4")MultipartFile mf4,
			@RequestParam("file5")MultipartFile mf5,Model model, CommunityUpdateDTO communityUpdateDTO) {

		String oldfile1=communityUpdateDTO.getImg_c1();
		String oldfile2=communityUpdateDTO.getImg_c2();
		String oldfile3=communityUpdateDTO.getImg_c3();
		String oldfile4=communityUpdateDTO.getImg_c4();
		String oldfile5=communityUpdateDTO.getImg_c5();

		System.out.println("--------------------------------------------------------");
		System.out.println("set1 = " + oldfile1);
		System.out.println("set2 = " + oldfile2);
		System.out.println("set3 = " + oldfile3);
		System.out.println("set4 = " + oldfile4);
		System.out.println("set5 = " + oldfile5);

		String realPath = sc.getRealPath("/resources/img/community/");
		String genID1 = UUID.randomUUID().toString();
		String genID2 = UUID.randomUUID().toString();
		String genID3 = UUID.randomUUID().toString();
		String genID4 = UUID.randomUUID().toString();
		String genID5 = UUID.randomUUID().toString();

		String oriName1 = mf1.getOriginalFilename();
		String img_c1 = genID1+"."+FilenameUtils.getExtension(oriName1);
		String oriName2 = mf2.getOriginalFilename();
		String img_c2 = genID2+"."+FilenameUtils.getExtension(oriName2);
		String oriName3 = mf3.getOriginalFilename();
		String img_c3 = genID3+"."+FilenameUtils.getExtension(oriName3);
		String oriName4 = mf4.getOriginalFilename();
		String img_c4 = genID4+"."+FilenameUtils.getExtension(oriName4);
		String oriName5 = mf5.getOriginalFilename();
		String img_c5 = genID5+"."+FilenameUtils.getExtension(oriName5);

		if (mf1.isEmpty()) {communityUpdateDTO.setImg_c1(oldfile1);}
		else {communityUpdateDTO.setImg_c1(img_c1);
		System.out.println("img_r1 = "+img_c1);}
		if (mf2.isEmpty()) {communityUpdateDTO.setImg_c2(oldfile2);}
		else {communityUpdateDTO.setImg_c2(img_c2);
		System.out.println("img_r2 = "+img_c2);}
		if (mf3.isEmpty()) {communityUpdateDTO.setImg_c3(oldfile3);}
		else {communityUpdateDTO.setImg_c3(img_c3);
		System.out.println("img_r3 = "+img_c3);}
		if (mf4.isEmpty()) {communityUpdateDTO.setImg_c4(oldfile4);}
		else {communityUpdateDTO.setImg_c4(img_c4);
		System.out.println("img_r4 = "+img_c4);}
		if (mf5.isEmpty()) {communityUpdateDTO.setImg_c5(oldfile5);}
		else {communityUpdateDTO.setImg_c5(img_c5);
		System.out.println("img_r5 = "+img_c5);}

		File oldProfFile1 = new File(realPath + mf1.getOriginalFilename());	// 업로드한 파일이 실제로 저장되는 위치  + 파일명 (확장자 포함) => 실행 디렉토리
		File newProfFile1 = new File(realPath + img_c1);
		oldProfFile1.renameTo(newProfFile1);	// 파일명 변경

		File oldProfFile2 = new File(realPath + mf2.getOriginalFilename());	// 업로드한 파일이 실제로 저장되는 위치  + 파일명 (확장자 포함) => 실행 디렉토리
		File newProfFile2 = new File(realPath + img_c2);
		oldProfFile2.renameTo(newProfFile2);	// 파일명 변경

		File oldProfFile3 = new File(realPath + mf3.getOriginalFilename());	// 업로드한 파일이 실제로 저장되는 위치  + 파일명 (확장자 포함) => 실행 디렉토리
		File newProfFile3 = new File(realPath + img_c3);
		oldProfFile3.renameTo(newProfFile3);	// 파일명 변경

		File oldProfFile4 = new File(realPath + mf4.getOriginalFilename());	// 업로드한 파일이 실제로 저장되는 위치  + 파일명 (확장자 포함) => 실행 디렉토리
		File newProfFile4 = new File(realPath + img_c4);
		oldProfFile4.renameTo(newProfFile4);	// 파일명 변경

		File oldProfFile5 = new File(realPath + mf5.getOriginalFilename());	// 업로드한 파일이 실제로 저장되는 위치  + 파일명 (확장자 포함) => 실행 디렉토리
		File newProfFile5 = new File(realPath + img_c5);
		oldProfFile5.renameTo(newProfFile5);	// 파일명 변경

		//   	  System.out.println("-----------완성 파일명 : "+ img_r);
		try {
			// 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
			InputStream fileStream1 = mf1.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream1, newProfFile1);
		} catch (Exception e) {
			FileUtils.deleteQuietly(newProfFile1);
			e.printStackTrace();
		}

		try {
			// 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
			InputStream fileStream2 = mf2.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream2, newProfFile2);
		} catch (Exception e) {
			FileUtils.deleteQuietly(newProfFile2);
			e.printStackTrace();
		}

		try {
			// 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
			InputStream fileStream3 = mf3.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream3, newProfFile3);
		} catch (Exception e) {
			FileUtils.deleteQuietly(newProfFile3);
			e.printStackTrace();
		}
		try {
			// 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
			InputStream fileStream4 = mf4.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream4, newProfFile4);
		} catch (Exception e) {
			FileUtils.deleteQuietly(newProfFile4);
			e.printStackTrace();
		}

		try {
			// 소스 디렉토리에 저장된 파일을 실행 디렉토리에 복사하라는 명령?
			InputStream fileStream5 = mf5.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream5, newProfFile5);
		} catch (Exception e) {
			FileUtils.deleteQuietly(newProfFile5);
			e.printStackTrace();
		}


		model.addAttribute("communityUpdate",communityService.communityUpdate(communityUpdateDTO));
		model.addAttribute("communityUpdate1",communityService.communityUpdate1(communityUpdateDTO));


		return "community/communityUpdatePost";
	}
	
	@GetMapping("/poom/community/delete")
	public String communityDelete(@RequestParam("bno")int bno,Model model ) {
		
		model.addAttribute("bno",bno);
		
		return "community/communityDelete";
	}
	
	
	@PostMapping("/poom/community/delete")
	public String communityDeletePost(@RequestParam("bno")int bno) throws Exception {
		communityService.communityDelete(bno);
		
		return "redirect:/poom/community/list";
	}
	
	
	

}
