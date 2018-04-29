<%@ page contentType="text/html; charset=UTF-8" %>
<div class="col-md-9">

<div class="main-title row div-align">
		<h2 style="text-align:center">${defaultPage.header}</h2>
</div>

<div class="main-content">
	${defaultPage.content}
</div>

</div>

<script type="text/javascript">

    (function () {
        $(window).scroll(function () {
            if ($(this).scrollTop() >= 50) {
                $('nav.navbar').addClass('sticky-nav');
            }
            else {
                $('nav.navbar').removeClass('sticky-nav');
            }
        });
    }());

</script>