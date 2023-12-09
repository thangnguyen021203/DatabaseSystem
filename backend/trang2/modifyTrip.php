<?php
require('../database.php');
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$database = new Database("localhost", "root", "", "coachstationsystem");
$conn = $database->getConnection();


$tripId = $_POST["tripId"]? $_POST["tripId"]: null;
$day = $_POST["tripTimeStart"]?(new DateTime($_POST["tripTimeStart"]))->format('Y-m-d'):null;
$time = $_POST["tripTimeStart"]?(new DateTime($_POST["tripTimeStart"]))->format('H:i'):null;
$tripLimitSeat = $_POST["tripLimitSeat"]?$_POST["tripLimitSeat"]:null;

if($tripLimitSeat){
  $query = "SELECT * FROM coach INNER JOIN trip ON trip.CoachID=coach.CoachID WHERE TripID ='$tripId' AND coach.NumberOfSeat>='$tripLimitSeat';";
  $result = $conn->query($query);
  if (!$result->fetch_assoc()) {
      $errors = array('success' => false, 'errors' => 'Số lượng chỗ ngồi quá số lượng cho phép');
      echo json_encode($errors);
      exit();
  }
}

$query = "UPDATE trip
SET
  LimitOfSeat = IF('$tripLimitSeat' !='', '$tripLimitSeat', LimitOfSeat),
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