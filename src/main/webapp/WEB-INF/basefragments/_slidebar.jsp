<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-md-3 div-align">
	<address>		
		<div class="modal">
		  <div class="modal-content">
		    <div class="modal-header">
		      <strong style="color:white">Tin tức nổi bật </strong> <a href="/hot-articles"><img
					class="edit-more" src="img/icon/arrow-right.png" alt="no-image" /></a>
		    </div>
		    <div class="modal-body">
		      <c:forEach items="${hotlist }" var ="item">
			<div class=" main-alink row">
				<a href="/article?id=${item.id }"><img src="img/icon/sticker.png" alt="No image"/> ${item.title }</a>
			</div>
			</c:forEach>
		    </div>
		  </div>
		
		</div>
		
		<div class="modal">
		  <div class="modal-content">
		    <div class="modal-header">
		      <strong style="color:white">Tin tức gần đây </strong> <a href="/articles"><img
					class="edit-more" src="img/icon/arrow-right.png" alt="no-image" /></a>
		    </div>
		    <div class="modal-body">
			     <c:forEach items="${recentlist }" var ="item">
					<div class="row">
							<a href="/article?id=${item.id }"><img src="img/icon/new.png" alt="No image"/> ${item.title }</a>
					</div>
				</c:forEach>
		    </div>
		  </div>
		
		</div>
	</address>
</div>