package com.bphvcg.awsproject.controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bphvcg.awsproject.Quickstart;
import com.bphvcg.awsproject.model.Article;
import com.bphvcg.awsproject.model.DefaultPage;
import com.bphvcg.awsproject.service.ArticleService;
import com.bphvcg.awsproject.service.DefaultPageService;


@Controller
public class MainController {

	@Autowired
	private ArticleService articleService;
	@Autowired
	private DefaultPageService defaultService;
	
	@GetMapping("/")
	public String home(Model m) {
		
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
		
		DefaultPage page = defaultService.find(1);
		
		m.addAttribute("defaultPage", page);
		
		m.addAttribute("title", "Home");
		
		return "home";
		
	}
	
	@GetMapping("/admin")
	public String admin(Model m) {
		
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    String name = user.getUsername(); //get logged in username
			
	    m.addAttribute("username", name);
	    m.addAttribute("title", "Admin");
		
		return "admin";
		
	}
	
	
	@PostMapping("/upload-file")
	@ResponseBody
	public String saveNews(@RequestParam("file") MultipartFile file,Model m) throws IOException {

		try {
		String result = Quickstart.UploadFile(file);
		return result;
		}
		catch(Exception ex){
			return "failed";
		}
	}
	
}
