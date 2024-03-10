<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Note Taker : Add Note</title>
<%@include file="bootstrap_js_css.jsp"%>
</head>
<body>

	<%
		request.setAttribute("parent_page", "add_note");
	%>

	<!-- navbar -->
	<%@include file="navbar.jsp"%>

	<div class="container mt-3">

		<h1>Please fill your note details :-</h1>
	
		<form class="mt-5" action="saveNoteServlet" method="post">
		
			<div class="mb-3">
				<label for="title" class="form-label fw-bold">Note Title</label>
				<input type="text" class="form-control" id="title" 
					name="title" placeholder="enter your note title here" required>
	
			</div>
			
			<div class="mb-3">
				<label for="content" class="form-label fw-bold">Note Content</label>
				<textarea class="form-control" id="content" style="height:300px;" 
					name="content" placeholder="enter your content here" required></textarea>
			</div>
			
			<div class="container text-center">
				<button type="submit" class="btn btn-lg btn-primary"><i class="bi bi-file-earmark-plus"></i> &nbsp; Add</button>
			</div>
			
		</form>
	
	</div>
</body>

<%@include file="common_js.jsp"%>

</html>