<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";
/*
if (isset($_GET["version"]) ){
    if ($_GET["version"] == 2 ){
*/
	$parent_id=0;

	if (isset($_GET["parent_id"])){
		$parent_id=$_GET["parent_id"];
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
	$items = array_chunk($items, 3);
	$result=array("status"=>200,"items"=>$items);

	header('Content-Type: application/json');
	echo json_encode($result);
	exit();
/*
}else{
	$cat1 = array("image_file" => "","category_ar_name" => "","category_name" => "","total_count" => "","id" => "0","parent_id"=> "0","is_parent"=> "1","cat_order"=> "1");
	$cat2 = array("image_file" => "","category_ar_name" => "","category_name" => "","total_count" => "","id" => "0","parent_id"=> "0","is_parent"=> "1","cat_order"=> "1");
	$cat3 =array("image_file" => "https://image.flaticon.com/icons/svg/3/3728.svg","category_ar_name" => "للحصول على القوة الكاملة ل2Sale التطبيق تحتاج إلى تحديث الإصدار الخاص بك، وذلك بفضل!","category_name" => "to get the full power of 2Sale Application you need to update your version , thanks","total_count" => "","id" => "0","parent_id"=> "0","is_parent"=> "1","cat_order"=> "1");
	$items = array(array($cat1,$cat3,$cat2));

	$result=array("status"=>200,"items"=>$items);

	header('Content-Type: application/json');
	echo json_encode($result);
	exit();
}	
}else{
	$cat1 = array("image_file" => "","category_ar_name" => "","category_name" => "","total_count" => "","id" => "0","parent_id"=> "0","is_parent"=> "1","cat_order"=> "1");
	$cat2 = array("image_file" => "","category_ar_name" => "","category_name" => "","total_count" => "","id" => "0","parent_id"=> "0","is_parent"=> "1","cat_order"=> "1");
	$cat3 =array("image_file" => "https://image.flaticon.com/icons/svg/3/3728.svg","category_ar_name" => "للحصول على القوة الكاملة ل2Sale التطبيق تحتاج إلى تحديث الإصدار الخاص بك، وذلك بفضل!","category_name" => "to get the full power of 2Sale Application you need to update your version , thanks","total_count" => "","id" => "0","parent_id"=> "0","is_parent"=> "1","cat_order"=> "1");
	$items = array(array($cat1,$cat3,$cat2));

	$result=array("status"=>200,"items"=>$items);

	header('Content-Type: application/json');
	echo json_encode($result);
	exit();
}
*/

?>