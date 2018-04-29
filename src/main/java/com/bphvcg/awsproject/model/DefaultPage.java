package com.bphvcg.awsproject.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name= "defaultpage")
public class DefaultPage implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String header;
	private String content;
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastModified;
	private String lastAuthor;
	
	public DefaultPage() {
		
	}
	
	

	public DefaultPage(int id, String name, String header, String content, Date lastModified, String lastAuthor) {
		super();
		this.id = id;
		this.name = name;
		this.header = header;
		this.content = content;
		this.lastModified = lastModified;
		this.lastAuthor = lastAuthor;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}



	public Date getLastModified() {
		return lastModified;
	}



	public void setLastModified(Date lastModified) {
		this.lastModified = lastModified;
	}



	public String getLastAuthor() {
		return lastAuthor;
	}



	public void setLastAuthor(String lastAuthor) {
		this.lastAuthor = lastAuthor;
	}
	
	
	
}
