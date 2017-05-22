<?php
header('Access-Control-Allow-Origin: *');

function resizeimage($img,$size){
	$width=$size[0];
	$height=$size[1]; 
	$newwidth = 640;
	$newheight = $height*($newwidth/$width);
	$tci = imagecreatetruecolor($newwidth, $newheight);
	imagecopyresampled($tci, $img, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
	return $tci;
}

function startsWith($haystack, $needle)
	{
	     $length = strlen($needle);
	     return (substr($haystack, 0, $length) === $needle);
	}

function compress($source, $destination, $quality) {

	$info = getimagesize($source);

	if ($info['mime'] == 'image/jpeg') 
		$image = imagecreatefromjpeg($source);

	elseif ($info['mime'] == 'image/gif') 
		$image = imagecreatefromgif($source);

	elseif ($info['mime'] == 'image/png') 
		$image = imagecreatefrompng($source);

	$image=resizeimage($image,$info);

	imagejpeg($image, $destination, $quality);

	return $destination;
}

include "../common.php";
include "aws.php";

try{

if ($_SERVER["REQUEST_METHOD"]=="POST"){
	$conn=get_db_connection();
	$profile_id=$_POST["profile_id"];
	$title=$_POST["title"];
	$url=$_POST["url"];
	$type=$_POST["type"];
	$sticky=$_POST["sticky"];
	$count =$_POST["count"];
	$type_post =$_POST["type_post"];

	if ($sticky == 'true') {
		$sticky = 1;
	} else {
		$sticky = 0;
	}
	
	$catid=isset($_POST["category_id"])?$_POST["category_id"]:0;
	$number=isset($_POST["number"])?$_POST["number"]:"";
        $number = str_replace(" ", "", (string)$number);

	$price=isset($_POST["price"])?$_POST["price"]:"";
	if (isset($_FILES["media_file"]) && $_FILES["media_file"]["size"]>0){
		$filename=$_FILES["media_file"]["name"];
		$fullfilepath="admin/user_media/".$filename;
		move_uploaded_file($_FILES["media_file"]["tmp_name"],$fullfilepath);

		//resize here
		$destination_img="admin/user_media/".time().$filename.".jpg";
		//$tempFull = compress($fullfilepath, $destination_img,60);
		$tempFull = compress($fullfilepath, $destination_img,30);

		unlink($fullfilepath);

		$fullfilepath=$tempFull;

		$emUrl = "http".(!empty($_SERVER['HTTPS'])?"s":"").
		"://".$_SERVER['SERVER_NAME'].($_SERVER['SERVER_PORT']=='80'?"":(":".$_SERVER['SERVER_PORT'])).$_SERVER['REQUEST_URI'];
		$codeUrl=dirname($emUrl)."/".$fullfilepath;
		$url=$codeUrl;
		
		$client = Aws\S3\S3Client::factory(array(
				'version' => 'latest',
				'region'  => 'us-west-2',
				'scheme' => 'http'
		));
		
		//echo "s3 object created<br />";
		
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
			
			$stCode=$result['@metadata']['statusCode'];
			if ($stCode!="200"){
				$result=array("status"=>400,"msg"=>"Error in uploading to s3: ".$stCode);
				echo json_encode($result);
				exit();
			}
			//print_r($result);
			//echo "<br />";
			$url=$result['ObjectURL'];
			//echo "Url: ".$url."<br />";
			unlink($fullfilepath);
			//echo "Local file removed<br />";
		}catch(Exception $e){
			//echo "Exception in putObject: ".$e->getMessage()."<br />";
			//exit();
			$result=array("status"=>400,"msg"=>"Exception in s3: ".$e->getMessage());
			echo json_encode($result);
			exit();
		}
	}/*else{
		$result=array("status"=>400,"msg"=>"Your image not uploaded to our script");
		echo json_encode($result);
		exit();
	}*/
	$dt = date("Y-m-d H:i:s");
	
	 if (startsWith((string)$number, "965")) {
            (string)$number = "+".(string)$number;
        }
         

        
	$query="INSERT INTO posts(profile_id,title,image_url,post_type,post_dt,post_status,number,category_id,price,sticky,sticky_date) VALUES(".$profile_id.",";
	$query.="'".mysql_real_escape_string($title)."','".mysql_real_escape_string($url)."','".mysql_real_escape_string($type)."',NOW(),'active','".$number."',".$catid.",'".mysql_real_escape_string($price)."',".mysql_real_escape_string($sticky).",'".$dt."')";
	mysql_query($query,$conn);

	$post_id=mysql_insert_id($conn);


	
	$query="UPDATE `profile` SET `".$type_post."`=".$count." WHERE `profile_id` = $profile_id";
	
	//echo $query;
	$resultset = mysql_query($query,$conn);
	$stat = 'failed';
	if (mysql_affected_rows() > 0) {
		$stat = 'success';
	}


	mysql_close($conn);
	$result=array("status"=>200,"post_id"=>$post_id);
	echo json_encode($result);
	exit();

	
}

}catch(Exception $ex){
	$result=array("status"=>400,"msg"=>"Global exception: ".$ex->getMessage());
	echo json_encode($result);
	exit();
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