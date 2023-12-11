<?php
    require('database.php');
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    $database = new Database("localhost", "root", "", "coachstationsystem");
    $conn = $database->getConnection();

    $companyId = $_POST['CompanyId'];
    $startDate = $_POST['dateStart'];
    $endDate = $_POST['dateEnd'];

    // echo "Company ID: $companyId, Start Date: $startDate, End Date: $endDate"; // Debug line

    // Gọi hàm SQL
    $query = "SELECT TotalIncomes($companyId, '$startDate', '$endDate') AS totalIncome";
    $result = $conn->query($query);

    // Xử lý kết quả và trả về cho frontend
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
?>
