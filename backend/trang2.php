<?php
require('database.php');
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
switch($_SERVER['REQUEST_METHOD']){
    case 'GET':
        $reqData = file_get_contents("php://input");
        parse_str($reqData, $data);
        
}
?>