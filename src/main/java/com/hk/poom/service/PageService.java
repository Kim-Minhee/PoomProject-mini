package com.hk.poom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.poom.dto.AdminPayDTO;
import com.hk.poom.dto.CommunityListDTO;
import com.hk.poom.dto.MypageBuyDTO;
import com.hk.poom.dto.MypageChatDTO;
import com.hk.poom.dto.MypageDTO;
import com.hk.poom.dto.MypageLikeDTO;
import com.hk.poom.dto.MypageSaleDTO;
import com.hk.poom.dto.MypageWriteDTO;
import com.hk.poom.dto.OtherpageDTO;
import com.hk.poom.dto.ProfUploadDTO;
import com.hk.poom.dto.RegisterPerDTO;
import com.hk.poom.mapper.PageMapper;

@Service
public class PageService {
	
	@Autowired
	PageMapper pageMapper;
	
	
	public MypageDTO mypagePer( int mno ) {
		 return pageMapper.mypagePer( mno );
	}
	
	public MypageDTO mypageCom( int mno ) {
		 return pageMapper.mypageCom( mno );
	}
	
	public ProfUploadDTO memberFile( int mno ) {
		return pageMapper.memberFile( mno );
	}
	
	public ProfUploadDTO comFile( int mno ) {
		return pageMapper.comFile( mno );
	}
	
	public List<MypageLikeDTO> mypageLikeList(  ) {
		return pageMapper.mypageLikeList(  );
	}
	
	public List<MypageSaleDTO> mypageSaleList( AdminPayDTO adminPayDTO ) {
		return pageMapper.mypageSaleList( adminPayDTO );
	}
	
	public List<MypageBuyDTO> mypageBuyList( AdminPayDTO adminPayDTO ) {
		return pageMapper.mypageBuyList( adminPayDTO );
	}
	
	public List<MypageWriteDTO> mypageWriteList( CommunityListDTO communityListDTO ) {
		return pageMapper.mypageWriteList( communityListDTO );
	}
	
	public List<MypageChatDTO> mypageChatList( MypageChatDTO mypageChatDTO ) {
		return pageMapper.mypageChatList( mypageChatDTO );
	}
	
	public int mypageUpdate( MypageDTO mypageDTO ) {
		return pageMapper.mypageUpdate( mypageDTO );
	}
	
	public int mypageUpdatePer( MypageDTO mypageDTO ) {
		return pageMapper.mypageUpdatePer( mypageDTO );
	}
	
	public int mypageUpdateCom( MypageDTO mypageDTO ) {
		return pageMapper.mypageUpdateCom( mypageDTO );
	}
	
	public OtherpageDTO otherpage( int mno ) {
		return pageMapper.otherpage( mno );
	}
	
}
