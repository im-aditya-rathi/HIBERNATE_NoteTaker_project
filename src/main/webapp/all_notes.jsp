<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Note Taker : All Notes</title>
<%@include file="bootstrap_js_css.jsp"%>
</head>
<body>
	
	<%
		String search = request.getParameter("search");
		String popupMsg = (String)request.getAttribute("popup_msg");
		request.setAttribute("parent_page", "all_notes");
		request.setAttribute("search_text", search);
	
		Session s = FactoryProvider.getFactory().openSession();
		Query q = s.createQuery("from Note");
		List<Note> notes = q.list();
		s.close();
		
		List<Note> searchNotes = new ArrayList();
		int notesSize = notes.size();
		
		if(search != null) {
			search = search.trim();
			if(!search.isEmpty()) {
				Iterator<Note> iterator = notes.iterator();
			    while (iterator.hasNext()) {
			        Note note = iterator.next();
			        if (!(note.getTitle().contains(search) || note.getContent().contains(search))) {
			            iterator.remove();
			        }
			    }
				notesSize = notes.size();
			}
		}
	%>
	
	<!-- navbar -->
	<%@include file="navbar.jsp"%>

	<div class="container position-relative">

		<%
			if(popupMsg!=null && !popupMsg.isEmpty()) {
				if(popupMsg.equalsIgnoreCase("noteAdded")) {
		%>
				<!-- // Added note info msg -->
				<div class="d-flex justify-content-center position-absolute top-0 start-50 translate-middle">	
					<div class="alert alert-success d-flex align-items-center  justify-content-between" role="alert">
					  <div>
					  	<i class="bi bi-patch-check-fill" style="font-size: 1.2rem;"></i> &nbsp;Note is added successfully !!
					  </div>
					  <button type="button" class="btn-close ms-2" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
				</div>
		<%
				}
			}
		%>

		<div class="row">
			<h1 class="text-uppercase col-6 mt-3">
			<%
				if(search == null || search.isEmpty()) {
			%>
				all notes :
			<%
				} else {
			%>
				Search result :
			<%
				}
			%>
			(<%= notesSize %>)</h1>
			
			<div class="text-end col-6">
				<button type="button" class="btn btn-lg btn-primary mt-3">
			    	<a href="add_notes.jsp" class="text-decoration-none text-reset"><i class="bi bi-clipboard-data"></i> &nbsp; Add Note</a>
			    </button>
			</div>
		</div>
		
		<%
			if(notesSize == 0) {
		%>
				<%@include file="no_note_present.jsp" %>
		<%
			}
		%>

		<!-- // card design -->
		<div class="row row-cols-md-2 my-4 g-4">
		
			<%
				for (Note note : notes) {
			%>
		
			<div class="col">
			  <div class="card shadow-lg p-3 mb-5 bg-body rounded">
			    <div class="card-header bg-white d-flex w-100 justify-content-between">
			      <div>
			        <h5><%= note.getTitle() %> <span class="text-muted ps-2">(<%= note.getId() %>)</span> </h5> 
			      </div>
			      <div>
			      	<small class="text-muted"><i>created at: <%= note.getCreatedDate() %></i></small>
			      </div>
			    </div>
			    <div class="card-body" style="height: 250px;">
			      <pre class="card-text h-100"><%= note.getContent() %></pre>
			    </div>
			    <div class="card-footer bg-white d-flex w-100 justify-content-between">
			      <div class="buttons">
			      	<a href="deleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger me-2"><i class="bi bi-trash-fill"></i> Delete</a>
			      	<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-success"><i class="bi bi-pencil-square"></i> Edit</a>
			      </div>
			      
			      <%
			      	if(! note.getCreatedDate().equals(note.getModifiedDate())) {
			      %>
				      <div class="text-end">
				      	<small class="text-muted">edited at: </small> <small><%= note.getModifiedDate() %></small>
				      </div>
			      <%
			      	}
			      %>
			      
			    </div>
			  </div>
			</div>
			
			<%
				}
				s.close();
			%>
			
		</div>

	</div>
	
</body>

<%@include file="common_js.jsp"%>

</html>