function showCoachCompany() {
  $.ajax({
    url: "../../backend/trang1/index.php",
    type: "GET",
    dataType: "json",
    success: function (strdata) {
      if (strdata.success) {
        var result = $("#result");
        result.empty();
        strdata.data.forEach(function (value) {
          result.append(
            `
            <tr>
              <td>${value.CoachCompanyID}</td>
              <td>${value.DateOfContractRegistration}</td>
              <td>${value.EndDateOfContract}</td>
              <td>${value.CoachCompanyName}</td>
              <td>${value.Status}</td>
            </tr>
            `
          );
        });
      } else {
        alert(strdata.errors);
      }
    },
  });
}

function addCoachCompany() {
  if (checkFormCreate()) {
    var data = $("#formCoachCompany").serialize();
    $.ajax({
      url: "../../backend/trang1/index.php",
      type: "POST",
      datatype: "json",
      data: data,
      success: function (strdata) {
        if (strdata.success) {
          showCoachCompany();
          $("#formCoachCompany").trigger("reset");
        } else {
          alert(strdata.errors);
        }
      },
      error: function (xhr, status, error) {
        console.error("Error:", status, error);
      },
    });
  } else {
    alert("Hãy nhập đầy đủ thông tin");
  }
}

function modifyCoachCompany() {
  var data = $("#formCoachCompany").serialize();
  $.ajax({
    url: "../../backend/trang1/index.php",
    type: "PUT",
    datatype: "json",
    data: data,
    success: function (strdata) {
      if (strdata.success) {
        showCoachCompany();
        $("#formCoachCompany").trigger("reset");
      } else {
        alert(strdata.errors);
      }
    },
    error: function (xhr, status, error) {
      console.error("Error:", status, error);
    },
  });
}

function deleteCoachCompany() {
    var data = $("#formCoachCompany").serialize();
    $.ajax({
      url: "../../backend/trang1/index.php",
      type: "DELETE",
      datatype: "json",
      data: data,
      success: function (strdata) {
        if (strdata.success) {
          showCoachCompany();
          $("#formCoachCompany").trigger("reset");
        } else {
          alert(strdata.errors);
        }
      },
      error: function (xhr, status, error) {
        console.error("Error:", status, error);
      },
    });
  }

function add() {
  $(".modify").hide();
  $(".delete").hide();
  $(".add").show();
}
function modify() {
  $(".add").hide();
  $(".delete").hide();
  $(".modify").show();
}
function deletee() {
  $(".add").hide();
  $(".modify").hide();
  $(".delete").show();
}

function checkFormCreate() {
  var isFilled = true;
  $("#formCoachCompany input").each(function () {
    if ($(this).val() == "" && $(this).attr("name") != "CoachCompanyID") {
      isFilled = false;
      return false;
    }
  });
  return isFilled;
}

$(document).ready(function () {
  showCoachCompany();
});
