<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

if ($_SERVER["REQUEST_METHOD"]=="GET"){
	$conn=get_db_connection();

	$image_id = 0 ;
	if (isset($_GET["image_id"])){
		$image_id = $_GET["image_id"];
	}


	$query="DELETE FROM postimage WHERE id = ".$image_id;
	
	//echo $query;
	$resultset = mysql_query($query,$conn);
	$stat = 'success';
	

	mysql_free_result($resultset);
	mysql_close($conn);

	$result=array("status"=>200,"device"=>$query);
        header('Content-Type: application/json');
	echo json_encode($result);
	exit();
	
}

?>