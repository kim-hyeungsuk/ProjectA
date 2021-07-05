package org.kosta.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.model.vo.PickVO;
import org.kosta.model.vo.PostVO;

@Mapper
public interface PostMapper {
	
	List<PostVO> showAll();

	void registerProduct(PostVO pvo);
	
	PostVO viewDetailPost(String productNo);
	
	PickVO addCart(HashMap<>());
}
