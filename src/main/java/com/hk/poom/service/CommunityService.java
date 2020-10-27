package com.hk.poom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.poom.dto.CategoryDTO;
import com.hk.poom.dto.CommunityAddDTO;
import com.hk.poom.dto.CommunityListDTO;
import com.hk.poom.dto.CommunityReadDTO;
import com.hk.poom.dto.CommunityUpdateDTO;
import com.hk.poom.dto.RehomeAddDTO;
import com.hk.poom.dto.RehomeReportDTO;
import com.hk.poom.mapper.CommunityMapper;

@Service
public class CommunityService {

	@Autowired
	CommunityMapper communityMapper;

	public List<CommunityListDTO> communityList( ) {
		return communityMapper.communityList( );
	}

	public int communityAdd( CommunityAddDTO communityAddDTO ) {
		return communityMapper.communityAdd( communityAddDTO );
	}

	public CommunityUpdateDTO communityGetOne( int bno ) {
		return communityMapper.communityGetOne( bno );
	}
   
	public int communityUpdate( CommunityUpdateDTO communityUpdateDTO ) {
		return communityMapper.communityUpdate( communityUpdateDTO );
	}
	public int communityUpdate1( CommunityUpdateDTO communityUpdateDTO ) {
		return communityMapper.communityUpdate1( communityUpdateDTO );
	}
   
	public int communityDelete( int bno ) {
		return communityMapper.communityDelete( bno );
	}

	public CommunityReadDTO communityRead( int bno ) {
		return communityMapper.communityRead( bno );
	}
	
	public String communityCateName( String cateCode ) {
		return communityMapper.communityCateName( cateCode );				
	}
	
	public int communityCateUpdate(CommunityAddDTO communityAddDTO ) {
		return communityMapper.communityCateUpdate(communityAddDTO);				
	}

	public List<CategoryDTO> category() {
		// TODO Auto-generated method stub
		return communityMapper.category();
	}
	
	public int report( RehomeReportDTO report ) {
		return communityMapper.report(report);			
	}

}
