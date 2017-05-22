<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

$parent_id=0;

if (isset($_POST["parent_id"])){
	$parent_id=$_POST["parent_id"];
}

$conn=get_db_connection();
$query="SELECT c.*,(SELECT COUNT(p.id) FROM posts p WHERE c.id=p.category_id AND p.approved=1) AS total_count FROM categories c";
$query.=" WHERE parent_id=".$parent_id;
if (isset($_GET["search"])){
	$query.=" AND c.category_name LIKE '%".mysql_real_escape_string($_GET["search"])."%'";
}
//$query.=" ORDER BY category_name";
$query.=" ORDER BY cat_order";
$resultset=mysql_query($query,$conn);
$items=array();
while(($row=mysql_fetch_assoc($resultset))!==FALSE){
	$items[]=$row;
}
mysql_free_result($resultset);
mysql_close($conn);
//$items = array_chunk($items, 3);
$result=array("status"=>200,"items"=>$items,"parent"=>$parent_id);

header('Content-Type: application/json');
echo json_encode($result);
exit();

?>