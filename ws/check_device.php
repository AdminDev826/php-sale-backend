<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

if ($_SERVER["REQUEST_METHOD"]=="GET"){
	$conn=get_db_connection();

	$device_id = 0 ;

	if (isset($_GET["device_id"])){
		$device_id = $_GET["device_id"];
	}

	$query="SELECT * FROM profile WHERE device_id = '$device_id'";
	
	//echo $query;
	$resultset=mysql_query($query,$conn);
	$items=array();
	while(($row=mysql_fetch_assoc($resultset))!==FALSE){
		$items[]=$row;	
	}



	mysql_free_result($resultset);

	
	mysql_close($conn);
	$stat = 'no_device';
	
	if (count($items) > 0) {
		if ($items[0]["status"] == 1 ) {
			$stat = 'valide';
		}else{
			$stat = 'invalide';
		}
	}
	
	$result=array("status"=>200,"device"=>$stat,"item"=>$items[0]);
        header('Content-Type: application/json');
	echo json_encode($result);
	exit();
	
}

?>