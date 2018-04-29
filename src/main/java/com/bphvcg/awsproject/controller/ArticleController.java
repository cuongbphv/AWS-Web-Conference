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

import com.bphvcg.awsproject.Quickstart;
import com.bphvcg.awsproject.model.Article;
import com.bphvcg.awsproject.model.User;
import com.bphvcg.awsproject.service.ArticleService;
import com.bphvcg.awsproject.service.UserService;



@Controller
public class ArticleController {
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/new-article")
	public String createArticle(Model m) {
		
		UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    String name = user.getUsername();
	    //User currentUser = userService.findByUsername(name);
	    
	    m.addAttribute("title", "New Article");
		m.addAttribute("username", name);
		
		return "new-article";
	}
	
	@PostMapping("/save-article")
	public String saveArticle(@ModelAttribute Article article, BindingResult bindingResult,Model m) {
		
		if(!article.getTempFile().isEmpty())
		{
			String result = Quickstart.UploadFile(article.getTempFile());
			article.setImg(result);
		}
		else
		{
			int id = article.getId();
			Article atc = articleService.find(id);
			article.setImg(atc.getImg());
		}
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		Date date = new Date();
		article.setDateCreated(timestamp);
	    
		UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    String name = user.getUsername();
	    User currentUser = userService.findByUsername(name);
	    article.setAuthor(currentUser.getDisplayName());
		
		articleService.save(article);
		
		m.addAttribute("article", article);
		
		List<Article> hotlist= articleService.findAll();
		hotlist = hotlist.stream().sorted(((p1,p2) -> p2.getViewCount() - p1.getViewCount())).collect(Collectors.toList());
		hotlist = hotlist.stream().limit(5).collect(Collectors.toList());
		
		m.addAttribute("hotlist", hotlist);
	
		List<Article> recentlist= articleService.findAll();
		recentlist = recentlist.stream().sorted((p1,p2) -> p2.getDateCreated().compareTo(p1.getDateCreated())).collect(Collectors.toList());
		recentlist = recentlist.stream().limit(5).collect(Collectors.toList());
		
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
		
	    m.addAttribute("title", article.getTitle());
		
		return "article";
	}
	
	
	@GetMapping("/edit-article")
	public String editArticle(@RequestParam int id, Model m) {
		
		Article article = articleService.find(id);
		m.addAttribute("article", article);
		
		UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    String name = user.getUsername();
		m.addAttribute("username", name);
	    m.addAttribute("title", "Edit Article");
		
		return "new-article";
	}
	
	
	@GetMapping("/delete-article")
	public String deleteArticle(@RequestParam int id, Model m) {
		
		articleService.delete(id);
		
		return "redirect:/list-article-admin";
	}
	
	
	@GetMapping("/article")
	public String article(@RequestParam int id, Model m) {
		Article article = articleService.find(id);
		article.setViewCount(article.getViewCount() + 1);
		articleService.save(article);
		m.addAttribute("article", article);
		
		
		List<Article> hotlist= articleService.findAll();
		hotlist = hotlist.stream().sorted(((p1,p2) -> p2.getViewCount() - p1.getViewCount())).collect(Collectors.toList());
		hotlist = hotlist.stream().limit(5).collect(Collectors.toList());
		
		m.addAttribute("hotlist", hotlist);
	
		List<Article> recentlist= articleService.findAll();
		recentlist = recentlist.stream().sorted((p1,p2) -> p2.getDateCreated().compareTo(p1.getDateCreated())).collect(Collectors.toList());
		recentlist = recentlist.stream().limit(5).collect(Collectors.toList());
		
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
		
	    m.addAttribute("title", article.getTitle());
		
		return "article";
	}
	
	
	@GetMapping("/articles")
	public String articles(Model m) {
		
		List<Article> list= articleService.findAll();
		
		list = list.stream().sorted((p1,p2) -> p2.getDateCreated().compareTo(p1.getDateCreated())).collect(Collectors.toList());
		list = list.stream().collect(Collectors.toList());
		
		m.addAttribute("articles", list);
		
		List<Article> hotlist= articleService.findAll();
		hotlist = hotlist.stream().sorted(((p1,p2) -> p2.getViewCount() - p1.getViewCount())).collect(Collectors.toList());
		hotlist = hotlist.stream().limit(5).collect(Collectors.toList());
		
		m.addAttribute("hotlist", hotlist);
	
		List<Article> recentlist= articleService.findAll();
		recentlist = recentlist.stream().sorted((p1,p2) -> p2.getDateCreated().compareTo(p1.getDateCreated())).collect(Collectors.toList());
		recentlist = recentlist.stream().limit(5).collect(Collectors.toList());
		
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
		
	    m.addAttribute("title", "Lastest Article");
		
		return "articles";
	}
	
	@GetMapping("/hot-articles")
	public String hotArticles(Model m) {
		
		List<Article> list= articleService.findAll();
		
		list = list.stream().sorted(((p1,p2) -> p2.getViewCount() - p1.getViewCount())).collect(Collectors.toList());
		list = list.stream().collect(Collectors.toList());
		
		m.addAttribute("articles", list);
		
		List<Article> hotlist= articleService.findAll();
		hotlist = hotlist.stream().sorted(((p1,p2) -> p2.getViewCount() - p1.getViewCount())).collect(Collectors.toList());
		hotlist = hotlist.stream().limit(5).collect(Collectors.toList());
		
		m.addAttribute("hotlist", hotlist);
	
		List<Article> recentlist= articleService.findAll();
		recentlist = recentlist.stream().sorted((p1,p2) -> p2.getDateCreated().compareTo(p1.getDateCreated())).collect(Collectors.toList());
		recentlist = recentlist.stream().limit(5).collect(Collectors.toList());
		
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
		
	    m.addAttribute("title", "Hot Article");
		
		return "articles";
	}
	
	
}
