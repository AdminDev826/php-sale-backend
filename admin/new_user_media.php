<?php
session_start();
if (!isset($_SESSION["admin"])){
	header("Location: login.php");
	exit();
}

include "../common.php";
include "../aws.php";

$categories=array();

$conn=get_db_connection();

if ($_SERVER["REQUEST_METHOD"]=="POST"){
	$title=$_POST["title"];
	$number=$_POST["number"];
	$url=$_POST["url"];
	$type=$_POST["type"];
	$profile_id=$_POST["profile"];
	$category_id=$_POST["category_id"];
	$price=isset($_POST["price"])?$_POST["price"]:"";
	if (isset($_FILES["media_file"]) && $_FILES["media_file"]["size"]>0){
		$temp = explode(".", $_FILES["media_file"]["name"]);
		$filename = gen_uuid().'.'.end($temp);
		//$filename= gen_uuid();//$_FILES["media_file"]["name"];
		$fullfilepath="user_media/".$filename;
		move_uploaded_file($_FILES["media_file"]["tmp_name"],$fullfilepath);
		$emUrl = "http".(!empty($_SERVER['HTTPS'])?"s":"").
		"://".$_SERVER['SERVER_NAME'].($_SERVER['SERVER_PORT']=='80'?"":(":".$_SERVER['SERVER_PORT'])).$_SERVER['REQUEST_URI'];
		$codeUrl=dirname($emUrl)."/".$fullfilepath;
		$url=$codeUrl;
		/*
		$client = Aws\S3\S3Client::factory(array(
				'version' => 'latest',
				'region'  => 'us-west-2',
				'scheme' => 'http'
		));
		
		echo "s3 object created<br />";
		
		$pathToFile=$fullfilepath;
		$bucket='2sale';
		
		try{
			$result = $client->putObject(array(
					'ACL' => 'public-read',
					'Bucket'     => $bucket,
					'Key'        => time().'_'.$filename,
					'SourceFile' => $pathToFile
			)
			);
			print_r($result);
			echo "<br />";
			$url=$result['ObjectURL'];
			echo "Url: ".$url."<br />";
			unlink($fullfilepath);
			echo "Local file removed<br />";
		}catch(Exception $e){
			echo "Exception in putObject: ".$e->getMessage()."<br />";
			//exit();
		}*/
	}
	$query="INSERT INTO posts(profile_id,title,image_url,post_type,post_dt,post_status,number,category_id,price) VALUES(".$profile_id.",";
	$query.="'".mysql_real_escape_string($title)."','".mysql_real_escape_string($url)."','".mysql_real_escape_string($type)."',NOW(),'active','".mysql_real_escape_string($number)."',".$category_id.",'".mysql_real_escape_string($price)."')";
	mysql_query($query,$conn);
	
	//include "gcm_push.php";
	//send_push("New content added",null);
}

$query="SELECT * FROM categories WHERE is_parent=0";
$resultset=mysql_query($query,$conn);
while(($row=mysql_fetch_assoc($resultset))!==FALSE){
	$categories[]=$row;
}
mysql_free_result($resultset);
echo json_encode($resultset);

mysql_close($conn);

?>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Dashboard</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    

    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.dataTables.css">
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-5.jpg">

    <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text">
                    Dash Tim
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="index.php">
                        <i class="pe-7s-graph"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a href="user_media_items_a.php">
                        <i class="pe-7s-power"></i>
                        <p>Unapproved posts</p>
                    </a>
                </li>
                <li>
                    <a href="user_media_items.php">
                        <i class="pe-7s-angle-down-circle"></i>
                        <p>Approved Posts</p>
                    </a>
                </li>
                <li class="active">
                    <a href="new_user_media.php">
                        <i class="pe-7s-plus"></i>
                        <p>New Post</p>
                    </a>
                </li>
                <li>
                    <a href="categories.php">
                        <i class="pe-7s-menu"></i>
                        <p>Categories</p>
                    </a>
                </li>
                <li>
                    <a href="newcategories.php">
                        <i class="pe-7s-plus"></i>
                        <p>New Category</p>
                    </a>
                </li>
                <li>
                    <a href="notifications.html">
                        <i class="pe-7s-bell"></i>
                        <p>Notifications</p>
                    </a>
                </li>
				
            </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Add new post</a>
                </div>
                <div class="collapse navbar-collapse">
                    
                    <ul class="nav navbar-nav navbar-right">
                        
                        <li>
                            <a href="logout.php">
                                <p>Log out</p>
                            </a>
                        </li>
						<li class="separator hidden-lg hidden-md"></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">New Post</h4>
                            </div>
                            <div class="content">
                                <form method="POST" enctype="multipart/form-data">
            	<input type="hidden" value="0" name="profile" />
				<input type="hidden" name="type" value="photo" />
                    <div class="form-group">
                        <label>Title</label>
                        <input type="text" class="form-control" placeholder="Title" value="" name="title">
                    </div>
                    <div class="form-group">
                        <label>Number</label>
                        <input type="text" class="form-control" placeholder="Number" value="" name="number">
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input type="text" class="form-control" placeholder="Price" value="" name="price">
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <select name="category_id" class="form-control">
							<?php 
								foreach ($categories as $cat){
							?>
							<option value="<?php echo $cat["id"];?>"><?php echo $cat["category_name"];?></option>
							<?php }?>
						</select>
                    </div>
                    <div class="form-group">
                        <label>Url</label>
                        <input type="text" class="form-control" placeholder="Url" value="" name="url">
                    </div>
                    <div class="form-group">
                        <label>File</label>
                        <input type="file" class="form-control" name="media_file" />
                 
                    </div>
                    <button type="submit" class="btn btn-info btn-fill pull-right">Save</button>
                    <div class="clearfix"></div>
                  </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        
                    </div>

                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>
                        <li>
                            <a href="#">
                                
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                
                            </a>
                        </li>
                        <li>
                            <a href="#">
                               
                            </a>
                        </li>
                    </ul>
                </nav>
                <p class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script> <a href="http://www.hatim-haffane.com">Creative Hatim</a>, made with love for a better web
                </p>
            </div>
        </footer>


    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	
  
<script src="assets/js/jquery.dataTables.js"></script>
	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio-switch.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>
    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="assets/js/light-bootstrap-dashboard.js"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>
	

</html>



		