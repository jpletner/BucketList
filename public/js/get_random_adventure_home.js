$(document).ready(function() {
  var interval = setInterval(resetBucket, 5000);

  $.ajax({
      dataType: 'json',
      url: '/adventures/get_random_adventure',
      success: function(data){
        $("#bucket_title").html(data.title);
        $("#bucket_creator").html(data.creator);
        $("#bucket_image2").html("<img class='img-responsive featured-bucket' src=" + data.image + "/>");
      },
      error: function(){
        $("#bucket_title").html("Check back soon! Bucket List Coming!");
      }
  });

    function resetBucket() {
       $.ajax({
         dataType: 'json',
         url: '/adventures/get_random_adventure',
         success: function(data){
           $("#bucket_title").html(data.title);
           $("#bucket_creator").html(data.ingredients);
           $("#bucket_image2").html("<img class='img-responsive featured-bucket' src=" + data.image + "/>");
         },
         error: function(){
           $("#bucket_title").html("Check back soon! Bucket List Coming!");
         }
       });
    };
    
  
});
