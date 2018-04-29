package com.bphvcg.awsproject.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.bphvcg.awsproject.dao.ArticleRepository;
import com.bphvcg.awsproject.model.Article;



@Service
@Transactional
public class ArticleService {

	private final ArticleRepository newsRepository;

	public ArticleService(ArticleRepository newsRepository) {
		this.newsRepository = newsRepository;
	}
	
	
	public List<Article> findAll(){
		
		List<Article> tasks = new ArrayList<>();
		for(Article task : newsRepository.findAll()) {
			tasks.add(task);
		}
		
		return tasks;
	
	}
	
	public Article find(int id) {
		return newsRepository.findById(id).get();
	}
	
	public void save(Article task) {
		newsRepository.save(task);
	}
	
	public void delete(int id) {
		newsRepository.deleteById(id);
	}
	
}
