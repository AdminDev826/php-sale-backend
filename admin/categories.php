<?php

function get_extension($name){
	//$ext = strtolower(substr($name , strpos($name , '.') +1));
	$ext = pathinfo($name, PATHINFO_EXTENSION);
	return $ext;
}

session_start();
if (!isset($_SESSION["admin"])){
	header("Location: login.php");
	exit();
}
include "../common.php";
include "../aws.php";

$conn=get_db_connection();
$parent_id=0;

if ($_SERVER["REQUEST_METHOD"]=="POST"){
	$title=$_POST["title"];
	$title_ar=isset($_POST["title_ar"])?$_POST["title_ar"]:"";
	$url=$_POST["url"];
	$parent_id=$_POST["parent"];
	$is_parent=isset($_POST["is_parent"])?$_POST["is_parent"]:0;
	$order=isset($_POST["order"])?$_POST["order"]:0;
	if (isset($_FILES["cat_file"]) && $_FILES["cat_file"]["size"]>0){
		$filename=$_FILES["cat_file"]["name"];
		$fullfilepath="category_images/".$filename;
		//$fileExt=get_extension($filename);
		move_uploaded_file($_FILES["cat_file"]["tmp_name"],$fullfilepath);
		$emUrl = "http".(!empty($_SERVER['HTTPS'])?"s":"").
		"://".$_SERVER['SERVER_NAME'].($_SERVER['SERVER_PORT']=='80'?"":(":".$_SERVER['SERVER_PORT'])).$_SERVER['REQUEST_URI'];
		$codeUrl=dirname($emUrl)."/".$fullfilepath;
		$url=$codeUrl;
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
		}
	}
	$query="INSERT INTO categories(category_name,category_ar_name,image_file,parent_id,is_parent,cat_order) VALUES('".mysql_real_escape_string($title)."','".mysql_real_escape_string($title_ar)."','".mysql_real_escape_string($url)."',".$parent_id.",".$is_parent.",".$order.")";
	mysql_query($query,$conn);
}

$query="SELECT * FROM categories";
if(isset($_GET["parent_id"])){
	$query.=" WHERE parent_id=".$_GET["parent_id"];
}else{
	$query.=" WHERE parent_id=0";
}
//$query.=" ORDER BY category_name";
$query.=" ORDER BY cat_order";
$resultset=mysql_query($query,$conn);
$items=array();
while(($row=mysql_fetch_assoc($resultset))!==FALSE){
	$items[]=$row;
}
mysql_free_result($resultset);

$query="SELECT * FROM categories WHERE is_parent=1";
$query.=" ORDER BY category_name";
$resultset=mysql_query($query,$conn);
$citems=array();
while(($row=mysql_fetch_assoc($resultset))!==FALSE){
	$citems[]=$row;
}
mysql_free_result($resultset);

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
                <li class="active">
                    <a href="user_media_items.php">
                        <i class="pe-7s-angle-down-circle"></i>
                        <p>Approved Posts</p>
                    </a>
                </li>
                <li>
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
                    <a class="navbar-brand" href="#">Users Posts</a>
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
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">inaproved Posts</h4>
                      
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped" id="table_cat">
                                    <thead>
                                        <th>ID</th>
                                    	<th>Image</th>
										<th>Category</th>
										<th>Category (Arabic)</th>
										<th>Order</th>
										<th>Actions</th>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($items as $item){?>
                                        <tr>
                                        	<td><?php echo $item["id"];?></td>
                                        	<td>
											<img src="<?php echo $item["image_file"];?>" width="80" height="80" />
											</td>
                                        	<td><?php echo $item["category_name"];?></td>
                                        	<td><?php echo $item["category_ar_name"];?></td>
                                        	
                                        	<td><?php echo $item["order"];?></td>
                                        	<td width="150px">
                                        	<div class="btn-group">

                                        	<?php if ($item["is_parent"]==1){?>
					&nbsp;
					<a class="btn btn-primary" style="padding: 3px 7px;" href="categories.php?parent_id=<?php echo $item["id"];?>">
						<i class="pe-7s-network" style="font-size: 20px;"></i>
					</a>
					<?php }?>
					&nbsp;&nbsp;
					<a class="btn btn-primary" style="padding: 3px 7px;" href="delete_category.php?id=<?php echo $item["id"];?>"><i class="pe-7s-trash" style="font-size: 20px;"></i></a>
  											
  											
  											
												</div>
                                        	</td>
                                        </tr>
                                    <?php }?>
                                    </tbody>
                                </table>

                            </div>
                        </div>
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
	<script type="text/javascript">
		$(document).ready( function () {
    $('#table_cat').DataTable();
} );
	</script>

</html>


