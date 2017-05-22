<?php

	session_start();
	if (!isset($_SESSION["admin"])){
		header("Location: login.php");
		exit();
	}


	header('Access-Control-Allow-Origin: *');
	

include "../common.php";
include "../aws.php";

	$target_path = "../admin/user_media";
	
	$filename=$_FILES["media_file"]["name"];
	$fullfilepath="admin/user_media/".$filename;
	
	$target_path = $target_path.basename( $_FILES['file']['name']);
	echo $target_path;
	move_uploaded_file($_FILES["media_file"]["tmp_name"],$fullfilepath);
	
	if (move_uploaded_file($_FILES['file']['tmp_name'], $fullfilepath)) {
    			echo "Upload and move success";
		} else {
			echo json_encode($target_path);
    			echo "There was an error uploading the file, please try again!";
		}

?>
