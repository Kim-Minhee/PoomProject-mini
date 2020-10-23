package com.hk.poom.dto;

import java.util.Date;

public class CommunityListDTO {

	//글 유형
	String cateName;
	//소통 카테고리
	String cateCode;
	//소통
		String cateCodeRef;
	//게시글 번호
	int bno;   
	//소통글번호 
	int cno;	   
	// 제목 
	String title;          
	//게시글작성자 
	String id_writer;  
	//작성일 
	Date mod_date_b;      
	//사진유무체크 
	boolean img_chk;      
	//리플갯수 
	int replyCnt;     
	//조회수   	
	int viewCnt;
	//추천수
	int likeCnt;
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId_writer() {
		return id_writer;
	}
	public void setId_writer(String id_writer) {
		this.id_writer = id_writer;
	}
	public Date getMod_date_b() {
		return mod_date_b;
	}
	public void setMod_date_b(Date mod_date_b) {
		this.mod_date_b = mod_date_b;
	}
	public boolean isImg_chk() {
		return img_chk;
	}
	public void setImg_chk(boolean img_chk) {
		this.img_chk = img_chk;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	@Override
	public String toString() {
		return "CommunityListDTO [cateName=" + cateName + ", cateCode=" + cateCode + ", cateCodeRef=" + cateCodeRef
				+ ", bno=" + bno + ", cno=" + cno + ", title=" + title + ", id_writer=" + id_writer + ", mod_date_b="
				+ mod_date_b + ", img_chk=" + img_chk + ", replyCnt=" + replyCnt + ", viewCnt=" + viewCnt + ", likeCnt="
				+ likeCnt + "]";
	}

	
}