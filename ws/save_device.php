<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

try{

if ($_SERVER["REQUEST_METHOD"]=="POST"){
	$conn=get_db_connection();
	$device_id=$_POST["device_id"];
	$device_os=$_POST["device_os"];
	$phone="+".$_POST["phone"];
	$lang=$_POST["language"];
    $status = 0;
	$free_posts= 2 ;
	$paied_posts= 0 ;
	$updated_date = date("Y-m-d");

	$query0 = "select * from profile where phone = '".$phone."'";

	$phone_exist = mysql_query($query0,$conn);
	if(mysql_num_rows($phone_exist) == 0) {
	    $query="INSERT INTO `profile`( `device_id`, `device_os`, `phone`, `free_posts`, `paied_posts`, `updated_date`, `status`, `lang`) VALUES ('".$device_id."', '".$device_os."', '".$phone."', ".$free_posts.", ".$paied_posts.", '".$updated_date."', ".$status.", '".$lang."')";

		mysql_query($query,$conn);

		$post_id=mysql_insert_id($conn);

		mysql_close($conn);
		$result=array("status"=>200,"profile_id"=>$post_id ,"updated_date"=>$updated_date);
		echo json_encode($result);
		exit();
	} else {
	    mysql_close($conn);
		$result=array("status"=>400,"msg"=>"Sorry this phone number is used, choose a different number");
		echo json_encode($result);
		exit();
	}
	
	
	
}

}catch(Exception $ex){
	$result=array("status"=>400,"msg"=>"Global exception: ".$ex->getMessage());
	echo json_encode($result);
	exit();
}

?>