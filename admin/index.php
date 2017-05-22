<?php
session_start();
if (!isset($_SESSION["admin"])){
	header("Location: login.php");
	exit();
}
header("Location: user_media_items.php");
		exit();
?>