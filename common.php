<?php

$DEBUG=FALSE;
error_reporting(E_ALL);

define('SYSTEM_PROFILE_NAME','fire');
define('SYSTEM_PROFILE_ID',0);

function get_db_connection(){
    $deploy=FALSE;
    if ($deploy==FALSE){
        $server="localhost";
		$user="root";
		$password="";
		$database="sale4all";
    }else{
        $server="localhost";
		$user="root";
		$password="";
		$database="sale4all";
    }

    $conn=mysql_connect($server,$user,$password);
    if ($conn!=FALSE){
        mysql_select_db($database);
    }    
    return $conn;
}

function buildTree(array &$elements, $parentId = 0) {

    $branch = array();    
    foreach ($elements as $element) {
        if ($element['parent_id'] == $parentId) {
            $children = buildTree($elements, $element['id']);
            if ($children) {
                $element['tree'] = $children;
            }
            $branch[] = $element;
        }
    }
    return $branch;
}

function gen_uuid() {
    return sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
        // 32 bits for "time_low"
        mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),

        // 16 bits for "time_mid"
        mt_rand( 0, 0xffff ),

        // 16 bits for "time_hi_and_version",
        // four most significant bits holds version number 4
        mt_rand( 0, 0x0fff ) | 0x4000,

        // 16 bits, 8 bits for "clk_seq_hi_res",
        // 8 bits for "clk_seq_low",
        // two most significant bits holds zero and one for variant DCE1.1
        mt_rand( 0, 0x3fff ) | 0x8000,

        // 48 bits for "node"
        mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff )
    );
}

?>