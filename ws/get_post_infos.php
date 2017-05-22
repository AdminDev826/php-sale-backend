<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

if ($_SERVER["REQUEST_METHOD"]=="GET"){
	$conn=get_db_connection();
	$query="SELECT um.* FROM posts um WHERE id=".$_GET["post_id"];
	
	$query.=" ORDER BY um.sticky DESC,um.post_dt DESC";
	$resultset=mysql_query($query,$conn);
	$items=array();
	while(($row=mysql_fetch_assoc($resultset))!==FALSE){
		$items[]=$row;	
	}
	mysql_free_result($resultset);

	if (isset($_GET["post_id"])){
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
	if (isset($_GET["api"])){
		exit();
	}
}

?>