<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.bean.fileUpload"%>
<%@page import="common.ConnectDB" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body class="bg-light">
    <%
    if (session.getAttribute("id") == null) {
      response.sendRedirect("login.jsp");  
    } 
	%>
	<div class="container">
	 <h1>Convert file</h1>
	 <header>
	 <nav class="navbar navbar-expand-lg bg-primary">
             <div class="container-fluid">
               <a class="navbar-brand" style="color : white;" href="HomepageServlet">Homepage</a>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                 <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                   <li class="nav-item">
                     <a class="nav-link active" aria-current="page" style="color : white;" href="MyProfileServlet">Profile</a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link" style="color : white;" href="ConvertfileServlet">History Convert</a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link" style="color : white;" href="GetFileFromQueueServlet">Convert Queue</a>
                   </li>
                   <li class="nav-item">
                     <a class="nav-link" style="color : white;" href="LogoutServlet">Logout</a>
                   </li>
                 </ul>
               </div>
            </div>
          </nav>
        </header>
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<p class="text-center fs-3">PDF Convert</p>
						<table class="table mt-4">
						    <%
						     String msg = (String) session.getAttribute("message");
						     if (msg != null) {
						     %>
						     <h4 class="text-center text-success"><%=msg%></h4>
						     <%
						     session.removeAttribute("message");
						     }
						    %>
			                   <thead>
				                   <tr>
					                   <th class="text-center" scope="col">Id</th>
					                   <th class="text-center" scope="col">File Name</th>
                                       <th class="text-center" scope="col">Download</th>
				                   </tr>
			                   </thead>
			                   <tbody>

				                   <%
				                   List<fileUpload> uploadFiles = (List<fileUpload>) request.getAttribute("fileUploads");
									if (uploadFiles != null && !uploadFiles.isEmpty()) {
   									for (fileUpload fiUpload : uploadFiles) {
				                   %>
				                   <tr>
				                          <td class="text-center"><%= fiUpload.getFid() %></td>
				                          
					                      <td class="text-center"><%= fiUpload.getFname() %></td>
					                      <td>
					                         <form method="post" action="DownloadFileServlet">
					                            <input type="hidden" name="fileId" value="<%= fiUpload.getFid() %>">
					                            <div class="text-center">
                                                   <button class="btn btn-primary" type="submit">Download</button>
							                    </div>
					                         </form>
						                  </td>
				                   </tr>
				                  <%
    										}
										} else {
										%>
    										<h1>No files available.</h1>
								<%
									}
								%>
			                   </tbody>
		                   </table>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>
