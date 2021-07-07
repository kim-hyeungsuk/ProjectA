package org.kosta.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.model.mapper.MemberMapper;
import org.kosta.model.mapper.PostMapper;
import org.kosta.model.service.ProductService;
import org.kosta.model.vo.PostVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {

	@Resource
	private PostMapper postMapper;
	
	@Resource
	private ProductService productService;
	

	@RequestMapping("/product")
	public String getDetailProduct(String productNo, Model model) {
		return "";
	}

	@RequestMapping("/user/showAll")
	public String showAll(Model model) {
		model.addAttribute("postVOList", productService.showAll());
		System.out.println("쇼올");
		return "member/showAll.tiles";
	}
	@RequestMapping("addCart")
	public String addCart(String productNo, Model model) {
//		model.addAttribute("postVO",postMapper.addCart(productNo, memberId)); 
		System.out.println("picked");
		return "member/productDetails.tiles";
		
	}
	@RequestMapping("productUpload")
	public String productUpload() {
		
		return "member/productUpload.tiles";
	}

	//@PostMapping("/user/productUpload2")
	//@RequestMapping("/user/productUpload2")
	@RequestMapping("productUpload2")
	public String productUpload2(HttpServletRequest request , @RequestParam("filename") MultipartFile mFile){
		
		System.out.println("oo");
		try {
			mFile.transferTo(new File("c:/kosta215/"+mFile.getOriginalFilename()));
			System.out.println("dd");
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		return "member/productUpload_ok.tiles";
		//return "redirect:productUpload_ok";
	}
	
	@RequestMapping("productUpload_ok")
	public String productUpload_ok() {
	
		return "member/productUpload_ok.tiles";
	}
	
}
