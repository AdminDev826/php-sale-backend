<?php


	header('Access-Control-Allow-Origin: *');
	
	include "../common.php";
	include "../aws.php";
	
	
	$conn=get_db_connection();

	$post_content = $_POST["content"];

		$profile = $_POST["profile"];
        $Country = $_POST["Country"];
	$fullfilepath = "user_media/".$_FILES["media_file"]["name"];
	move_uploaded_file($_FILES["media_file"]["tmp_name"],$fullfilepath);
	
	//$url= "http://autoigs.com/mediacms/admin/user_media/".$_FILES["media_file"]["name"];
		
	$emUrl = "http".(!empty($_SERVER['HTTPS'])?"s":"").
	"://".$_SERVER['SERVER_NAME'].($_SERVER['SERVER_PORT']=='80'?"":(":".$_SERVER['SERVER_PORT'])).$_SERVER['REQUEST_URI'];
	$codeUrl=dirname($emUrl)."/".$fullfilepath;
	$url = $codeUrl;
	
		

	$query="INSERT INTO wantedpost(img_url, post_detail, other,post_date,profile_id,region) VALUES('$url','$post_content','dfdf',NOW(),'$profile','$Country')";
	$result = mysql_query($query,$conn);
	
	mysql_free_result($result);
	echo json_encode($url);

	mysql_close($conn);

?>
