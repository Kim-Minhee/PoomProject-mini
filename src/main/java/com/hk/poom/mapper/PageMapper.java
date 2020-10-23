package com.hk.poom.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

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

@Repository
public interface PageMapper {
	
	public MypageDTO mypagePer( int mno );
	public MypageDTO mypageCom( int mno );
	public ProfUploadDTO memberFile( int mno );
	public ProfUploadDTO comFile( int mno );
	public List<MypageLikeDTO> mypageLikeList(  );
	public List<MypageSaleDTO> mypageSaleList( AdminPayDTO adminPayDTO );
	public List<MypageBuyDTO> mypageBuyList( AdminPayDTO adminPayDTO );
	public List<MypageWriteDTO> mypageWriteList( CommunityListDTO communityListDTO );
	public List<MypageChatDTO> mypageChatList( MypageChatDTO mypageChatDTO );
	public int mypageUpdate( MypageDTO mypageDTO );
	public int mypageUpdatePer( MypageDTO mypageDTO );
	public int mypageUpdateCom( MypageDTO mypageDTO );
	public OtherpageDTO otherpage( int mno );
	
}
