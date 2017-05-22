<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";
include "aws.php";

if ($_SERVER["REQUEST_METHOD"]=="POST"){
	$conn=get_db_connection();
	$profile_id=$_POST["profile_id"];
	$title=$_POST["title"];
	$url=$_POST["url"];
	$type=$_POST["type"];
	$catid=isset($_POST["category_id"])?$_POST["category_id"]:0;
	$number=isset($_POST["number"])?$_POST["number"]:"";
	$price=isset($_POST["price"])?$_POST["price"]:"";
	if (isset($_FILES["media_file"]) && $_FILES["media_file"]["size"]>0){
		$filename=$_FILES["media_file"]["name"];
		$fullfilepath="admin/user_media/".$filename;
		move_uploaded_file($_FILES["media_file"]["tmp_name"],$fullfilepath);
		$emUrl = "http".(!empty($_SERVER['HTTPS'])?"s":"").
		"://".$_SERVER['SERVER_NAME'].($_SERVER['SERVER_PORT']=='80'?"":(":".$_SERVER['SERVER_PORT'])).$_SERVER['REQUEST_URI'];
		$codeUrl=dirname($emUrl)."/".$fullfilepath;
		$url=$codeUrl;
		
		$client = Aws\S3\S3Client::factory(array(
				'version' => 'latest',
				'region'  => 'us-west-2',
				'scheme' => 'http'
		));
		
		echo "s3 object created<br />";
		
		$pathToFile=$fullfilepath;
		$bucket='2sale';
		
		try{
			$result = $client->putObject(array(
					'ACL' => 'public-read',
					'Bucket'     => $bucket,
					'Key'        => time().'_'.$filename,
					'SourceFile' => $pathToFile
			)
			);
			print_r($result);
			echo "<br />";
			$url=$result['ObjectURL'];
			echo "Url: ".$url."<br />";
			unlink($fullfilepath);
			echo "Local file removed<br />";
		}catch(Exception $e){
			//echo "Exception in putObject: ".$e->getMessage()."<br />";
			//exit();
		}
	}
	$query="INSERT INTO posts(profile_id,title,image_url,post_type,post_dt,post_status,number,category_id,price) VALUES(".$profile_id.",";
	$query.="'".mysql_real_escape_string($title)."','".mysql_real_escape_string($url)."','".mysql_real_escape_string($type)."',NOW(),'active','".mysql_real_escape_string($number)."',".$catid.",'".mysql_real_escape_string($price)."')";
	
	echo $query."<Br />";
	
	mysql_query($query,$conn);
	
	echo "Query run<br />";
	
	echo "Mysql error: ".mysql_error($conn)."<br />";
	
	mysql_close($conn);
	$result=array("status"=>200);
	echo json_encode($result);
	exit();
}else if ($_SERVER["REQUEST_METHOD"]=="GET"){
	$conn=get_db_connection();
	$query="SELECT um.* FROM posts um WHERE (um.post_type='video' OR um.post_type='photo')";
	$query.=" ORDER BY um.post_dt DESC";
	$resultset=mysql_query($query,$conn);
	$items=array();
	while(($row=mysql_fetch_assoc($resultset))!==FALSE){
		$items[]=$row;
	}
	mysql_free_result($resultset);
	mysql_close($conn);
	
	$result=array("status"=>200,"items"=>$items);
	echo json_encode($result);
	if (isset($_GET["api"])){
		exit();
	}
}

?>

<form method="POST" enctype="multipart/form-data">
		<input type="hidden" value="0" name="profile_id" />
		Title: <input type="text" value="" name="title" style="width:350px;" />
		<br />
		Url: <input type="text" value="" name="url" style="width:600px;" />
		<br />
		Price: <input type="text" value="" name="price" style="width:600px;" />
		<br />
		Number: <input type="text" value="" name="number" style="width:600px;" />
		<input type="file" name="media_file" />
		<select name="type">
			<option value="photo" SELECTED>Photo</option>
			<option value="video">Video</option>
		</select>
		<input type="submit" value="Save" /></td>
</form>