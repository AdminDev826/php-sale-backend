<?php

error_reporting(E_ALL);

echo "Before require<br />";
try{
	include "aws.php";
}catch(Exception $e){
	echo "Error in include: ".$e->getMessage();
}

echo "Require done<br />";

//$client = new Aws\S3\S3Client([
$client = Aws\S3\S3Client::factory(array(
		'version' => 'latest',
		'region'  => 'us-west-2',
		'scheme' => 'http'
		));

echo "s3 object created<br />";

$pathToFile='get_categories.php';
$bucket='2sale';

try{
	$result = $client->putObject(array(
		'ACL' => 'public-read',
		'Bucket'     => $bucket,
		'Key'        => 'test_upload_'.time(),
		'SourceFile' => $pathToFile
		)
	);
}catch(Exception $e){
	echo "Exception: ".$e->getMessage()."<br />";
	exit();
}

print_r($result);
echo "<br />";

try{
	//We can poll the object until it is accessible
	$client->waitUntil('ObjectExists', array(
		'Bucket' => $this->bucket,
		'Key'    => 'data_from_file.txt'
	));

	echo "After wait until";
}catch(Exception $e){
	echo "Exception in waitUntil: ".$e->getMessage()."<br />";
}

?>