<?php
session_start();
if (!isset($_SESSION["admin"])){
	header("Location: login.php");
	exit();
}

if (!isset($_GET["id"])){
	header("Location: user_media_items.php");
	exit();
}

$id=$_GET["id"];
include "../common.php";
$query="DELETE FROM posts WHERE id=".$id;
$conn=get_db_connection();
mysql_query($query,$conn);
mysql_close($conn);
header("Location: user_media_items.php");
exit();
?>