package com.bphvcg.awsproject.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.bphvcg.awsproject.dao.DefaultPageRepository;
import com.bphvcg.awsproject.model.DefaultPage;


@Service
@Transactional
public class DefaultPageService {

	private final DefaultPageRepository defaultPageRepository;

	public DefaultPageService(DefaultPageRepository defaultPageRepository) {
		this.defaultPageRepository = defaultPageRepository;
	}
	
	public List<DefaultPage> findAll(){
		
		List<DefaultPage> pages = new ArrayList<>();
		for(DefaultPage page : defaultPageRepository.findAll()) {
			pages.add(page);
		}
		
		return pages;
	
	}
	
	public DefaultPage find(int id) {
		return defaultPageRepository.findById(id).get();
	}
	
	public void save(DefaultPage page) {
		defaultPageRepository.save(page);
	}
	
	public void delete(int id) {
		defaultPageRepository.deleteById(id);
	}
	

}
