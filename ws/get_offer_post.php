<?php
header('Access-Control-Allow-Origin: *');

	include "../common.php";


	$conn=get_db_connection();
    $country = $_REQUEST['country'];
    $profile = $_REQUEST['profile'];

	$query="SELECT * FROM wantedpost where profile_id='$profile' and region='$country' ORDER BY post_date DESC";	

	
	//echo $query;
	$resultset=mysql_query($query,$conn);
    $count = mysql_num_rows($resultset);
	

    if($count>0)
    {
        
    	$items=array();
	while(($row=mysql_fetch_assoc($resultset))!==FALSE){
		$items[]=$row;	
                
	}
    }
    else
    {
     $items[]=array('img_url'=>'http:\/\/sale4allz.com\/admin\/user_media\/no-photo.png');	   
    }
	mysql_free_result($resultset);

	mysql_close($conn);
	
	$result=array("status"=>200,"item"=>$items);
        header('Content-Type: application/json');
	echo json_encode($result);
?>