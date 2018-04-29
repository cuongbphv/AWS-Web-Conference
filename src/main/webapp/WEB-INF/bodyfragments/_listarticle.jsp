<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div id="news" class="col-md-10 well slideItem">
	<input type="text" class="col-md-5 input-style"
		placeholder="Nhập thông tin tìm kiếm" required />
	<button class="btn btn-style">
		<img src="img/icon/search.png" alt="No-image">
	</button>
	<button class="btn btn-style"
		style="float: right;"><a href="${contextPath}/new-article">
		<img src="img/icon/post.png" alt="No-image"></a>
	</button>
	<table id="list-news-table" class="table table-bordered table-hover">
		<thead>
			<tr>
				<th class="col-sm-1">ID</th>
				<th class="col-sm-4">News Title</th>
				<th class="col-sm-2">Upload Date</th>
				<th class="col-sm-1">Author</th>
				<th class="col-sm-1">View Count</th>
				<th class="col-sm-1">View</th>
				<th class="col-sm-1">Edit</th>
				<th class="col-sm-1">Delete</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach var="item" items="${articles }">
			<tr>
				<td>${item.id }</td>
				<td>${item.title }</td>
				<td><fmt:formatDate value="${item.dateCreated}" pattern="dd-MM-yyyy HH:mm" /></td>
				<td>${item.author } </td>
				<td>${item.viewCount}</td>
				<td><a href="/article?id=${item.id }"><button type="button" class="btn btn-info">View</button></a></td>
				<td><a href="/edit-article?id=${item.id }"><button type="button" class="btn btn-warning">Edit</button></a></td>
				<td><a href="/delete-article?id=${item.id }"><button type="button" class="btn btn-danger">Delete</button></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
