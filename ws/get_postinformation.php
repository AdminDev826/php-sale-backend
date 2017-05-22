<?php
	header('Access-Control-Allow-Origin: *');

	include "../common.php";			
	

	$conn=get_db_connection();
	
	$country = $_REQUEST['Country'];
	//$category_id = $_POST["category_id"];
			
	if (isset( $_POST["category_id"]))
	{	
		$query="SELECT * FROM posts  WHERE category_id ='".$_POST["category_id"]."' and country='$country' ORDER BY post_dt DESC";
	}
	//echo $query;
	
	$resultset=mysql_query($query,$conn);
	$items=array();
	
	while(($row=mysql_fetch_assoc($resultset))!==FALSE){
		$items[]=$row;	
	}
	mysql_free_result($resultset);


	mysql_close($conn);
	
	$result=array("status"=>200,"items"=>$items);

	echo json_encode($result);
?>