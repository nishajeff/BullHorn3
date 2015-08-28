<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Login</title>
</head>
<body>
${message}
<h1 align="center">Welcome To Bullhorn3!</h1>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
    
    </div>
    <div>
      <ul class="nav navbar-nav">
      <li class="active"><a href="#">Welcome</a></li>
      <li><a href="GetPost.jsp">Post Stream</a></li> 
        
      </ul>
    </div>
  </div>
</nav>
<div align="center">
<form action="Login" method="post">
<label >User ID: </label>
<input  type="text" name="userID" required ><br>
<input type="submit" value="Enter" id="submit">
</form>
</div>
</body>
</html>