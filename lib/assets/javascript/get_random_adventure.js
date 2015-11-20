$(document).ready(function() {
  var interval = setInterval(resetBucket, 5000);
    
  var userId = $('div.user_id').text()

   
  $.ajax({
      dataType: 'json',
      url: '/users/'+ userId +'/get_random_adventure',
      success: function(data){
        $("#bucket_title").html(data.title);
        $("#bucket_creator").html(data.creator);
        $("#bucket_image").html("<img src='" + data.image + "'/>");
      },
      error: function(){
        $("#bucket_title").html("Check back soon! Bucket List Coming!");
      }
  });

    function resetBucket() {
       $.ajax({
         dataType: 'json',
         url: '/users/'+ userId +'/get_random_adventure',
         success: function(data){
           $("#bucket_title").html(data.title);
           $("#bucket_creator").html(data.ingredients);
           $("#bucket_image").html("<img src='" + data.image + "'/>");
         },
         error: function(){
           $("#bucket_title").html("Check back soon! Bucket List Coming!");
         }
       });
    };
    
  
});
