package com.hk.poom.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.hk.poom.dto.FindIdDTO;
import com.hk.poom.dto.FindPwdDTO;
import com.hk.poom.dto.LoginDTO;
import com.hk.poom.dto.ProfUploadDTO;
import com.hk.poom.dto.RegisterComDTO;
import com.hk.poom.dto.RegisterPerDTO;
import com.hk.poom.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired 
	MemberMapper memberMapper;
	
	@Autowired
	DataSourceTransactionManager transactionManager;	

	public LoginDTO memberLogin( LoginDTO loginDTO ) {
		return memberMapper.memberLogin( loginDTO );
	}
	
	public LoginDTO memberLoginKakao( int mno ) {
		return memberMapper.memberLoginKakao( mno );
	}
	
	public String profGet( int mno ) {
		return memberMapper.profGet( mno );
	}

	public int memberRegisterPer( RegisterPerDTO registerPerDTO ) {
		int retVal = memberMapper.memberRegisterPer( registerPerDTO );
		return retVal;
	}
	
	public int memberRegisterCom( RegisterComDTO registerComDTO ) {
		int retVal = memberMapper.memberRegisterCom( registerComDTO );
		return retVal;
	}

	public LoginDTO idDupChk( String id ) {
		return memberMapper.idDupChk( id );
	}
	
	public LoginDTO emailDupChk( String email ) {
		return memberMapper.emailDupChk( email );
	}
	
	public int mnoCheck() {
		return memberMapper.mnoCheck();
	}

	public FindIdDTO memberFindId( FindIdDTO findIdDTO ) {
		return memberMapper.memberFindId( findIdDTO );
	}
	
	public FindPwdDTO memberFindPwd( FindPwdDTO findPwdDTO ) {
		return memberMapper.memberFindPwd( findPwdDTO );
	}
	
	public int memberPwdUpdate( FindPwdDTO findPwdDTO ) {
		
		return memberMapper.memberPwdUpdate( findPwdDTO );
	}
	
	public int profUpload( ProfUploadDTO profUploadDTO ) {
		int retVal = memberMapper.profUpload( profUploadDTO );
		return retVal;
	}
	
	public int brnUpload( ProfUploadDTO profUploadDTO ) {
		int retVal = memberMapper.brnUpload( profUploadDTO );
		return retVal;
	}
	
//	@Transactional
//	public int method( Parameter parameter ) { 
//		TransactionStatus txStatus = transactionManager.getTransaction( new DefaultTransactionDefinition() );
//		try { 
//			Mapper.method( parameter );
//		} catch (Exception e) { 
//			transactionManager.rollback(txStatus);
//			return 0;
//		}
//		transactionManager.commit( txStatus );
//		return 1;
//	}
	@Transactional
	public int memberDelete( int type_m, int mno ) {
		TransactionStatus txStatus = transactionManager.getTransaction( new DefaultTransactionDefinition() );
		int retVal1;
		int retVal2;
		try {
			retVal1 = memberMapper.memberDelete( mno );
			if ( type_m==1 ) {	// 개인 회원 탈퇴
				retVal2 = memberMapper.memberDeletePer( mno );
			} else if ( type_m==2 ) {	// 업체 회원 탈퇴
				retVal2 = memberMapper.memberDeleteCom( mno );
			} else {	// 그 외 오류...?
				retVal2 = -1;
			}
		} catch (Exception e) { 
			transactionManager.rollback(txStatus);
			return 0;
		}
		transactionManager.commit( txStatus );
		return (retVal1 + retVal2);
	}

}
