
<%@ page contentType="text/html; charset=UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<nav>
	<ul class="nav">
		<li><a href="${contextPath}/admin"> <img
				src="img/icon/house.png" alt="No-image" style="padding-right: 8px;">Trang
				chủ
		</a></li>
		<li><a href="${contextPath}/list-article-admin"> <img
				src="img/icon/news.png" alt="No-image" 
				style="padding-right: 8px;">Tin tức</a></li>
		<li><a href="${contextPath}/list-default-admin"> <img
				src="img/icon/webpage.png" alt="No-image"
				style="padding-right: 8px;">Web Page</a></li>
		<!--<li><a href="${contextPath}/list-user-admin""> <img src="img/icon/sidebar.png"
				alt="No-image" style="padding-right: 8px;">Quản trị viên</a></li>-->
	</ul>
</nav>
