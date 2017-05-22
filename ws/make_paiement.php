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

	$mycount = 0 ;
	if (isset($_GET["count"])){
		$mycount = $_GET["count"];
	}

	$ref = "";
	if (isset($_GET["ref"])){
		$ref = $_GET["ref"];
	}

	$result = "";
	if (isset($_GET["result"])){
		$result = $_GET["result"];
	}

	$payid = "";
	if (isset($_GET["payid"])){
		$payid = $_GET["payid"];
	}

	$crdtype = "";
	if (isset($_GET["crdtype"])){
		$crdtype = $_GET["crdtype"];
	}

	$trackid = "";
	if (isset($_GET["trackid"])){
		$trackid = $_GET["trackid"];
	}


	$query="SELECT * FROM profile WHERE device_id = '$device_id'";
	
	//echo $query;
	$resultset=mysql_query($query,$conn);
	$items=array();
	while(($row=mysql_fetch_assoc($resultset))!==FALSE){
		$items[]=$row;	
	}

	$stat1 = 0;
	
	if (count($items) > 0) {
		$stat1 = $items[0]["paied_posts"];
                //echo $stat.'////';
	}

	$new_count = $stat1 + $mycount;



	$query2="UPDATE `profile` SET `paied_posts`= $new_count WHERE `profile_id` = $profile_id AND `device_id` = '".$device_id."'";
	//echo '<br>';
	//echo $query2;
	$resultset2 = mysql_query($query2,$conn);
	$stat = 'failed';
	if (mysql_affected_rows() > 0) {
		$stat = 'success';
	}

	$query3="INSERT INTO `paiements`(`profile_id` ,`ref`, `result`, `payid`, `crdtype`, `trackid` ) VALUES (".$profile_id." ,'".$ref."', '".$result."', '".$payid."', '".$crdtype."', '".$trackid."')";

	mysql_query($query3,$conn);

	mysql_free_result($resultset2);
	mysql_close($conn);

	$result=array("status"=>200,"device"=>$stat);
        //header('Content-Type: application/json');
	//echo json_encode($result);
	exit();
	
}

?>