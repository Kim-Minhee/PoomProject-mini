package com.hk.poom.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hk.poom.dto.CategoryDTO;
import com.hk.poom.dto.CommunityAddDTO;
import com.hk.poom.dto.CommunityListDTO;
import com.hk.poom.dto.CommunityReadDTO;
import com.hk.poom.dto.CommunityUpdateDTO;

@Repository
public interface CommunityMapper {

	public List<CommunityListDTO> communityList( );
	public int communityAdd( CommunityAddDTO communityAddDTO );
	public CommunityUpdateDTO communityGetOne( int bno );
	public int communityUpdate( CommunityUpdateDTO communityUpdateDTO );
	public int communityDelete( int bno );
	public CommunityReadDTO communityRead( int bno );
	public String communityCateName(String cateCode);
	public int communityCateUpdate(CommunityAddDTO communityAddDTO);
	public List<CategoryDTO> category();
	public int communityUpdate1(CommunityUpdateDTO communityUpdateDTO);

}
