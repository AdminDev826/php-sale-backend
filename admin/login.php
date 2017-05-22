<?php
session_start();

$error_msg="";
$username="";

if ($_SERVER["REQUEST_METHOD"]=="POST"){
	include "../common.php";
	$conn=get_db_connection();
	$username=$_POST["username"];
	$password=$_POST["password"];
	$query="SELECT * FROM admin WHERE username='".mysql_real_escape_string($username)."'";
	$query.=" AND password='".mysql_real_escape_string($password)."'";
	$resultset=mysql_query($query,$conn);
	$row=mysql_fetch_assoc($resultset);
	mysql_free_result($resultset);
	if ($row===FALSE){
		$error_msg="Invalid username/password";
	}else{
		$_SESSION["admin"]=$row;
		header("Location: user_media_items.php");
		exit();
	}
	mysql_close($conn);
}
?>

<html>
	<head>
	  <meta charset="UTF-8">
	  <title>Login To Your APP</title>
	  
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

	  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
	<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

	      <link rel="stylesheet" href="css/style.css">

	  
</head>
<body>
  
<!-- Form Mixin-->
<!-- Input Mixin-->
<!-- Button Mixin-->
<!-- Pen Title-->
<div class="pen-title">
  <?php echo $error_msg; ?>
</div>
<!-- Form Module-->
<div class="module form-module">
  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
    <div class="tooltip">Click Me</div>
  </div>
  <div class="form">
    <h2>Login to your account</h2>
    <form method="POST">
      <input type="text" placeholder="Username" name="username" value="<?php echo $username;?>" />
      <input type="password" placeholder="Password" name="password"/>
      <input type="submit" value="Login" />
    </form>
  </div>
  
  
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="js/index.js"></script>

</body>
</html>
