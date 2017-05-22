<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";
$conn=get_db_connection();
$lang = 'en';

if (isset($_GET["lang"])){
   $lang = $_GET["lang"];
}

$query="SELECT id,category_name AS name,image_file AS image_file,parent_id AS parent_id,is_parent AS is_parent FROM categories ORDER BY cat_order";

if($lang == 'ar'){
$query="SELECT id, category_ar_name AS name,image_file AS image_file,parent_id AS parent_id,is_parent AS is_parent FROM categories ORDER BY cat_order";
}else{
$query="SELECT id,category_name AS name,image_file AS image_file,parent_id AS parent_id,is_parent AS is_parent FROM categories ORDER BY cat_order";
}


$resultset=mysql_query($query,$conn);
$items=array();
while(($row=mysql_fetch_assoc($resultset))!==FALSE){
	$items[]=$row;
}
mysql_free_result($resultset);
mysql_close($conn);

	for($a=0;$a<count($items);$a++){
		
		if ($items[$a]["is_parent"] == 1) {
			$items[$a]["collapsed"] = false;
		}elseif ($items[$a]["is_parent"] == 0) {
			$items[$a]["collapsed"] = true;
		}
	}

//$items = array_chunk($items, 3);
$items =  buildTree($items, 0);

$result=array("status"=>200,"items"=>$items);

header('Content-Type: application/json');
echo json_encode($result);
exit();

?>