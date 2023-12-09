<?php
require('../database.php');
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$database = new Database("localhost", "root", "", "coachstationsystem");
$conn = $database->getConnection();

$tripCoachId=$_POST["tripCoachId"];
$tripRouteId=$_POST["tripRouteId"];
$tripDiverID=$_POST["tripDiverID"];
$day=(new DateTime($_POST["tripTimeStart"]))->format('Y-m-d');
$time=(new DateTime($_POST["tripTimeStart"]))->format('H:i');
$tripLimitSeat=$_POST["tripLimitSeat"];

$query = "SELECT * FROM coach WHERE CoachID ='$tripCoachId'";
$result = $conn->query($query);
if (!$result->fetch_assoc()) {
    $errors = array('success' => false, 'errors' => 'Mã số xe không tồn tại');
    echo json_encode($errors);
    exit();
}

$query = "SELECT * FROM route WHERE RouteID ='$tripRouteId';";
$result = $conn->query($query);
if (!$result->fetch_assoc()) {
    $errors = array('success' => false, 'errors' => 'Mã số tuyến đường không tồn tại');
    echo json_encode($errors);
    exit();
}

$query = "SELECT * FROM coachemployee WHERE CoachStaffId ='$tripDiverID' AND CoachEmployeeType='Driver';";
$result = $conn->query($query);
if (!$result->fetch_assoc()) {
    $errors = array('success' => false, 'errors' => 'Mã số tài xế không tồn tại');
    echo json_encode($errors);
    exit();
}

$query = "INSERT INTO trip (LimitOfSeat,CoachID,RouteID,DriverID,Date_,Time_)
    VALUES ('$tripLimitSeat', '$tripCoachId', '$tripRouteId', '$tripDiverID', '$day', '$time');";
$result = $conn->query($query);
if ($result) {
    $success = array('success' => True);
    echo json_encode($success);
} else {
    $errors = array('success' => false, 'errors' => array("Error: " . $query . "<br>" . mysqli_error($conn)));
    echo json_encode($errors);

}
exit();
?>