<?php
session_start();
if (!isset($_SESSION["admin"])){
	header("Location: login.php");
	exit();
}

include "../common.php";

$searchText="";

$categories=array();
$conn=get_db_connection();
$ptype="approved";
if (isset($_GET["ptype"])){
	$ptype=$_GET["ptype"];
}

if (isset($_POST["search"]) && trim($_POST["search"])!=""){

	$searchText=$_POST["search"];

$posts_count=0;
$posts_per_page=10;
$current_page=isset($_GET["page"])?$_GET["page"]:1;
$start_post_limit=($current_page-1)*$posts_per_page;
$end_post_limit=$start_post_limit+$posts_per_page;

$query="SELECT COUNT(*) AS cnt FROM posts WHERE post_type='photo'";
if (isset($_GET["category"])){
	$query.=" AND category_id=".$_GET["category"];
}
$query.=" AND approved=1";
if (isset($_POST["search"])){
	$query.=" AND um.title LIKE '%".mysql_real_escape_string($_POST["search"])."%'";
}
$resultset=mysql_query($query,$conn);
$row=mysql_fetch_assoc($resultset);
mysql_free_result($resultset);
$posts_count=$row['cnt'];

$total_pages=($posts_count/$posts_per_page);

$query="SELECT um.* FROM posts um WHERE (post_type='photo' OR post_type='video')";
if (isset($_GET["category"])){
	$query.=" AND category_id=".$_GET["category"];
}
$query.=" AND approved=1";
if (isset($_POST["search"])){
	$query.=" AND um.title LIKE '%".mysql_real_escape_string($_POST["search"])."%'";
}
$query.=" ORDER BY post_dt DESC";
//$query.=" LIMIT ".$start_post_limit.",".$posts_per_page;
$resultset=mysql_query($query,$conn);
$items=array();
while(($row=mysql_fetch_assoc($resultset))!==FALSE){
	$items[]=$row;
}
mysql_free_result($resultset);

$query="SELECT * FROM categories WHERE is_parent=0";
$resultset=mysql_query($query,$conn);
while(($row=mysql_fetch_assoc($resultset))!==FALSE){
	$categories[]=$row;
}
mysql_free_result($resultset);

}

mysql_close($conn);
?>
<html>
	<head>
		<meta http-equiv='Content-Type' content='Type=text/html; charset=utf-8'>
		<meta charset="utf-8"> 
		<title>User Media Items</title>
		<script type="text/javascript">
			function moveCategory(id){
				selCat=document.getElementById('moveCat'+id).value;
				//alert(selCat);
				if (confirm("Are you sure you want to move?")){
					window.location="move_category.php?id="+id+"&status="+selCat;
				}				
			}
		</script>
	</head>
	<body>
	<?php
		include "top_menu.php";
	?>
		<br /><br />
		<form method="POST">
			Search: <input type="text" name="search" style="width: 80%;" value="<?php echo $searchText; ?>" />
			&nbsp;&nbsp;
			<input type="submit" value="Search" />
		</form>
		<?php if (isset($_POST["search"])){ ?>
		<br /><br />
		<h2><?php echo count($items)." posts"; ?></h2>
		<?php }?>

		<?php foreach ($items as $item){?>
			<div style="margin:15px;border-width:1px;border-style:solid;border-color:#787878;">
				<br />
				<?php if ($item["approved"]==1){?>
				<a href="approve_user_item.php?status=0&id=<?php echo $item["id"];?>">Disapprove</a>
				&nbsp;&nbsp;
				<?php if ($item["sticky"]==1){?>
				<a href="make_sticky.php?status=0&id=<?php echo $item["id"];?>">Remove sticky</a>
				<?php }else{?>
				<a href="make_sticky.php?status=1&id=<?php echo $item["id"];?>">Make sticky</a>
				<?php } ?>
				
				<?php }else{?>
				<a href="approve_user_item.php?status=1&id=<?php echo $item["id"];?>">Approve</a>
				<?php }?>
				<br /><br />
				<a href="view_user_media.php?id=<?php echo $item["id"];?>" target="_blank">
					<img src="<?php echo $item["image_url"];?>" width="120" height="120" />
				</a>
				<br />
				<a href="view_user_media.php?id=<?php echo $item["id"];?>" target="_blank">
					<?php echo $item["title"];?>
				</a>
				<br />
				<b>Price: </b>&nbsp;<?php echo $item["price"];?>
				<br />
				<?php echo $item["number"];?>
				<br />
				<a href="delete_user_item.php?id=<?php echo $item["id"];?>">Delete</a>
				<br />
				<select id="moveCat<?php echo $item['id']; ?>">
					<?php foreach ($categories as $cat){ 
						$catSelSel="";
						if ($cat['id']==$item['category_id']){
							$catSelSel=" SELECTED";
						}	
					?>
					<option value="<?php echo $cat['id']; ?>"<?php echo $catSelSel;?>><?php echo $cat['category_name']; ?></option>
					<?php } ?>
				</select>
				&nbsp;
				<button onclick="moveCategory(<?php echo $item['id'] ?>);">Move</button>
			</div>
		<?php }?>
	</body>
</html>