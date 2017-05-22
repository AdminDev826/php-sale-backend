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

	$post_id = 0 ;
	if (isset($_GET["post_id"])){
		$post_id = $_GET["post_id"];
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

	$dt = date("Y-m-d H:i:s");

	$query2="UPDATE `posts` SET `sticky`= 1 , `sticky_date`= '".$dt."' WHERE `id` = $post_id ";
	//echo '<br>';
	//echo $query2;
	$resultset2 = mysql_query($query2,$conn);
	$stat = 'failed';
	if (mysql_affected_rows() > 0) {
		$stat = 'success';
	}

	$query3="INSERT INTO `paiements`(`ref`, `result`, `payid`, `crdtype`, `trackid`,`post_id` ) VALUES ('".$ref."', '".$result."', '".$payid."', '".$crdtype."', '".$trackid."',".$post_id.")";

	mysql_query($query3,$conn);

	mysql_free_result($resultset2);
	mysql_close($conn);

	$result=array("status"=>200,"device"=>$stat);
        header('Content-Type: application/json');
	echo json_encode($result);
	exit();
	
}

?>