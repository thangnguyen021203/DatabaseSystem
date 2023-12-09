<?php
require('../database.php');
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$database = new Database("localhost", "root", "", "coachstationsystem");
$conn = $database->getConnection();

$tripId = $_POST["tripId"]? $_POST["tripId"]: null;
$tripCoachId = $_POST["tripCoachId"]? $_POST["tripCoachId"]: null;
$tripRouteId = $_POST["tripRouteId"]? $_POST["tripRouteId"]: null;
$tripDiverID = $_POST["tripDiverID"]? $_POST["tripDiverID"]: null;
$day = $_POST["tripTimeStart"]?(new DateTime($_POST["tripTimeStart"]))->format('Y-m-d'):null;
$time = $_POST["tripTimeStart"]?(new DateTime($_POST["tripTimeStart"]))->format('H:i'):null;
$tripLimitSeat = $_POST["tripLimitSeat"]?$_POST["tripLimitSeat"]:null;

if($tripCoachId){
    $query = "SELECT * FROM coach WHERE CoachID ='$tripCoachId'";
    $result = $conn->query($query);
    if (!$result->fetch_assoc()) {
        $errors = array('success' => false, 'errors' => 'Mã số xe không tồn tại');
        echo json_encode($errors);
        exit();
    }
}

if($tripRouteId){
    $query = "SELECT * FROM route WHERE RouteID ='$tripRouteId';";
    $result = $conn->query($query);
    if (!$result->fetch_assoc()) {
        $errors = array('success' => false, 'errors' => 'Mã số tuyến đường không tồn tại');
        echo json_encode($errors);
        exit();
    }
}

if($tripDiverID){
    $query = "SELECT * FROM coachemployee WHERE CoachStaffId ='$tripDiverID' AND CoachEmployeeType='Driver';";
    $result = $conn->query($query);
    if (!$result->fetch_assoc()) {
        $errors = array('success' => false, 'errors' => 'Mã số tài xế không tồn tại');
        echo json_encode($errors);
        exit();
    }
}

$query = "UPDATE trip
SET
  LimitOfSeat = IF('$tripLimitSeat' !='', '$tripLimitSeat', LimitOfSeat),
  CoachID = IF('$tripCoachId' !='', '$tripCoachId', CoachID),
  RouteID = IF('$tripRouteId' !='', '$tripRouteId', RouteID),
  DriverID = IF('$tripDiverID' !='', '$tripDiverID', DriverID),
  Date_ = IF('$day' !='', '$day', Date_),
  Time_ = IF('$time' !='', '$time', Time_)
WHERE
  TripID= $tripId;";
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