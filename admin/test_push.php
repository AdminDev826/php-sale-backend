<?php

//define("GOOGLE_API_KEY","AIzaSyAr87c4FHWPpXEC0VAEXsadI0SuK22uWjc");
define("GOOGLE_API_KEY","AIzaSyAgxSXgHSrEcvZJTT2u2e5LBGkQTpPm-Lc");

include "../common.php";

/**
 * Sending Push Notification
 */
function send_notification($registration_ids, $message) {
	// Set POST variables
	$url = 'https://android.googleapis.com/gcm/send';
	$dataArray=array("message"=>$message);

	$fields = array(
			'registration_ids' => $registration_ids,
			'data' => $dataArray
	);
	$headers = array(
			//'Referrer: http://rameezusmani.com/sop/test_push.php',
			'Authorization: key=' . GOOGLE_API_KEY,
			'Content-Type: application/json'
	);
	echo "<br />Header=";
	print_r($headers);
	// Open connection
	$ch = curl_init();
	// Set the url, number of POST vars, POST data
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_POST, true);
	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	// Disabling SSL Certificate support temporarly
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
	// Execute post
	$result = curl_exec($ch);
	if ($result === FALSE) {
		die('Curl failed: ' . curl_error($ch));
	}
	// Close connection
	curl_close($ch);
	echo "<br />Result=$result";
}

function get_gcm_reg_ids($snum,$dbConn){
	global $DEBUG;
	$query="SELECT device_gcm_id FROM profile";
	$resultset=mysql_query($query,$dbConn);
	if ($DEBUG)
		echo $query;	
	$reg_ids=array();
	while (($row=mysql_fetch_assoc($resultset))!=FALSE){
		$reg_ids[]=$row["device_gcm_id"];//$row;
	}
	mysql_free_result($resultset);
	return $reg_ids;
}

$dbConn=get_db_connection();
if ($dbConn==FALSE){
	$res=array("status"=>"400","msg"=>"Error connecting to database");
	echo json_encode($res);
	exit(0);
}
$snum=$_GET["snum"];
$msg=$_GET["msg"];
echo GOOGLE_API_KEY."<br />";
if (isset($_GET["reg_id"])){
	$regids=array($_GET["reg_id"]);	
}else{
	$regids=get_gcm_reg_ids($snum,$dbConn);
}
print_r($regids);
echo "<br />$msg";
send_notification($regids,$msg);

exit(0);
?>