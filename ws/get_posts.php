<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

if ($_SERVER["REQUEST_METHOD"]=="POST"){
	$conn=get_db_connection();
	$query="SELECT um.* FROM posts um WHERE approved=1";
	if (isset($_POST["category_id"])){
		$query.=" AND category_id=".$_POST["category_id"];
	}
	if (isset($_POST["post_id"])){
		$query.=" AND id=".$_POST["post_id"];
	}
	if (isset($_POST["search"])){
		//$query.=" AND LOWER(um.title) LIKE '%".mysql_real_escape_string(strtolower($_POST["search"]))."%'";
		$query.=" AND um.title LIKE '%".mysql_real_escape_string($_POST["search"])."%'";
	}
	$query.=" ORDER BY um.sticky DESC,um.post_dt DESC";
	//echo $query;
	$resultset=mysql_query($query,$conn);
	$items=array();
	while(($row=mysql_fetch_assoc($resultset))!==FALSE){
		$items[]=$row;	
	}
	mysql_free_result($resultset);

	if (isset($_POST["post_id"])){
		for($a=0;$a<count($items);$a++){
			$itm=$items[$a];
			$itm["images"]=array();
			$query="SELECT * FROM postimage WHERE post_id=".$itm["id"];
			$resultset=mysql_query($query,$conn);
			while(($row=mysql_fetch_assoc($resultset))!==FALSE){
				$itm["images"][]=$row;	
			}
			$items[$a]=$itm;
			mysql_free_result($resultset);
		}
	}

	mysql_close($conn);
	
	$result=array("status"=>200,"items"=>$items);
	echo json_encode($result);
	if (isset($_POST["api"])){
		exit();
	}
}

?>