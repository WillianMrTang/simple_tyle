$(function () {
        $("#moving1").click(function () {
            $("#fabiao").slideToggle();
        })
        $("#moving2").click(function () {
            $("#shoucang").slideToggle();
        })
        $("#moving3").click(function () {
            $("#moving3").replaceWith("<i class='fa fa-toggle-on fa-3x' style='color: deepskyblue' id='moving3'>")
            $("#honour").slideDown(function () {
            });
        })
    })