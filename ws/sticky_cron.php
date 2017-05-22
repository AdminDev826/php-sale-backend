<?php
header('Access-Control-Allow-Origin: *');

include "../common.php";

	$conn=get_db_connection();
	$query="SELECT um.* FROM posts um WHERE sticky = 1";
	
	$resultset=mysql_query($query,$conn);
	$items=array();
	while(($row=mysql_fetch_assoc($resultset))!==FALSE){
		$items[]=$row;	
	}
	mysql_free_result($resultset);
	
	
	for($a=0;$a<count($items);$a++){
		$itm=$items[$a];
		$post_id = $itm["id"];
		$expiry_date = $itm["sticky_date"];
		$today = time();
		$interval =$today - strtotime($expiry_date);
		$days = floor($interval / 86400); // 1 day
echo '<br>'.$days.'<br>';
		if ($days > 7) {
echo '<br>'.$post_id.'<br>';
			$query2="UPDATE `posts` SET `sticky`= 0 , `sticky_date`= '' WHERE `id` = $post_id ";
			$resultset2 = mysql_query($query2,$conn);
			$stat = 'failed';
			if (mysql_affected_rows() > 0) {
				$stat = 'success';
			}
		}
         
	}
	

	mysql_close($conn);

?>