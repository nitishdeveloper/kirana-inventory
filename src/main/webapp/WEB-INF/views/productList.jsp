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
      <%-- <link href="<c:url value='/static/datatable/datatables.min.css' />" rel="stylesheet"> --%>
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
                           <li class="nav-item active">
                              <a class="nav-link font-weight-normal" href="#">
                              <i class="fas fa-home"></i>Home</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="#" data-toggle="modal" data-target="#modalLoginForm1" data-backdrop="static" data-keyboard="false"><i class="fas fa-plus-circle"></i>Add</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="#" data-toggle="modal" data-target="#modalLoginForm2" data-backdrop="static" data-keyboard="false"><i class="fas fa-cloud-upload-alt"></i>Upload</a>
                           </li>
                           <li class="nav-item">
                              <a class="nav-link" href="#" data-toggle="modal" data-target="#modalLoginForm3" data-backdrop="static" data-keyboard="false"><i class="fas fa-user-alt"></i>Users</a>
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
                                 <a class="dropdown-item font-weight-normal text-uppercase" href="#">${loggedinuser}</a>
                                 <a class="dropdown-item" href="#">Profile</a>
                                 <a class="dropdown-item" href="
                                 <c:url value="/logout" />
                                 ">Logout</a>
                              </div>
                           </li>
                        </ul>
                     </div>
                  </nav>
               </div>
            </div>
         </header>
         <main>
            <div class="container" style="margin-top:60px;margin-bottom:23em;">
               <div class="row">
                  <div class="col">
                     <table id="dtBasicExample" class="table table-striped table-bordered table-sm table-hover" cellspacing="0" width="100%">
                        <thead>
                           <tr class="table-info font-weight-bold">
                              <th>ProductId</th>
                              <th>ProductName</th>
                              <th>BrandName</th>
                              <th>Quantity</th>
                              <th>CategoryName</th>
                              <th>MarketPrice</th>
                              <th>ActualPrice</th>
                              <th>Status</th>
                              <th>update</th>
                              <th>disable</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach items="${products}" var="productlist">
                              <tr>
                                 <td>${productlist.productId}</td>
                                 <td>${productlist.productName}</td>
                                 <td>${productlist.brandName}</td>
                                 <td>${productlist.quantity}</td>
                                 <td>${productlist.categoryName}</td>
                                 <td>${productlist.marketPrice}</td>
                                 <td>${productlist.actualPrice}</td>
                                 <td>
                                 <c:if test="${productlist.status == 1}">
                                 	<span class="badge badge-success">enable</span>
                                 </c:if>
                             	 <c:if test="${productlist.status == 0}">
                                 	<span class="badge badge-danger">enable</span>
                                 </c:if>	
                                 </td>
                                 <td>
                                    <a href="#" data-toggle="modal" data-target="#modalLoginForm4" data-backdrop="static" data-keyboard="false" onclick="getProductDetails(${productlist.entityId})"><i class="fas fa-edit"></i></a>
                                 </td>
                                 <td>
                                    <a href="#" onclick="deleteProduct(${productlist.entityId})" ><i class="fas fa-trash"></i></a>
                                 </td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </main>
         <!--add product modal-->
         <div class="container">
            <div class="modal fade" id="modalLoginForm1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="card">
                        <div class="modal-header card-header indigo white-text text-center py-2">
                           <h4 class="modal-title"><strong>Add Product</strong></h4>
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        <div class="card-body px-lg-20 pt-6">
                           <form class="text-center" style="color: #757575;" class="form-horizontal" method="post">
                              <div class="form-row mb-4">
                                 <div class="col">
                                    <input type="text" id="productId" class="form-control" name="productId" placeholder="ProductId"/>
                                 </div>
                                 <div class="col">
                                    <input type="text" id="productName" class="form-control" name="productName" placeholder="ProductName"/>
                                 </div>
                              </div>
                              <div class="form-row mb-4">
                                 <div class="col">
                                    <input type="text" id="brandName" class="form-control" name="brandName" placeholder="BrandName"/>
                                 </div>
                                 <div class="col">
                                    <input type="text" id="quantity" class="form-control" name="quantity" placeholder="Quantity"/>
                                 </div>
                              </div>
                              <div class="form-row mb-4">
                                 <div class="col">
                                    <input type="text" id="categoryName" class="form-control" name="categoryName" placeholder="CategoryName"/>
                                 </div>
                                 <div class="col">
                                    <input type="text" id="marketPrice" class="form-control" name="marketPrice" placeholder="MarketPrice"/>
                                 </div>
                              </div>
                              <div class="form-row mb-4">
                                 <div class="col">
                                    <input type="text" id="actualPrice" class="form-control" name="actualPrice" placeholder="ActualPrice"/>
                                 </div>
                                 <div class="col">
                                    <select class="browser-default custom-select">
                                       <option selected>Status</option>
                                       <option value="1">disable</option>
                                       <option value="2">enable</option>
                                    </select>
                                 </div>
                              </div>
                              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                           </form>
                           <button class="btn btn-outline-indigo btn-rounded btn-block my-4 waves-effect z-depth-0" onclick="saveProduct()">Add</button>
                           <span class="msg"></span>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!--file upload model-->
         <div class="container">
            <div class="modal fade" id="modalLoginForm2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="card">
                        <div class="modal-header card-header indigo white-text text-center py-2">
                           <h4 class="modal-title"><strong>Bulk Upload</strong></h4>
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        <div class="card-body px-lg-20 pt-6">
                           <form class="text-center" style="color: #757575;" action="fileUpload" enctype="multipart/form-data">
                              <div class="input-group">
                                 <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="inputGroupFile01"
                                       aria-describedby="inputGroupFileAddon01" name="file">
                                    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                 </div>
                              </div>
                              <div class="progress md-progress" style="height:20px; margin-top:30px;">
                                 <div class="progress-bar indigo" id="progressBar" role="progressbar" style="width:25%;height:20px" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
                              </div>
                              <button class="btn btn-outline-indigo btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">upload</button>
                           </form>
                           <!-- Alert -->
    						<div id="alertMsg" style="color: red;font-size: 18px;"></div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!--userlist model-->
         <div class="container-fluid">
            <div class="modal fade" id="modalLoginForm3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="card">
                        <div class="modal-header card-header indigo white-text text-center py-2">
                           <h4 class="modal-title"><strong>Add Product</strong></h4>
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        <div class="card-body px-lg-20 pt-6">
                           <table class="table class="table table-striped table-bordered table-sm table-hover" cellspacing="0" width="100%"">
                           <thead>
                              <tr>
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
                                       <td><a href="<c:url value='/edit-user-${user.username}' />"><i class="fas fa-edit"></i></a></td>
                                    </sec:authorize>
                                    <sec:authorize access="hasRole('ADMIN')">
                                       <td><a href="<c:url value='/delete-user-${user.username}' />"><i class="fas fa-trash"></i></a></td>
                                    </sec:authorize>
                                 </tr>
                              </c:forEach>
                           </tbody>
                           </table>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
          <div class="container">
            <div class="modal fade" id="modalLoginForm4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="card">
                        <div class="modal-header card-header indigo white-text text-center py-2">
                           <h4 class="modal-title"><strong>Update Product</strong></h4>
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        <div class="card-body px-lg-20 pt-6" id="productlist">
                        	
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
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
      <%-- <script type="text/javascript" src="<c:url value='/static/datatable/datatables.min.js'/>"></script> --%>
   </body>
</html>