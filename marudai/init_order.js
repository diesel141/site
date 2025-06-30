$(document).ready( function() {
    initOrderDate();
    $('#remarks').css('height', $('#remarks_title').get(0).offsetHeight - 50);
});

function initOrderDate() {
    var now = new Date();
    $("#year").text(now.getFullYear());
    $("#month").text(now.getMonth() + 1);
    $("#day").text(now.getDate());
};
