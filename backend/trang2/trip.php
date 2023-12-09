<?php
require('../database.php');
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$database = new Database("localhost", "root", "", "coachstationsystem");
$conn = $database->getConnection();

$districtStart = $_POST['districtStart'] ?? null;

$provinceStart = $_POST['provinceStart'] ?? null;
$districtEnd = $_POST['districtEnd'] ?? null;
$provinceEnd = $_POST['provinceEnd'] ?? null;

$dayStart = (new DateTime($_POST['timeStart']))->format('Y-m-d');
$timeStart = (new DateTime($_POST['timeStart']))->format('H:i');
$dayEnd = (new DateTime($_POST['timeEnd']))->format('Y-m-d');
$timeEnd = (new DateTime($_POST['timeEnd']))->format('H:i');
$filterCompany = isset($_POST['filterCompany']) && !empty($_POST['filterCompany']) ? $_POST['filterCompany'] : null;
$filterCoachType = isset($_POST['filterCoachType']) && !empty($_POST['filterCoachType']) ? $_POST['filterCoachType'] : null;

$query = "CALL information_trip('$districtStart','$provinceStart','$districtEnd','$provinceEnd','$dayStart','$timeStart','$dayEnd','$timeEnd','$filterCompany','$filterCoachType')";
$result = $conn->query($query);


if($result) {
    $trip = array();

    while($row = $result->fetch_assoc()) {
        $trip[] = $row;
    }

    echo json_encode(array('success' => true, 'data' => $trip));
} else {
    $error = "Error: ".$query."<br>".mysqli_error($conn);
    echo json_encode(array('success' => false, 'errors' => array(mysqli_real_escape_string($conn, $error))));
}

?>