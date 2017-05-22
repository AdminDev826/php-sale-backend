<?php
header('Access-Control-Allow-Origin: *');

if (!isset($_GET["item_id"]) || !isset($_GET["type"])){
	$result=array("status"=>400,"msg"=>"Invalid request.Parameter missing");
	echo json_encode($result);
	exit();
}

include "../common.php";

$item_id=$_GET["item_id"];
$item_type=$_GET["type"];

$conn=get_db_connection();
$query="SELECT c.* FROM comments c WHERE c.item_id=".$item_id." ORDER BY comment_dt DESC";
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

?>