<?php
    require('database.php');
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    $database = new Database("localhost", "root", "", "coachstationsystem");
    $conn = $database->getConnection();

    $companyId = $_POST['CompanyId'];
    $startDate = $_POST['dateStart'];
    $endDate = $_POST['dateEnd'];

    echo "Company ID: $companyId, Start Date: $startDate, End Date: $endDate"; // Debug line

    // Gọi hàm SQL
    $query = "SELECT TotalIncomes($companyId, '$startDate', '$endDate') AS totalIncome";
    $result = $conn->query($query);

    // Xử lý kết quả và trả về cho frontend
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo json_encode(['result' => $row['totalIncome']]);
    } else {
        echo "0.00";
    }
?>
