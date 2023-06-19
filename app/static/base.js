$(document).ready(function() {
    $("#search-button").click(function() {
        var userEmail = $("#search-input").val();
        var csrftoken = $("[name=csrfmiddlewaretoken]").val();
        $.ajax({
            url: "/add-connection/",
            type: "POST",
            data: {
                user_email: userEmail
            },
            beforeSend: function(xhr) {
                xhr.setRequestHeader("X-CSRFToken", csrftoken);
            },
            success: function(response) {
                // Handle the response from the Django endpoint
                alert(response.message);
            },
            error: function(xhr) {
                // Handle error
                var response = JSON.parse(xhr.responseText);
                var errorMessage = response.message;
                alert(errorMessage);
            }
        });
        $("#search-input").val("");
    });
});