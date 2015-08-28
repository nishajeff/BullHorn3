<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Get Posts</title>
</head>
<body>
<h1 align="center">Welcome To Bullhorn2!</h1>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
    
    </div>
    <div>
      <ul class="nav navbar-nav">
      <li><a href="home.jsp">Welcome</a></li>
      <li class="active"><a href="GetPost.jsp">Post Stream</a></li>       
      </ul>
    </div>
  </div>
</nav>
<form action="Insert" method="post">
<input type=hidden value="GetPost" name="currentpage">
<label>&nbsp;</label>
<input type="submit" value="Get Post Stream" id="submit"></form>

${message}
<form action="Insert" method="get">
<label >Enter search word: </label>
<input  type="text" name="word"  ><br>
<input type="submit" value="Get Post Stream for a word " id="submit">
</form>
${message1}
</body>
</html>