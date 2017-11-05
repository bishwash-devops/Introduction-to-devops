<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
   <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title><c:out value="${app.application.name}"/></title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
</head>
<body>

<div class="row" style="background:#00cbff">
	<div class="container-fluid">
		<div style="padding:20px">
	 <a href="#" class="h3"><c:out value="${app.name}"/></a>
	 	</div>
  	</div>
</div>

<div class="container">
<br/>

    <form method="POST" action='UserController' name="frmAddUser">
    		<div class="form-group">
        <label>User ID :</label> <input class="form-control" type="text" readonly="readonly" name="userid"
            value="<c:out value="${user.userid}" />" /> <br /> 
         </div>
         <div class="form-group">
        <label>First Name :</label> <input class="form-control" 
            type="text" name="firstName"
            value="<c:out value="${user.firstName}" />" /> <br /> 
                     </div>
         <div class="form-group">
        <label>Last Name :</label> <input class="form-control" 
            type="text" name="lastName"
            value="<c:out value="${user.lastName}" />" /> <br /> 
                     </div>
         <div class="form-group">
        <label>DOB :</label> <input class="form-control" id="datepicker"
            type="text" name="dob"
            value="<fmt:formatDate pattern="MM/dd/yyyy" value="${user.dob}" />" /> <br /> 
                     </div>
         <div class="form-group">
        <label>Email :</label> <input type="text" name="email" class="form-control" 
            value="<c:out value="${user.email}" />" /> <br /> <input
            type="submit" value="Submit" />
            </div>
    </form>
    
</div>

   <footer class="footer">
      <div class="container text-right small">
        <span class="text-muted">Version: <c:out value="${app.version}"></c:out></span>
      </div>
    </footer>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <script>
        $(function() {
        	$( "#datepicker" ).datepicker({
        	      changeMonth: true,
        	      changeYear: true,
        	      yearRange: '1910:2017'
        	    });
        });
    </script>
</body>
</html>