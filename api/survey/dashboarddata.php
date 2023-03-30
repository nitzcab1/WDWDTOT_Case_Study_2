<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");

include_once '../../private/config.php';
include_once '../../private/database.php';
include_once '../../class/survey.php';

$database = new Database();
$db = $database->getConnection();
$item = new Survey($db);

$result = $item->getdashboarddata();

if($result){
    $json = array();
    $json["data"] = $result;

    header('content-type: application/json; charset=utf-8');
    echo json_encode($json);
}else {
    http_response_code(404);
    echo json_encode(
        array("message" => "No records found.")
    );
}

?>