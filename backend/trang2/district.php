<?php
require('../database.php');
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$database = new Database("localhost", "root", "", "coachstationsystem");
$conn = $database->getConnection();

// Ensure that the request method is GET
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $provinceName=$_GET["ProvinceName"];
    $query = "SELECT DistrictID, DistrictName FROM district INNER JOIN province_city ON district.ProvinceID = province_city.ProvinceID WHERE ProvinceCityName=$provinceName";
    $result = $conn->query($query);
    if ($result) {
        $district = array();

        while ($row = $result->fetch_assoc()) {
            $district[] = $row;
        }
        $success= array('success' => True, 'data' => $district);
        echo json_encode($success);
    } else {
        $errors = array('success' => false, 'errors' => array("Error: " . $query . "<br>" . mysqli_error($conn)));
        echo json_encode($errors);

    }
}
?>