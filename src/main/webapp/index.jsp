<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Note Taker : Home</title>
    <%@include file="bootstrap_js_css.jsp" %>
  </head>
  <body>
  		<%
			request.setAttribute("parent_page", "home");
  		%>
	 
		<!-- navbar -->
		<%@include file="navbar.jsp" %>
				
		<div class="container mt-3">
		
			<div class="row mt-5" style="height: 80vh;">
				<div class="col-md-6 p-4 text-center position-relative">
					<img src="./img/note_img.png" alt="Note Taker Logo"
					 class="position-absolute top-50 start-50 translate-middle">
				</div>
				<div class="col-md-6 position-relative">
					<div class="position-absolute top-50 start-50 translate-middle">
						<div class="text-center p-3 mb-5" clasqs="text-center">
						    <button type="button" class="btn btn-lg btn-primary ">
						    	<a href="add_notes.jsp" class="text-decoration-none text-reset"><i class="bi bi-clipboard-data"></i> &nbsp; Add Note</a>
						    </button>
						</div>
						<div class="text-center">
						    <button type="button" class="btn btn-lg btn-outline-primary">
						    	<a href="all_notes.jsp" class="text-decoration-none text-reset"><i class="bi bi-view-stacked"></i> &nbsp; View All Notes</a>
						    </button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
  </body>

  <%@include file="common_js.jsp"%>
  
</html>