<?php
session_start();
if (!isset($_SESSION["admin"])){
	header("Location: login.php");
	exit();
}

if (!isset($_GET["id"])){
	header("Location: questions.php");
	exit();
}

include "../common.php";

$conn=get_db_connection();

$id=$_GET["id"];

if ($_SERVER["REQUEST_METHOD"]=="POST"){
	$content=$_POST["content"];
	$profile_id=$_POST["profile"];
	$query="INSERT INTO comments(item_id,profile_id,item_type,content,comment_dt)";
	$query.=" VALUES(".$id.",".$profile_id.",'user_media','".mysql_real_escape_string($content)."',NOW())";
	
	//echo $query;
	mysql_query($query,$conn);
}

$query="SELECT q.* FROM posts q WHERE q.id=".$id;
$resultset=mysql_query($query,$conn);
$media_row=mysql_fetch_assoc($resultset);
mysql_free_result($resultset);
if ($media_row===FALSE){
	mysql_close($conn);
	header("Location: user_media_items.php");
	exit();
}
$query="SELECT c.* FROM comments c WHERE c.item_id=".$id." ORDER BY c.comment_dt DESC";
$resultset=mysql_query($query,$conn);
$comments=array();
while(($row=mysql_fetch_assoc($resultset))!==FALSE){
	$comments[]=$row;
}
mysql_free_result($resultset);
mysql_close($conn);

?>
<html>
	<head>
		<meta http-equiv='Content-Type' content='Type=text/html; charset=utf-8'>
		<meta charset="utf-8">
		<title>User Media</title>
	</head>
	<body>
	<?php
		include "top_menu.php";
	?>
		<br /><br />
		<div>
			<?php echo $media_row['number'];?>
			<br />
			<?php echo $media_row['title'];?>
			<br />
			<img src="<?php echo $media_row['image_url'];?>" width="250" height="250" />
		</div>
		<hr style='width:98%;' />
		<h2>Comments</h2>
		<div>
			<?php foreach ($comments as $c){?>
				<div>
				<span><?php echo $c['comment_dt'];?></span>
				<br />
				<span><?php echo $c['content'];?></span>
				<br />
				<hr style='width:98%;' />
				</div>
			<?php }?>
		</div>
		<br />
		<form method="POST">
			<input type="hidden" name="profile" value="0" />
			<input type="text" autocomplete="off" value="" name="content" style="width:250px;" />		
			<br />
			<input type="submit" value="Save" />
		</form>
	</body>
</html>