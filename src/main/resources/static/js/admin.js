


$(document).ready(function(){
	getListArticle();
});

/* article function */
function getListArticle(){
	
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("list-news-table").innerHTML = this.responseText;
	    }
	  };
	  
	  xhttp.open("GET", "/admin-list-article", true);
	  xhttp.send();
}

/* end of article function */