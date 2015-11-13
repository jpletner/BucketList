$(document).ready(function ($) {

    $("[name=image_cb]").click(function(){
            $('.toHide').hide();
            $("#image_"+$(this).val()).show('slow');
    });
    
    
});