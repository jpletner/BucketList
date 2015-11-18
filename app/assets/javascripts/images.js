$(document).ready(function () {
    $("[name=image_cb]").click(function(){
            $('.toHide').hide();
            $("#image_"+$(this).val()).show('slow');
    });

    $("#user_pic").click(function(){
      $('.radio-buttons').show();
      $('#cancel').show();
      $("#user_pic").hide();
      $('.profile-pic-submit').show();
    });

    $("#cancel").click(function(){
      $('.radio-buttons').hide();
      $('#cancel').hide();
      $('.toHide2').hide();
      $("#user_pic").show();
      $('.profile-pic-submit').hide();
    });

    $("[name=image_cb2]").click(function(){
      $('.toHide2').hide();
      $("#image_"+$(this).val()).show('slow');
    });

});
