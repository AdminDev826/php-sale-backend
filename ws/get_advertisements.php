<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

$conn=get_db_connection();
$query="SELECT * FROM advertisement";
$resultset=mysql_query($query,$conn);
$items=array();
while(($row=mysql_fetch_assoc($resultset))!==FALSE){
	$items[]=$row;
}
mysql_free_result($resultset);
mysql_close($conn);

$result=array("status"=>200,"items"=>$items);
echo json_encode($result);
exit();

?>