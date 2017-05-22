<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

if ($_SERVER["REQUEST_METHOD"]=="GET"){
	$conn=get_db_connection();

	$profile_id = 0 ;
	if (isset($_GET["profile_id"])){
		$profile_id = $_GET["profile_id"];
	}

	$lang = 0 ;
	if (isset($_GET["lang"])){
		$lang = $_GET["lang"];
	}

	

	$query2="UPDATE `profile` SET `lang`= '".$lang."' WHERE `profile_id` = $profile_id ";
	//echo '<br>';
	//echo $query2;
	$resultset2 = mysql_query($query2,$conn);
	$stat = 'failed';
	if (mysql_affected_rows() > 0) {
		$stat = 'success';
	}

	
	mysql_close($conn);

	$result=array("status"=>200,"device"=>$stat);
        header('Content-Type: application/json');
	echo json_encode($result);
	exit();
	
}

?>