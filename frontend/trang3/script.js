function CalculateIncome() {
    var companyId = $("#CompanyId").val();
    var dateStart = $("#dateStart").val();
    var dateEnd = $("#dateEnd").val();

    // Chuyển đổi giá trị thành kiểu date và xử lý giá trị rỗng
    var startDate = dateStart ? new Date(dateStart) : null;
    var endDate = dateEnd ? new Date(dateEnd) : null;

    // Format ngày theo định dạng YYYY-MM-DD
    startDate = startDate ? startDate.toISOString().split('T')[0] : null;
    endDate = endDate ? endDate.toISOString().split('T')[0] : null;

    var data = {
        CompanyId: companyId,
        dateStart: startDate,
        dateEnd: endDate
    };
    
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
                alert(`${strdata.errors[0]}`);
              }
        }
    });
}
    