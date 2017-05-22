<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

	$conn=get_db_connection();
	$query="SELECT um.* FROM profile um";
	
	$resultset=mysql_query($query,$conn);
	$items=array();
	while(($row=mysql_fetch_assoc($resultset))!==FALSE){
		$items[]=$row;	
	}
	mysql_free_result($resultset);
	
	
	for($a=0;$a<count($items);$a++){
		$itm=$items[$a];
		$profile_id = $itm["profile_id"];
		$expiry_date = $itm["updated_date"];
		$today = time();
		$today_date = date("Y-m-d");
		$interval = $today - strtotime($expiry_date);
		$days = floor($interval / 86400); // 1 day
		if ($days > 30) {
echo '<br>'.$profile_id.'<br>';
			$query2="UPDATE `profile` SET `free_posts`= 2 , `updated_date`= '".$today_date."' WHERE `profile_id` = $profile_id ";
			$resultset2 = mysql_query($query2,$conn);
			$stat = 'failed';
			if (mysql_affected_rows() > 0) {
				$stat = 'success';
			}
		}
	}
	

	mysql_close($conn);

?>