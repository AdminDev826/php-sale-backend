<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

if ($_SERVER["REQUEST_METHOD"]=="GET"){
	$conn=get_db_connection();

	$type = 0 ;
	if (isset($_GET["type"])){
		$type = $_GET["type"];
	}

	$profile_id = 0 ;
	if (isset($_GET["profile_id"])){
		$profile_id = $_GET["profile_id"];
	}


	$count = 0 ;
	if (isset($_GET["count"])){
		$count = intval($_GET["count"]);
	}
    



	$query="UPDATE `profile` SET `".$type."`=".$count." WHERE `profile_id` = $profile_id";
	
	//echo $query;
	$resultset = mysql_query($query,$conn);
	$stat = 'failed';
	if (mysql_affected_rows() > 0) {
		$stat = 'success';
	}

	mysql_free_result($resultset);
	mysql_close($conn);

	$result=array("status"=>200,"device"=>$query);
        header('Content-Type: application/json');
	echo json_encode($result);
	exit();
	
}

?>