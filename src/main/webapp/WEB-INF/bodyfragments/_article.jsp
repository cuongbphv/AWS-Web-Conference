<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main-article col-md-9 div-align">

<div class="main-title row">
		<h2 style="font-weight:bold;">${article.title}</h2>
		<h6>Ngày đăng: <fmt:formatDate value="${article.dateCreated}" pattern="dd-MM-yyyy HH:mm" /></h6>
		<img src="/img/icon/news-title.png" alt="no image"/><strong>${article.shortDescription }</strong>
</div>

<div class="main-content">
	${article.content}
</div>

<div class="main-author">
	<h4>${article.author}</h4>
</div>
</div>