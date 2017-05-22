<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

if ($_SERVER["REQUEST_METHOD"]=="GET"){
	$conn=get_db_connection();

	$post_id = 0 ;
	if (isset($_GET["post_id"])){
		$post_id = $_GET["post_id"];
	}


	$query="DELETE FROM posts WHERE id=".$post_id;
	
	//echo $query;
	$resultset = mysql_query($query,$conn);
	$stat = 'success';
	

	mysql_free_result($resultset);
	mysql_close($conn);

	$result=array("status"=>200,"device"=>$stat);
        header('Content-Type: application/json');
	echo json_encode($result);
	exit();
	
}

?>