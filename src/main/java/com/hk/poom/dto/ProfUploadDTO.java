package com.hk.poom.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ProfUploadDTO {

	//회원 번호
	int mno;
	//파일 이름 (prof)
	String dbSaveName;
	//사업자 파일 이름(brn_img)
	String brnName; 
	
	
//	// Getter & Setter
//	public int getMno() {
//		return mno;
//	}
//	public void setMno(int mno) {
//		this.mno = mno;
//	}
//	public String getDbSaveName() {
//		return dbSaveName;
//	}
//	public void setDbSaveName(String dbSaveName) {
//		this.dbSaveName = dbSaveName;
//	}
//	
//	
//	public String getBrnName() {
//		return brnName;
//	}
//	public void setBrnName(String brnName) {
//		this.brnName = brnName;
//	}
//	@Override
//	public String toString() {
//		return "ProfUploadDTO [mno=" + mno + ", dbSaveName=" + dbSaveName + ", brnName=" + brnName + "]";
//	}
//	
	
	
}
