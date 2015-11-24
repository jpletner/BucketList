$(document).ready(function() {
  var interval = setInterval(resetBucket, 5000);

  $.ajax({
      dataType: 'json',
      url: '/adventures/get_random_adventure',
      success: function(data){
        $("#bucket_image2").html("<img class='img-responsive featured-bucket' src=" + data.image + "/>");
      },
      error: function(){
        $("#bucket_image2").html("Check back soon! Bucket List Coming!");
      }
  });

    function resetBucket() {
       $.ajax({
         dataType: 'json',
         url: '/adventures/get_random_adventure',
         success: function(data){
           $("#bucket_image2").html("<img class='img-responsive featured-bucket' src=" + data.image + "/>");
         },
         error: function(){
           $("#bucket_image2").html("Check back soon! Bucket List Coming!");
         }
       });
    };
    
  
});
