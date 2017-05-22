<?php
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
	$title=$_POST["title"];
	$title_ar=isset($_POST["title_ar"])?$_POST["title_ar"]:"";
	$url=$_POST["url"];
	$parent_id=$_POST["parent"];
	$is_parent=isset($_POST["is_parent"])?$_POST["is_parent"]:0;
	$order=isset($_POST["order"])?$_POST["order"]:0;
	$id=isset($_POST["id"])?$_POST["id"]:0;
	$has_file=FALSE;
	//print_r($_POST);
	if (isset($_FILES["cat_file"]) && $_FILES["cat_file"]["size"]>0){
		$filename=$_FILES["cat_file"]["name"];
		$fullfilepath="category_images/".$filename;
		move_uploaded_file($_FILES["cat_file"]["tmp_name"],$fullfilepath);
		$emUrl = "http".(!empty($_SERVER['HTTPS'])?"s":"").
		"://".$_SERVER['SERVER_NAME'].($_SERVER['SERVER_PORT']=='80'?"":(":".$_SERVER['SERVER_PORT'])).$_SERVER['REQUEST_URI'];
		$codeUrl=dirname($emUrl)."/".$fullfilepath;
		$url=$codeUrl;
		$has_file=TRUE;
		
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
			echo "Exception in putObject: ".$e->getMessage()."<br />";
			//exit();
		}
	}
	$query="UPDATE categories SET category_name='".mysql_real_escape_string($title)."'";
	$query.=",category_ar_name='".mysql_real_escape_string($title_ar)."'";
	$query.=",cat_order=".$order;
	$query.=",is_parent=".$is_parent;
	if ($has_file){
		$query.=",image_file='".mysql_real_escape_string($url)."'";
	}
	$query.=" WHERE id=".$id;
	//$query="INSERT INTO categories(category_name,category_ar_name,image_file,parent_id,is_parent,cat_order) VALUES('".mysql_real_escape_string($title)."','".mysql_real_escape_string($title_ar)."','".mysql_real_escape_string($url)."',".$parent_id.",".$is_parent.",".$order.")";
	mysql_query($query,$conn);
}

//header("Location: categories.php?parent_id=".$parent_id);

echo "Click here to redirect: <a href='categories.php?parent_id=".$parent_id."'>Click</a>";

?>