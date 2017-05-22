<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

if ($_SERVER["REQUEST_METHOD"]=="GET"){
	$conn=get_db_connection();

	$device_id = 0 ;
	if (isset($_GET["device_id"])){
		$device_id = $_GET["device_id"];
	}

	$profile_id = 0 ;
	if (isset($_GET["profile_id"])){
		$profile_id = $_GET["profile_id"];
	}



	$query="UPDATE `profile` SET `status`=1 WHERE `profile_id` = $profile_id AND `device_id` = '".$device_id."'";
	
	//echo $query;
	$resultset = mysql_query($query,$conn);
	$stat = 'failed';
	if (mysql_affected_rows() > 0) {
		$stat = 'success';
	}

	mysql_free_result($resultset);
	mysql_close($conn);

	$result=array("status"=>200,"device"=>$stat);
        header('Content-Type: application/json');
	echo json_encode($result);
	exit();
	
}

?>