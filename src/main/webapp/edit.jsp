<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Note Taker : Edit Note</title>
<%@include file="bootstrap_js_css.jsp"%>
</head>
<body>

	<%
		request.setAttribute("parent_page", "all_notes");
	%>

	<!-- navbar -->
	<%@include file="navbar.jsp"%>
	
	<div class="container mt-3">
		<h1>Edit your note</h1>
		
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session s = FactoryProvider.getFactory().openSession();
			Note note = s.get(Note.class, noteId);
			String title = null;
			String content = null;
			if(note != null) {
				title = note.getTitle();
				content = note.getContent();
			}
		%>
		
		<form class="mt-5" action="updateServlet" method="post">
		
			<div class="mb-3">
				<input type="hidden" name="note_id" value="<%= noteId %>">
			
				<label for="title" class="form-label fw-bold">Note Title</label>
				<input type="text" class="form-control" id="title" 
					name="title" placeholder="enter your note title here" 
					value="<%= title %>" required>
	
			</div>
			
			<div class="mb-3">
				<label for="content" class="form-label fw-bold">Note Content</label>
				<textarea class="form-control" id="content" style="height:300px;" 
					name="content" placeholder="enter your content here" 
					required><%= content %></textarea>
			</div>
			
			<div class="container text-center">
				<button type="submit" class="btn btn-success"><i class="bi bi-floppy-fill"></i> &nbsp; Save</button>
			</div>
			
		</form>
		
	</div>
</body>
</html>