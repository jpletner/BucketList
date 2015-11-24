$(document).ready(function() {
  var interval = setInterval(resetBucket, 5000);
    
  var userId = $('div.user_id').text()

   
  $.ajax({
      dataType: 'json',
      url: '/users/'+ userId +'/get_random_adventure',
      success: function(data){
        $("#bucket_image").html("<img src='" + data.image + "'/>");
      },
      error: function(){
        $("#bucket_image").html("Check back soon! Bucket List Coming!");
      }
  });

    function resetBucket() {
       $.ajax({
         dataType: 'json',
         url: '/users/'+ userId +'/get_random_adventure',
         success: function(data){
           $("#bucket_image").html("<img src='" + data.image + "'/>");
         },
         error: function(){
           $("#bucket_image").html("Check back soon! Bucket List Coming!");
         }
       });
    };
    
  
});
