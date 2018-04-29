package com.bphvcg.awsproject.dao;

import org.springframework.data.repository.CrudRepository;

import com.bphvcg.awsproject.model.Article;
public interface ArticleRepository extends CrudRepository<Article,Integer>{

}
