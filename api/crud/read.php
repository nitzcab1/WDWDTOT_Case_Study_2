<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../../private/config.php';
include_once '../../private/database.php';
include_once '../../class/personprofile.php';

$database = new Database();
$db = $database->getConnection();
$items = new PersonProfile($db);

$result = null;
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // …
    $getData = $_GET;
    $where_array = array();
    $where_array["profileid"] = isset($getData['id']) ? $getData['id'] : $getData['searchtext'];
    
    $result = $items->GetList($where_array);
    if(!empty($result)){
        $json =array();
        $json["data"] = $result;
        header('content-type: application/json; charset=utf-8');
        echo json_encode($json);
    } else {
        http_response_code(404);
        echo json_encode(
            array("message" => "No records found.")
        );
    }
}else{
    // var_dump($_POST);
    $param = $_POST;
    $postData = $_POST;
    $draw = (isset($postData["draw"]) && !empty($postData["draw"]))? $postData["draw"]: 1;
    $start = (isset($postData["start"]) && !empty($postData["start"]))? $postData["start"]: 0;
    $limit = (isset($postData["limit"]) && !empty($postData["limit"]))? $postData["limit"]: 10;

    $return_data = $items->GetList($postData, $start, $limit, true);
    
    // echo"<pre>";print_r($return_data);die;
    $result = array();
    $result["draw"] = $draw;
    $result["data"] = $return_data["data"];
    $result["recordsFiltered"] = $return_data["total_count"];
    $result["recordsTotal"] = $return_data["total_count"];
    // $result = $items->getall($param);
    header('content-type: application/json; charset=utf-8');
    echo json_encode($result);
}   





?>