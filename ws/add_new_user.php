<?php



	//http://stackoverflow.com/questions/18382740/cors-not-working-php
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
	include "../aws.php";
	
    $conn=get_db_connection();

    //http://stackoverflow.com/questions/15485354/angular-http-post-to-php-and-undefined
    $postdata = file_get_contents("php://input");
	if (isset($postdata)) {
		$request = json_decode($postdata);
	//	$username = $request->username;
 
	$usernumber = $request->usernumber;
	$country = $request->country;
	$language = $request->language;

$new  = "select * from profile where phone ='$usernumber'";
$get = mysql_query($new,$conn);
$fetch = mysql_fetch_assoc($get);
$id = $fetch['id'];
$get1 = mysql_num_rows($get);
if($get1>0)
{
   
    
 $query ="update `profile` set `phone` = '$usernumber',`lang` ='$language',`country`='$country' where profile_id ='".$fetch['profile_id']."'";

		$resultset = mysql_query($query,$conn); 
        mysql_close($conn);
}
else
{
$query ="insert into profile(`phone`,`lang`,`country`)values('$usernumber','$language','$country')";

		$resultset = mysql_query($query,$conn);
	
	mysql_free_result($resultset);
	
	mysql_close($conn);

	}
	}
?>