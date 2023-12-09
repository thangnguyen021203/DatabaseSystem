<?php
require('../database.php');
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$database = new Database("localhost", "root", "", "coachstationsystem");
$conn = $database->getConnection();

// Ensure that the request method is GET
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $query = "SELECT DISTINCT CoachType FROM coach";
    $result = $conn->query($query);
    if ($result) {
        $coachtype = array();

        while ($row = $result->fetch_assoc()) {
            $coachtype[] = $row;
        }
        $success= array('success' => True, 'data' => $coachtype);
        echo json_encode($success);
    } else {
        $errors = array('success' => false, 'errors' => array("Error: " . $query . "<br>" . mysqli_error($conn)));
        echo json_encode($errors);

    }
}
?>