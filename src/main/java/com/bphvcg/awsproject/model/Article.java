package com.bphvcg.awsproject.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


@Entity(name= "article")
public class Article implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	private String shortDescription;
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;
	private String content;
	private String img;
	private int viewCount;
	private String author;
	
	@Transient
	private MultipartFile tempFile;
	

	public Article() {
		
	}


	

	public Article(int id, String title, String shortDescription, Date dateCreated, String content, String img, int viewCount, String author) {
		this.id = id;
		this.title = title;
		this.shortDescription = shortDescription;
		this.dateCreated = dateCreated;
		this.content = content;
		this.img = img;
		this.viewCount = viewCount;
		this.author = author;
	}

	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getShortDescription() {
		return shortDescription;
	}



	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}



	public Date getDateCreated() {
		return dateCreated;
	}



	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}	
	
	
	
	
	
	public int getViewCount() {
		return viewCount;
	}




	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}




	public String getAuthor() {
		return author;
	}




	public void setAuthor(String author) {
		this.author = author;
	}




	public MultipartFile getTempFile() {
		return tempFile;
	}

	public void setTempFile(MultipartFile tempFile) {
		this.tempFile = tempFile;
	}
	
}
