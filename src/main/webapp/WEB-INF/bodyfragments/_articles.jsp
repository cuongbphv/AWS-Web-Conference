<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="col-md-9">
	<div class="main-title row div-align">
		<strong>Danh sách tin tức mới nhất</strong>
	</div>
	
	<c:forEach items="${articles }" var="item">
		<a href="/article?id=${item.id }">
		<div class="list-news row">
			<img style="width:180px; height:180px; padding:0px 0px 20px 0px" class="col-md-3" src="${item.img }"
				alt="No-image">
			<h3 class="col-md-9">${item.title }</h3>
			<h5 class="col-md-9">${item.shortDescription }</h5>
			<h5 class="col-md-9 news-date" style="padding-right:50px;">Ngày đăng : <fmt:formatDate value="${item.dateCreated}" pattern="dd-MM-yyyy HH:mm" /> 
														bởi ${item.author} </h5>
			<hr />
		</div>
		</a>
	</c:forEach>

</div>