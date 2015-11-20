
$(document).ready(function() {

  $("#owl-demo").owlCarousel({

      // autoPlay: 3000, //Set AutoPlay to 3 seconds

      items : 4,
      itemsDesktop : [1199,4],
      itemsDesktopSmall : [979,4]

  });

  $("#my_key").click(function(){
      $("#my_sm_buttons").toggle();
  });


});
