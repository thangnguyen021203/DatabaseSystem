<?php
require('../database.php');
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$database = new Database("localhost", "root", "", "coachstationsystem");
$conn = $database->getConnection();

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $query = "SELECT CoachCompanyID, CoachCompanyName FROM coachcompany";
    $result = $conn->query($query);
    if ($result) {
        $coachcompany = array();

        while ($row = $result->fetch_assoc()) {
            $coachcompany[] = $row;
        }
        $success= array('success' => True, 'data' => $coachcompany);
        echo json_encode($success);
    } else {
        $errors = array('success' => false, 'errors' => array("Error: " . $query . "<br>" . mysqli_error($conn)));
        echo json_encode($errors);

    }
}
?>