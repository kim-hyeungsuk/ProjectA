package org.kosta.model.service;

import java.util.List;

import org.kosta.model.vo.PagingBeanMain;
import org.kosta.model.vo.PostVO;
import org.kosta.model.vo.QnAVO;

public interface ProductService {

	List<PostVO> showAll(PagingBeanMain pagingBean);

	PostVO getproductDetails(String productNo);
	
	List<PostVO>  searchByTitle(String title);

	void registerProduct(PostVO pvo);

	void registerQuestion(String qnaContent, String memberId, String productNo);

	void registerAnswer(String qnaNo, String qnaContent, String memberId, String productNo);

	List<QnAVO> getQnAList(String productNo);
}
