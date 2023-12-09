<?php
require('../database.php');
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$database = new Database("localhost", "root", "", "coachstationsystem");
$conn = $database->getConnection();

$id=$_POST['tripId'];

$query = "DELETE FROM trip WHERE TripID=$id;";
$result = $conn->query($query);
if ($result) {
    $success = array('success' => True);
    echo json_encode($success);
} else {
    $errors = array('success' => false, 'errors' => array("Error: " . $query . "<br>" . mysqli_error($conn)));
    echo json_encode($errors);
}

?>