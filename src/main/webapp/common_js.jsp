<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	String parentPage = (String)request.getAttribute("parent_page");
	String searchText = (String)request.getAttribute("search_text");
%>
    
<script type="text/javascript">
 	<%
		if(parentPage!=null && !parentPage.isEmpty()) {
	%>
			var activeTab = document.getElementById("<%= parentPage %>");
			activeTab.classList.add("active");
	<%
		}
		if(searchText!=null && !searchText.isEmpty()) {
	%>
			var searchBox = document.getElementById("search_box");
			searchBox.value = "<%= searchText %>";
	<%
		}
	%>
			
</script>