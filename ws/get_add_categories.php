<?php
header('Access-Control-Allow-Origin: *');


include "../common.php";

$conn=get_db_connection();
$query="SELECT c.*,(SELECT COUNT(p.id) FROM posts p WHERE c.id=p.category_id AND p.approved=1) AS total_count FROM categories c";
//$query.=" WHERE is_parent=0";
$query.=" ORDER BY cat_order";
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