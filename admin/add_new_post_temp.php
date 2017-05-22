<?php



	header('Access-Control-Allow-Origin: *');
	
	include "../common.php";
	include "../aws.php";
	
	
	$conn=get_db_connection();

	$post_title = $_POST["title"];
	$post_price = $_POST["price"];
	$post_content = $_POST["content"];
	$post_category_id = $_POST["category_id"];
	
	$profile_id = $_POST["profile"];
	$post_type ="photo";
    
		$Country= $_POST["Country"];
	
	$fullfilepath = "user_media/".$_FILES["media_file"]["name"];
	move_uploaded_file($_FILES["media_file"]["tmp_name"],$fullfilepath);
	
	//$url= "http://autoigs.com/mediacms/admin/user_media/".$_FILES["media_file"]["name"];
		
	$emUrl = "http".(!empty($_SERVER['HTTPS'])?"s":"").
	"://".$_SERVER['SERVER_NAME'].($_SERVER['SERVER_PORT']=='80'?"":(":".$_SERVER['SERVER_PORT'])).$_SERVER['REQUEST_URI'];
	$codeUrl=dirname($emUrl)."/".$fullfilepath;
	$url=$codeUrl;
	
		
	$query="INSERT INTO posts(profile_id,title,image_url,post_type,post_dt,post_status,number,category_id,price,content,approved,country) VALUES('$profile_id',";
	$query.="'".$post_title."','".$url."','".$post_type."',NOW(),'active','".$post_price."',".$post_category_id.",'".$post_price."','".$post_content."','1','$Country')";
	$resultset = mysql_query($query,$conn);
	
	mysql_free_result($resultset);
	echo $query;

	mysql_close($conn);


?>
