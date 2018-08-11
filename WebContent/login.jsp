<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<link rel="stylesheet" href="css/Login.css">
</head>


<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><h2>College Admission System</h2></li>
      </ul>
    </div>
  </div>
</nav>

<div class="login-form">
    <form action="loginhandler" method="post">
        <h2 class="text-center">ADMIN</h2>       
        <div class="form-group">
			<p>Username</p>
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user"></i></span>
				<input type="text" name="username" class="form-control" placeholder="Enter Username" required="required">
			</div>
        </div>
        <div class="form-group">
			<p>Password</p>
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-key"></i></span>
				<input type="password" name="password" class="form-control" placeholder="Enter Password" required="required">
			</div>
        </div>
        <div class="form-group">
           
			<button type="submit" class="btn btn-primary btn-block" >Log in</button>
	
        </div>     
    </form>
    <%
		String login_msg=(String)request.getAttribute("error");  
		if(login_msg!=null)
		{
			out.println("<center><font color=red size=4px>"+login_msg+"</font></center>");
		}
	%>
			
	
</div>
</body>
</html>