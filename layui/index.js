
window.onload = function () {
    if (sessionStorage.getItem("user") != null) {
        window.parent.document.getElementById("uid").innerHTML = sessionStorage.getItem("user");
        window.parent.document.getElementById("loginTo").innerHTML = "注销";
       // $(location).attr('href', 'default.html');
    }
    var state = window.parent.document.getElementById("loginTo").innerHTML;
    //if (state == "注销") {
    //    parent.window.location.reload();
    //    sessionStorage.clear();
    //}
}