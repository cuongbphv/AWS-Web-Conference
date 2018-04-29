package com.bphvcg.awsproject.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bphvcg.awsproject.model.Article;
import com.bphvcg.awsproject.model.DefaultPage;
import com.bphvcg.awsproject.model.User;
import com.bphvcg.awsproject.service.ArticleService;
import com.bphvcg.awsproject.service.DefaultPageService;
import com.bphvcg.awsproject.service.UserService;


@Controller
public class DefaultPageController {

	@Autowired
	private DefaultPageService defaultPageService;
	
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/default")
	public String article(@RequestParam int id, Model m) {
		DefaultPage page = defaultPageService.find(id);
		m.addAttribute("defaultPage", page);
		
		List<Article> hotlist= articleService.findAll();
		hotlist = hotlist.stream().sorted(((p1,p2) -> p2.getViewCount() - p1.getViewCount())).collect(Collectors.toList());
		hotlist = hotlist.stream().limit(5).collect(Collectors.toList());
		
		m.addAttribute("hotlist", hotlist);
	
		List<Article> recentlist= articleService.findAll();
		recentlist = recentlist.stream().sorted((p1,p2) -> p2.getDateCreated().compareTo(p1.getDateCreated())).collect(Collectors.toList());
		recentlist = recentlist.stream().limit(5).collect(Collectors.toList());
		
		m.addAttribute("recentlist", recentlist);
		
		if(page.getName().equals("Home")) {
			m.addAttribute("hotlist", hotlist);
			m.addAttribute("recentlist", recentlist);
			
			// get current user logged in
	        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
	        String username = loggedInUser.getName();
	        
			if(username.equals("anonymousUser")) {	
				m.addAttribute("currentUser", "Login");			
			}
			else {
				m.addAttribute("currentUser", username);
			}
			
		    m.addAttribute("title", page.getHeader());
		    
			return "home";
		}
		
		// get current user logged in
        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
        String username = loggedInUser.getName();
        
		if(username.equals("anonymousUser")) {	
			m.addAttribute("currentUser", "Login");			
		}
		else {
			m.addAttribute("currentUser", username);
		}
		
	    m.addAttribute("title", page.getHeader());
		
		return "default";
	}
	
	
	
	@GetMapping("/edit-default")
	public String editArticle(@RequestParam int id, Model m) {
		
		DefaultPage page = defaultPageService.find(id);
		m.addAttribute("defaultpage", page);
		
		UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    String name = user.getUsername();
		m.addAttribute("username", name);
		
	    m.addAttribute("title", "Edit Default Page");
		
		return "edit-default-page";
	}
	
	@PostMapping("/save-default-page")
	public String saveArticle(@ModelAttribute DefaultPage defaultPage, BindingResult bindingResult,Model m) {
		
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        //System.out.println(timestamp);
		
		
		Date date = new Date();
		
		defaultPage.setLastModified(timestamp);
		
		UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    String name = user.getUsername();
	    User currentUser = userService.findByUsername(name);
	    
	    defaultPage.setLastAuthor(currentUser.getDisplayName());
		
		defaultPageService.save(defaultPage);
		
		
		List<Article> hotlist= articleService.findAll();
		hotlist = hotlist.stream().sorted(((p1,p2) -> p2.getViewCount() - p1.getViewCount())).collect(Collectors.toList());
		hotlist = hotlist.stream().limit(5).collect(Collectors.toList());
		
		m.addAttribute("hotlist", hotlist);
	
		List<Article> recentlist= articleService.findAll();
		recentlist = recentlist.stream().sorted((p1,p2) -> p2.getDateCreated().compareTo(p1.getDateCreated())).collect(Collectors.toList());
		recentlist = recentlist.stream().limit(5).collect(Collectors.toList());
		
		m.addAttribute("recentlist", recentlist);
	    
	    
		m.addAttribute("defaultPage", defaultPage);
		
		// get current user logged in
        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
        String username = loggedInUser.getName();
        
		if(username.equals("anonymousUser")) {	
			m.addAttribute("currentUser", "Login");			
		}
		else {
			m.addAttribute("currentUser", username);
		}
		
	    m.addAttribute("title", defaultPage.getHeader());
		
		return "default";
	}
}
