function CalculateIncome() {
    var data = $("#props").serialize();
    // Gửi dữ liệu đến backend sử dụng AJAX

    $.ajax({
        type: 'POST',
        url: "../../backend/trang3.php", 
        dataType: "json",
        data: data,
        success: function(strdata) {
            if (strdata.success) {
                $("#result").empty();
                $("#result").append(`Total Income: ${strdata.data[0]["totalIncome"]}`);
              } else {
                alert(strdata.errors);
              }
        }
    });
}
    