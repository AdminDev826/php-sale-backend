<?php

function get_extension($name){
	//$ext = strtolower(substr($name , strpos($name , '.') +1));
	$ext = pathinfo($name, PATHINFO_EXTENSION);
	return $ext;
}

session_start();
if (!isset($_SESSION["admin"])){
	header("Location: login.php");
	exit();
}
include "../common.php";
include "../aws.php";

$conn=get_db_connection();
$parent_id=0;

if ($_SERVER["REQUEST_METHOD"]=="POST"){
	$image_url="";
	$url=$_POST["url"];
	if (isset($_FILES["cat_file"]) && $_FILES["cat_file"]["size"]>0){
		$filename=$_FILES["cat_file"]["name"];
		$fullfilepath="adv_images/".$filename;
		move_uploaded_file($_FILES["cat_file"]["tmp_name"],$fullfilepath);
		$emUrl = "http".(!empty($_SERVER['HTTPS'])?"s":"").
		"://".$_SERVER['SERVER_NAME'].($_SERVER['SERVER_PORT']=='80'?"":(":".$_SERVER['SERVER_PORT'])).$_SERVER['REQUEST_URI'];
		$codeUrl=dirname($emUrl)."/".$fullfilepath;
		$image_url=$codeUrl;
		
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
			$image_url=$result['ObjectURL'];
			echo "Url: ".$url."<br />";
			unlink($fullfilepath);
			echo "Local file removed<br />";
		}catch(Exception $e){
			echo "Exception in putObject: ".$e->getMessage()."<br />";
			//exit();
		}
	}
	$query="DELETE FROM advertisement";
	mysql_query($query,$conn);
	$query="INSERT INTO advertisement(url,image_file) VALUES('".mysql_real_escape_string($url)."','".mysql_real_escape_string($image_url)."')";
	mysql_query($query,$conn);
}

$query="SELECT * FROM advertisement";
$resultset=mysql_query($query,$conn);
$items=array();
while(($row=mysql_fetch_assoc($resultset))!==FALSE){
	$items[]=$row;
}
mysql_free_result($resultset);
mysql_close($conn);
?>
<html>
	<head>
		<meta http-equiv='Content-Type' content='Type=text/html; charset=utf-8'>
		<meta charset="utf-8">
		<title>Advertisement</title>
	</head>
	<body>
	<?php
		include "top_menu.php";
	?>
		<br /><br />
		<h2>Advertisement</h2>
		<form method="POST" enctype="multipart/form-data">
			<table>
				<tr>
					<td>Url</td>
					<td><input type="text" value="" name="url" style="width:600px;" /></td>
				</tr>
				<tr>
					<td>Image file/url</td>
					<td>
						<input type="file" name="cat_file" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="Save" />
					</td>
				</tr>
			</table>
		</form>
		<br />
		<?php foreach ($items as $item){?>
		<img src="<?php echo $item["image_file"];?>" width="350" height="350" />
		<br />
		<?php }?>
	</body>
</html>