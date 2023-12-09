var adminB = 0;
function showCreateForm() {
  var $createForm = $("#create-form");
  var $searchTrip = $("#searchTrip");

  $createForm.css({
    opacity: "1",
    "pointer-events": "all",
  });

  $searchTrip.css({
    opacity: "0.2",
    "pointer-events": "none",
  });
}

function turnOffCreateForm() {
  var $createForm = $("#create-form");
  var $searchTrip = $("#searchTrip");

  $createForm.css({
    opacity: "0",
    "pointer-events": "none",
  });

  $searchTrip.css({
    opacity: "1",
    "pointer-events": "all",
  });
}

function showModifyForm(id) {
  $("#MtripId").val(id);
  var $modfiyForm = $("#modify-form");
  var $searchTrip = $("#searchTrip");

  $modfiyForm.css({
    opacity: "1",
    "pointer-events": "all",
  });

  $searchTrip.css({
    opacity: "0.2",
    "pointer-events": "none",
  });
}

function turnOffModifyForm() {
  var $modfiyForm = $("#modify-form");
  var $searchTrip = $("#searchTrip");

  $modfiyForm.css({
    opacity: "0",
    "pointer-events": "none",
  });

  $searchTrip.css({
    opacity: "1",
    "pointer-events": "all",
  });
}

function customer() {
  adminB = 0;
  $(".admin").css({
    display: "none",
  });
}

function admin() {
  adminB = 1;
  $(".admin").show();
}

function chooseProvince() {
  $.ajax({
    url: "../../backend/trang2/province.php",
    type: "GET",
    dataType: "json",
    success: function (strdata) {
      if (strdata.success) {
        var data = strdata.data;
        var selectOptions = $("#provinceEnd");
        data.forEach(function (value) {
          selectOptions.append(
            `<option value="${value.ProvinceCityName}">${value.ProvinceCityName}</option>`
          );
        });
      }
    },
  });
}

function chooseCoachCompany() {
  $.ajax({
    url: "../../backend/trang2/company.php",
    type: "GET",
    dataType: "json",
    success: function (strdata) {
      if (strdata.success) {
        var data = strdata.data;
        var selectOptions = $("#filterCompany");
        data.forEach(function (value) {
          selectOptions.append(
            `<option value="${value.CoachCompanyName}">${value.CoachCompanyName}</option>`
          );
        });
      }
    },
  });
}

$("#provinceEnd").change(function () {
  var selectedProvinceName = $("#provinceEnd").val();

  $.ajax({
    url: `../../backend/trang2/district.php?ProvinceName='${selectedProvinceName}'`,
    type: "GET",
    dataType: "json",
    success: function (strdata) {
      if (strdata.success) {
        var data = strdata.data;
        var selectOptions = $("#districtEnd");
        selectOptions.empty();
        selectOptions.append(`<option selected>Chọn huyện</option>`);
        data.forEach(function (value) {
          selectOptions.append(
            `<option value="${value.DistrictName}">${value.DistrictName}</option>`
          );
        });
      }
    },
  });
});

function coachtype() {
  $.ajax({
    url: `../../backend/trang2/coachtype.php`,
    type: "GET",
    dataType: "json",
    success: function (strdata) {
      if (strdata.success) {
        var data = strdata.data;
        var selectOptions = $("#filterCoachType");
        selectOptions.empty();
        selectOptions.append(`<option value="" selected>Tất cả</option>`);
        data.forEach(function (value) {
          selectOptions.append(
            `<option value="${value.CoachType}">${value.CoachType}</option>`
          );
        });
      }
    },
  });
};

function searchTrip() {
  var formData = {
    districtStart: $("#districtStart").val(),
    provinceStart: $("#provinceStart").val(),
    districtEnd: $("#districtEnd").val(),
    provinceEnd: $("#provinceEnd").val(),
    timeStart: $("#timeStart").val(),
    timeEnd: $("#timeEnd").val(),
    filterCompany: $("#filterCompany").val(),
    filterCoachType: $("#filterCoachType").val(),
  };

  $.ajax({
    url: "../../backend/trang2/trip.php",
    type: "POST",
    dataType: "json",
    data: formData,
    success: function (strdata) {
      if (strdata.success) {
        var data = strdata.data;
        var result = $("#result");
        result.empty();
        data.forEach(function (value) {
          result.append(
            `<tr>
            <td class="admin" style="display: none;">${value.TripID}</td>
            <td>${value.CoachCompanyName}</td>
            <td>${value.CoachType}</td>
            <td>${value.Time_}</td>
            <td>${value.Date_}</td>
            <td>${value.Cost}</td>
            <td>${value.RemainingNoTicket}</td>
            <td class="admin" style="display: none;">
            <button type="button" class="btn btn-warning" onclick="showModifyForm(${value.TripID});">Sửa</button>
            <button type="button" class="btn btn-danger" onclick="deleteTrip(${value.TripID});">Xóa</button>
            </td>
            </tr>`
          );
        });
        if (adminB == 1) admin();
      } else {
        elert(strdata.errors);
      }
    },
  });
}

function createTrip() {
  var formData = $("#formCreate").serialize();
  $.ajax({
    url: "../../backend/trang2/createTrip.php",
    type: "POST",
    dataType: "json",
    data: formData,
    success: function (strdata) {
      if (strdata.success) {
        turnOffCreateForm();
        searchTrip();
        $("#formCreate").trigger("reset");
      } else {
        alert(strdata.errors);
      }
    },
  });
}

function modifyTrip() {
  var formData = $("#formModify").serialize();
  $.ajax({
    url: "../../backend/trang2/modifyTrip.php",
    type: "POST",
    dataType: "json",
    data: formData,
    success: function (strdata) {
      if (strdata.success) {
        turnOffModifyForm();
        searchTrip();
        $("#formModify").trigger("reset");
      } else {
        alert(strdata.errors);
      }
    },
  });
}

function deleteTrip(id) {
  $.ajax({
    url: "../../backend/trang2/deleteTrip.php",
    type: "POST",
    dataType: "json",
    data: {tripId:id},
    success: function (strdata) {
      searchTrip();
    },
  });
}

$(document).ready(function () {
  turnOffCreateForm();
  turnOffModifyForm();
  chooseProvince();
  chooseCoachCompany();
  coachtype();
});

function tableAfterCreate() {
  if (checkFormCreate()) {
    createTrip();
  } else {
    alert("Hãy điền đầy đủ thông tin");
  }
}

function tableAfterModify() {
  modifyTrip();
}

function checkFormCreate() {
  var isFilled = true;
  $("#create-form input").each(function () {
    if ($(this).val() == "") {
      isFilled = false;
      return isFilled;
    }
  });
  return isFilled;
}
