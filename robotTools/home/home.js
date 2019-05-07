$(document).ready(function () {
   $('#homeItem').click(function (e) {

   });
    $('#trackerItem').click(function (e) {
        console.log("trackerItem clicked");
        window.open('robotmapper.html');
        return false;
    });
    $('#mapperItem').click(function (e) {
        console.log("mapperItem clicked");
        window.open('drawtool.html');
        return false;
    });
    $('#navigationItem').click(function (e) {

    });
});