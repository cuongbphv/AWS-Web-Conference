package com.bphvcg.awsproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bphvcg.awsproject.model.Article;
import com.bphvcg.awsproject.model.DefaultPage;
import com.bphvcg.awsproject.service.ArticleService;
import com.bphvcg.awsproject.service.DefaultPageService;



@Controller
public class AdminController {

	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private DefaultPageService defaultPageService;
    
	@GetMapping("/list-article-admin")
	public String listArticle(Model m) {
	    
		List<Article> list= articleService.findAll();
		
		m.addAttribute("articles", list);
		
		UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    String name = user.getUsername();
		m.addAttribute("username",name);
		
		m.addAttribute("title", "List Article");
		
		return "list-article-admin";
	}
	
	
	@GetMapping("/list-default-admin")
	public String listDefault(Model m) {
	    
		List<DefaultPage> list= defaultPageService.findAll();
		
		m.addAttribute("defaults", list);
		
		UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    String name = user.getUsername();
		m.addAttribute("username",name);
		
		m.addAttribute("title", "List Default Page");
		
		return "list-default-admin";
	}
	
}
