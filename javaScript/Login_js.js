$(document).ready(function () {
    $("#btntoggle").click(function () {
        let txtpasss = $("#txtpass").attr("type");
        if (txtpasss === "password") {
            $("#txtpass").attr("type", "text");

        } else {
            $("#txtpass").attr("type", "password");
        }
    });
})