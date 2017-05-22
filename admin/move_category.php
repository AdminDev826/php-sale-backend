<?php
session_start();
if (!isset($_SESSION["admin"])){
	header("Location: login.php");
	exit();
}

if (!isset($_GET["id"]) || !isset($_GET["status"])){
	header("Location: user_media_items.php");
	exit();
}

$id=$_GET["id"];
$status=$_GET["status"];
include "../common.php";
$query="UPDATE posts SET category_id=".$status." WHERE id=".$id;
$conn=get_db_connection();
mysql_query($query,$conn);
mysql_close($conn);
header("Location: user_media_items.php");
exit();
?>