<?php
    require('database.php');
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    $database = new Database("localhost", "root", "", "coachstationsystem");
    $conn = $database->getConnection();

    $companyId = $_POST['CompanyId'];
    $startDate = isset($_POST['dateStart']) ? $_POST['dateStart'] : NULL;
    $endDate = isset($_POST['dateEnd']) ? $_POST['dateEnd'] : NULL;

    // Gọi hàm SQL
    if ($startDate == NULL) {
        if ($endDate == NULL) $query = "SELECT TotalIncomes($companyId, NULL, NULL) AS totalIncome";
        else $query = "SELECT TotalIncomes($companyId, NULL, '$endDate') AS totalIncome";
    } else {
        if ($endDate == NULL) $query = "SELECT TotalIncomes($companyId, '$startDate', NULL) AS totalIncome";
        else $query = "SELECT TotalIncomes($companyId, '$startDate', '$endDate') AS totalIncome";
    }
    
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
        $errorResult = $conn->query("SELECT @error AS error");
        $errorRow = $errorResult->fetch_assoc();
        $errorMessage = $errorRow['error'];

        $errors = array('success' => false, 'errors' => array("Error: " . $errorMessage));
        echo json_encode($errors);
    }
?>
