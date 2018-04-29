<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div id="news" class="col-md-10 well slideItem">
	<h3 style="text-align:center">Danh sách webpage mặc định</h3>
	<table id="list-news-table" class="table table-bordered table-hover">
		<thead>
			<tr>
				<th class="col-sm-1">ID</th>
				<th class="col-sm-2">Page Name</th>
				<th class="col-sm-4">Page Header</th>
				<th class="col-sm-3">Last Modified</th>
				<th class="col-sm-1">View</th>
				<th class="col-sm-1">Edit</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach var="item" items="${defaults }">
			<tr>
				<td>${item.id }</td>
				<td>${item.name }</td>
				<td>${item.header }</td>
				<td><fmt:formatDate value="${item.lastModified}" pattern="dd-MM-yyyy HH:mm" /> by ${item.lastAuthor }</td>
				<td><a target="_blank" href="/default?id=${item.id }"><button type="button" class="btn btn-info">View</button></a></td>
				<td><a href="/edit-default?id=${item.id }"><button type="button" class="btn btn-warning">Edit</button></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
