<?php

include "../common.php";
include "aws.php";

try{
if ($_SERVER["REQUEST_METHOD"]=="POST"){
    $conn=get_db_connection();
    $post_id=$_REQUEST["post_id"];
    //$form=R::findOne('answer','id=?',array($form_id));
    //$formimage=R::dispense('formimage');
    $url="";
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
			$url=$result['ObjectURL'];
			unlink($fullfilepath);
		}catch(Exception $e){
			$result=array("status"=>400,"msg"=>"Exception in s3: ".$e->getMessage());
			echo json_encode($result);
			exit();
		}

        $query="INSERT INTO postimage(image_url,post_id) VALUES('".mysql_real_escape_string($url)."',".$post_id.")";
        mysql_query($query,$conn);

        $query="UPDATE posts SET image_url='".mysql_real_escape_string($url)."' WHERE id=".$post_id;
        mysql_query($query,$conn);
	}else{
		$result=array("status"=>400,"msg"=>"Your image not uploaded to our script");
		echo json_encode($result);
		exit();
	}
    mysql_close($conn);
	$result=array("status"=>200,"image_url"=>$url,"media_file" => $_FILES["media_file"]);
	echo json_encode($result);
    exit();
}

}catch(Exception $ex){
	$result=array("status"=>400,"msg"=>"Global exception: ".$ex->getMessage());
	echo json_encode($result);
	exit();
}

?>

<body>
    <form method="POST" enctype="multipart/form-data">
        <input type="file" name="media_file" />
        <input type="text" value="1" name="post_id" />
        <input type="submit" value="Submit" />
    </form>
</body>