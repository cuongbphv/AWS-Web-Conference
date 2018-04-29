<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

		<thead>
			<tr>
				<th class="col-sm-1">ID</th>
				<th class="col-sm-8">News Title</th>
				<th class="col-sm-2">Upload Date</th>
				<th class="col-sm-1"><input id="selectAll" type="checkbox"></th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach var="item" items="${articles }">
			<tr>
				<td>${item.id }</td>
				<td>${item.title }</td>
				<td><fmt:formatDate value="${item.dateCreated}" pattern="dd-MM-yyyy" /></td>
				<td><input type="checkbox"></td>
			</tr>
		</c:forEach>
		</tbody>
