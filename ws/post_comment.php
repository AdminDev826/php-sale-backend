<?php
header('Access-Control-Allow-Origin: *');

if (!isset($_GET["profile"]) || !isset($_GET["item_id"]) || !isset($_GET["comment"]) || !isset($_GET["type"])){
	$result=array("status"=>400,"msg"=>"Invalid request parameter missing");
	echo json_encode($result);
	exit();
}

$profile_id=$_GET["profile"];
$item_id=$_GET["item_id"];
$content=$_GET["comment"];
$type=$_GET["type"];

include "../common.php";

$conn=get_db_connection();

$query="INSERT INTO comments(profile_id,item_id,item_type,content,comment_dt) VALUES(".$profile_id.",".$item_id.",'".mysql_real_escape_string($type)."','".mysql_real_escape_string($content)."',NOW())";
mysql_query($query,$conn);

$date=date('Y-m-d H:i:s');

$result=array("status"=>200,"comment_dt"=>$date);
echo json_encode($result);

mysql_close($conn);
exit();
?>