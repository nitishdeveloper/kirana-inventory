<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>welcome</title>
      <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet"/>
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"/>
      <link href="<c:url value='/static/css/welcome.css' />" rel="stylesheet"/>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet"/>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet"/>
   </head>
   <body>
      <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
         <div class="container">
            <div class="card login-card">
               <div class="row no-gutters">
                  <div class="col-md-5">
                     <img src="<c:url value='/static/images/login.jpg' />" alt="login" class="login-card-img">
                  </div>
                  <div class="col-md-7">
                     <div class="card-body">
                        <div class="brand-wrapper">
                           <img src="<c:url value='/static/images/logo.svg' />" alt="logo" class="logo">
                        </div>
                        <p class="login-card-description">Sign into your account</p>
                        <c:url var="loginUrl" value="/login" />
                        <form action="${loginUrl}" method="post" class="form-horizontal">
                           <c:if test="${param.error != null}">
                              <div class="alert alert-danger" role="alert">
                                 Invalid username and password!
                              </div>
                           </c:if>
                           <c:if test="${param.logout != null}">
                              <div class="alert alert-success" role="alert">
                                 You have been logged out successfully!
                              </div>
                           </c:if>
                           <div class="form-group">
                              <label for="username" class="sr-only">username</label>
                              <input type="text" name="username" id="username" class="form-control" placeholder="username"/>
                           </div>
                           <div class="form-group mb-4">
                              <label for="password" class="sr-only">Password</label>
                              <input type="password" name="password" id="password" class="form-control" placeholder="***********"/>
                           </div>
                           <div class="form-group mb-4">
                              <div class="checkbox">
                                 <label><input type="checkbox" id="rememberme" name="remember-me"> Remember Me</label>  
                              </div>
                           </div>
                           <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                           <input name="login" id="login" class="btn btn-block login-btn mb-4"  type="submit" value="Login"/>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </main>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
   </body>
</html>