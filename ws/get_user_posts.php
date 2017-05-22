<?php


	if (isset($_SERVER['HTTP_ORIGIN'])) {
        header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Max-Age: 86400');    // cache for 1 day
    }

    // Access-Control headers are received during OPTIONS requests
    if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {

        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
            header("Access-Control-Allow-Methods: GET, POST, OPTIONS");         

        if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
            header("Access-Control-Allow-Headers:        {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

        exit(0);
    }

include "../common.php";

if ($_SERVER["REQUEST_METHOD"]=="POST"){
	$conn=get_db_connection();

	$query="SELECT um.* FROM posts um WHERE approved=1";

    if (isset($_POST["profile_id"])){
		//$query.=" AND profile_id =".$_GET["profile_id"];
        $country = $_REQUEST["country"];
               // $query="SELECT um.* FROM posts um WHERE profile_id = ".$_POST['profile_id']." and country = '$country'";


		$query="SELECT um.* FROM posts um WHERE  country = '$country'";
	}
 
	
	$query.=" ORDER BY um.post_dt DESC";
	//echo $query;
	$resultset=mysql_query($query,$conn);
	$items=array();
	while(($row=mysql_fetch_assoc($resultset))!==FALSE){
		$items[]=$row;	
	}
    
    
    $offerquery = "SELECT id as id,img_url as image_url FROM wantedpost where region='$country'  ORDER BY post_date DESC";
    $resultset1=mysql_query($offerquery,$conn);
	while(($row1=mysql_fetch_assoc($resultset1))!==FALSE){
	   
		$items[]=$row1;	
	}
     
	mysql_free_result($resultset);


	mysql_close($conn);
	
	$result=array("status"=>200,"items"=>$items);
        header('Content-Type: application/json');
	echo json_encode($result);
	if (isset($_GET["api"])){
		exit();
	}
}

?>