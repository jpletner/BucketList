$(document).ready(function() {
  function hideHeadline() {
    var windowWidth = $(window).width();

    if (windowWidth < 640) {
      $("#headline-text").hide();
      $("#mainCarousel").hide();
        }
    else if (windowWidth < 900){
      $("#sign-in-main-page").hide();
      }
    else if (windowWidth >= 640){
      $("#headline-text").show();
      $("#mainCarousel").show();
      }
    else if (windowWidth >= 900){
      $("#sign-in-main-page").css("display", "block");
      }
    }
  hideHeadline();
  $(window).resize(hideHeadline);


});
