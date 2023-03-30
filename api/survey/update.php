<?php 
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../../private/config.php';
include_once '../../private/database.php';
include_once '../../class/survey.php';

$database = new Database();
$db = $database->getConnection();
$item = new Survey($db);


$item->id = $_POST['id'];
$item->name = $_POST['name'];
$item->gender = $_POST['gender'];
$item->age = $_POST['age'];
$item->mobile = $_POST['mobile'];
$item->body_temp = $_POST['body_temp'];
$item->diagnosed = $_POST['diagnosed'];
$item->encounter = $_POST['encounter'];
$item->vacinated = $_POST['vacinated'];
$item->country_id = $_POST['country_id'];

if($item->update()){
    http_response_code(201);
    echo json_encode("Record updated successfully.");
} else{
    http_response_code(304);
    echo json_encode("Record could not be updated.");
}





?>