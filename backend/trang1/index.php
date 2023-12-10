<?php
require('../database.php');
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$database = new Database("localhost", "root", "", "coachstationsystem");
$conn = $database->getConnection();

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $query = "SELECT * FROM coachcompany ORDER BY CoachCompanyID";
    $result = $conn->query($query);
    if ($result) {
        $coachcompany = [];
        while ($row = $result->fetch_assoc()) {
            $coachcompany[] = $row;
        }
        $success = array('success' => True, 'data' => $coachcompany);
        echo json_encode($success);
    } else {
        $errors = array('success' => false, 'errors' => array("Error: " . $query . "<br>" . mysqli_error($conn)));
        echo json_encode($errors);
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $DateOfContractRegistration = $_POST["DateOfContractRegistration"];
    $EndDateOfContract = $_POST["EndDateOfContract"];
    $CoachCompanyName = $_POST["CoachCompanyName"];
    $Status = $_POST["Status"];
    $query = "INSERT INTO coachcompany (DateOfContractRegistration,EndDateOfContract,CoachCompanyName,Status)
    VALUES ('$DateOfContractRegistration', '$EndDateOfContract', '$CoachCompanyName', '$Status');";
    $result = $conn->query($query);
    if ($result) {
        $success = array('success' => True);
        echo json_encode($success);
    } else {
        $errors = array('success' => false, 'errors' => array("Error: " . $query . "<br>" . mysqli_error($conn)));
        echo json_encode($errors);
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    $putData = file_get_contents("php://input");
    parse_str($putData, $data);
    $CoachCompanyID = $data["CoachCompanyID"];
    $DateOfContractRegistration = $data["DateOfContractRegistration"];
    $EndDateOfContract = $data["EndDateOfContract"];
    $CoachCompanyName = $data["CoachCompanyName"];
    $Status = $data["Status"];
    $query = "UPDATE coachcompany
    SET
    DateOfContractRegistration = IF('$DateOfContractRegistration' !='', '$DateOfContractRegistration', DateOfContractRegistration),
    EndDateOfContract = IF('$EndDateOfContract' !='', '$EndDateOfContract', EndDateOfContract),
    CoachCompanyName = IF('$CoachCompanyName' !='', '$CoachCompanyName', CoachCompanyName),
    Status = IF('$Status' !='', '$Status', Status)
    WHERE
    CoachCompanyID= $CoachCompanyID;";
    $result = $conn->query($query);
    if ($result) {
        $success = array('success' => True);
        echo json_encode($success);
    } else {
        $errors = array('success' => false, 'errors' => array("Error: " . $query . "<br>" . mysqli_error($conn)));
        echo json_encode($errors);

    }
}

if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    $putData = file_get_contents("php://input");
    parse_str($putData, $data);
    $CoachCompanyID = $data["CoachCompanyID"];
    $query = "DELETE FROM coachcompany WHERE
    CoachCompanyID = $CoachCompanyID;";
    $result = $conn->query($query);
    if ($result) {
        $success = array('success' => True);
        echo json_encode($success);
    } else {
        $errors = array('success' => false, 'errors' => array("Error: " . $query . "<br>" . mysqli_error($conn)));
        echo json_encode($errors);

    }
}
?>