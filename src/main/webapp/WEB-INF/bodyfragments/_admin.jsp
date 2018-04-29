<%@ page contentType="text/html; charset=UTF-8"%>


<div id="post-news" class="col-md-10 well slideItem" style="display: none;">



	<form method="POST" action="save-article">

		<div class="col-md-9 col-md-offset-1">

			<input type="hidden" value="${article.id }" name="id" />
			<div class="form-group">
				<label for="title">Tiêu đề:</label> <input class="form-control"
					type="text" value="${article.title }" name="title"
					placeholder="Nhập tiêu đề..." />
			</div>

			<div class="form-group">
				<label for="shortDescription">Mô tả tóm tắt nội dung:</label>
				<textarea name="shortDescription"  class="form-control" style="line-height:160%;" rows="3" placeholder="Tóm tắt nội dung..."></textarea>
			</div>

			<div class="form-group">
				<label for="content">Nội dung bài viết:</label>
				<textarea id="myTextarea" width="100%" value="${article.content }"
					name="content"></textarea>
			</div>
			
			
			<input type="submit" />
		</div>
	</form>


</div>


<div id="home" class="col-md-10 well slideItem" >
	<ul class="list-features">
		<h3>Chi tiết các chức năng:</h3>
		<li><a href="/list-article-admin">Xem danh sách tin tức</a></li>
		<li><a href="/new-article">Đăng tin tức mới</a></li>
		<li><a href="/list-default-admin">Xem danh sách web
				pages</a></li>
	</ul>
</div>
<div id="refresh" class="col-md-10 well slideItem" style="display: none;">
	<ul class="list-features">
		<h3>Chi tiết các chức năng:</h3>
		<li><a href="/list-article-admin">Xem danh sách tin tức</a></li>
		<li><a href="/new-article">Đăng tin tức mới</a></li>
		<li><a href="/list-default-admin">Xem danh sách web
				pages</a></li>
	</ul>
</div>

<div id="news" class="col-md-10 well slideItem" style="display: none;">
	<input type="text" class="col-md-5 input-style"
		placeholder="Nhập thông tin tìm kiếm" required />
	<button class="btn btn-style">
		<img src="img/icon/search.png" alt="No-image">
	</button>
	<button onclick="show('post-news');" class="btn btn-style"
		style="float: right;">
		<img src="img/icon/post.png" alt="No-image">
	</button>
	<table id="list-news-table" class="table table-bordered table-hover">
		<thead>
			<tr>
				<th class="col-sm-1">ID</th>
				<th class="col-sm-8">News Title</th>
				<th class="col-sm-2">Upload Date</th>
				<th class="col-sm-1"><input id="selectAll" type="checkbox"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>Anna</td>
				<td>11/03/2018</td>
				<td><input type="checkbox"></td>
			</tr>
			<tr>
				<td>2</td>
				<td>Debbie</td>
				<td>11/03/2018</td>
				<td><input type="checkbox"></td>
			</tr>
			<tr>
				<td>3</td>
				<td>John</td>
				<td>11/03/2018</td>
				<td><input type="checkbox"></td>
			</tr>
		</tbody>
	</table>
</div>


<div id="delete-news" class="col-md-10 well slideItem" style="display: none;">

</div>

<div id="list-menu" class="col-md-10 well slideItem" style="display: none;">
	<ul class="nav">
		<li>
			<div class="row">
				<a href="#">Home</a>
				<button class="btn btn-danger show-btn" style="float: right;">Delete</button>
				<button class="btn btn-info show-btn" style="float: right;">Edit</button>
			</div>
		</li>
		<li>
			<div class="row">
				<a href="#">Keynote Speakers</a>
				<button class="btn btn-danger show-btn" style="float: right;">Delete</button>
				<button class="btn btn-info show-btn" style="float: right;">Edit</button>
			</div>
		</li>
		<li>
			<div class="row">
				<a href="#news" class="toggle-custom" id="btn-listmenu"
					data-toggle="collapse" data-target="#listmenu" aria-expanded="true">About</a>
				<button class="btn btn-danger show-btn" style="float: right;">Delete</button>
				<button class="btn btn-info show-btn" style="float: right;">Edit</button>
			</div>
			<ul class="nav collapse" id="listmenu" role="menu"
				aria-labelledby="btn-listmenu">
				<li>
					<div class="row">
						<a href="#">ICSSE</a>
						<button class="btn btn-danger show-btn" style="float: right;">Delete</button>
						<button class="btn btn-info show-btn" style="float: right;">Edit</button>
					</div>
				</li>
				<li>
					<div class="row">
						<a href="#">HCMUTE</a>
						<button class="btn btn-danger show-btn" style="float: right;">Delete</button>
						<button class="btn btn-info show-btn" style="float: right;">Edit</button>
					</div>
				</li>
				<li>
					<div class="row">
						<a href="#">COMMITTEES</a>
						<button class="btn btn-danger show-btn" style="float: right;">Delete</button>
						<button class="btn btn-info show-btn" style="float: right;">Edit</button>
					</div>
				</li>
			</ul>
		</li>
	</ul>
</div>

