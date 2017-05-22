<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

if ($_SERVER["REQUEST_METHOD"]=="GET"){
	$conn=get_db_connection();

	$query="SELECT um.* FROM posts um WHERE approved=1";

    if (isset($_GET["profile_id"])){
		//$query.=" AND profile_id =".$_GET["profile_id"];
                $query="SELECT um.* FROM posts um WHERE profile_id = ".$_GET["profile_id"];
	}

	
	$query.=" ORDER BY um.post_dt DESC";
	//echo $query;
	$resultset=mysql_query($query,$conn);
	$items=array();
	while(($row=mysql_fetch_assoc($resultset))!==FALSE){
		$items[]=$row;	
	}
	mysql_free_result($resultset);


	mysql_close($conn);
	
	$result=array("status"=>200,"count"=>count($items));
        header('Content-Type: application/json');
	echo json_encode($result);
	if (isset($_GET["api"])){
		exit();
	}
}

?>