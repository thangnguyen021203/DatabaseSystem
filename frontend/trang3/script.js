function CalculateIncome() {
    var data = $("#props").serialize();
    // Gửi dữ liệu đến backend sử dụng AJAX
    $.ajax({
        type: 'POST',
        url: "../../backend/trang3.php", 
        dataType: "json",
        data: data,
        success: function(result) {
            // Hiển thị kết quả trả về lên UI
            console.log('AJAX success');
            console.log(result); // Debug line
            $('.text-success').text('Kết quả: ' + result);
        }
    });
}
