<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Product list</title>
      <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
      <link href="<c:url value='/static/css/productlist.css' />" rel="stylesheet">
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
      <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
   </head>
   <body>
      <div class="container-fluid">
         <header>
            <div class="row">
               <div class="col">
                  <nav class="navbar navbar-expand-lg navbar-dark indigo">
                     <a class="navbar-brand py-0" href="#"><i class="fab fa-3x fa-mdb"></i></a>
                     <!-- Collapse button -->
                     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
                        aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
                     <span class="navbar-toggler-icon"></span>
                     </button>
                     <div class="collapse navbar-collapse" id="basicExampleNav">
                        <ul class="navbar-nav mr-auto text-uppercase">
                           <li class="nav-item">
                              <a class="nav-link font-weight-normal"  href="<c:url value='/product/productlist'/>">
                              <i class="fas fa-home"></i>Home</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="#" data-toggle="modal" data-target="#modalLoginForm1" data-backdrop="static" data-keyboard="false"><i class="fas fa-plus-circle"></i>Add</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="#" data-toggle="modal" data-target="#modalLoginForm2" data-backdrop="static" data-keyboard="false"><i class="fas fa-cloud-upload-alt"></i>Upload</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="<c:url value='/userList'/>"><i class="fas fa-user-alt"></i>Users</a>
                           </li>
                        </ul>
                        <ul class="navbar-nav mr-auto">
                           <li class="nav-item text-uppercase">
                              <a class="nav-link font-weight-normal">Kirana Inventory System</a>
                           </li>
                        </ul>
                        <ul class="nav navbar-nav nav-flex-icons ml-auto">
                           <li class="nav-item dropdown">
                              <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                                 aria-haspopup="true" aria-expanded="false"><i class="fas fa-wrench"></i><span class="d-none d-xl-inline-block ml-1 font-weight-normal">Tools</span></a>
                              <div class="dropdown-menu dropdown-primary dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                 <a class="dropdown-item font-weight-normal" href="#">${loggedinuser}</a>
                                 <a class="dropdown-item" href="#">Profile</a>
                                 <a class="dropdown-item" href="<c:url value="/logout" />">Logout</a>
                              </div>
                           </li>
                        </ul>
                     </div>
                  </nav>
               </div>
            </div>
         </header>
        
         <main> <!-- main frame -->
            <div class="container" style="margin-top:60px;margin-bottom:23em;">
               <div class="row">
                  <div class="col">
                     <table id="dtBasicExample" class="table table-striped table-bordered table-sm table-hover" cellspacing="0" width="100%">
                        <thead>
                           <tr class="table-info font-weight-bold">
                              <th>Firstname</th>
                              <th>Lastname</th>
                              <th>Email</th>
                              <th>Username</th>
                              <sec:authorize access="hasRole('ADMIN')">
				        	<th width="100"></th>
				        </sec:authorize>
				        <sec:authorize access="hasRole('ADMIN')">
				        	<th width="100"></th>
				        </sec:authorize>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach items="${users}" var="user">
					<tr>
						<td>${user.firstName}</td>
						<td>${user.lastName}</td>
						<td>${user.email}</td>
						<td>${user.username}</td>
					    	<sec:authorize access="hasRole('ADMIN')">
                                 <td>
                                    <a href="<c:url value='/edit-user-${user.username}' />" data-toggle="modal" data-target="" data-backdrop="static" data-keyboard="false" ><i class="fas fa-edit"></i></a>
                                 </td>
                             </sec:authorize>
                             <sec:authorize access="hasRole('ADMIN')">    
                                 <td>
                                    <a href="<c:url value='/delete-user-${user.username}' />" ><i class="fas fa-trash"></i></a>
                                 </td>
                               </sec:authorize>  
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
                  <sec:authorize access="hasRole('ADMIN')">
		 	<div class="well">
		 		<a href="<c:url value='/newuser' />">Add New User</a>
		 	</div>
	 	</sec:authorize>
               </div>
            </div>
         </main><!-- main frame -->
             <!-- footer -->
         <footer class="page-footer font-small indigo">
            <div class="container text-center" style="padding:25px;">
               <div class="row">
                  <div class="col">
                     <span class="text-center font-weight-bold">Footer</span>
                  </div>
                  <!-- Grid column -->
               </div>
            </div>
         </footer>
      </div>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
      <script type="text/javascript" src="<c:url value='/static/js/productjs.js'/>"></script>
   </body>
</html>