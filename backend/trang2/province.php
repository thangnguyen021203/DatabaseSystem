<?php
require('../database.php');
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$database = new Database("localhost", "root", "", "coachstationsystem");
$conn = $database->getConnection();

// Ensure that the request method is GET
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $query = "SELECT ProvinceID, ProvinceCityName FROM province_city";
    $result = $conn->query($query);
    if ($result) {
        $province = array();

        while ($row = $result->fetch_assoc()) {
            $province[] = $row;
        }
        $success= array('success' => True, 'data' => $province);
        echo json_encode($success);
    } else {
        $errors = array('success' => false, 'errors' => array("Error: " . $query . "<br>" . mysqli_error($conn)));
        echo json_encode($errors);

    }
}
?>