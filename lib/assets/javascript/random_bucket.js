$(document).ready(function() {
  var interval = setInterval(resetBucket, 5000);
    

    
  $.ajax({
      dataType: 'json',
      url: '/adventures/get_random_adventure',
      success: function(data){
        $("#bucket_title").html(data.title);
        $("#bucket_creator").html(data.creator);
        $("#bucket_image").html("<img class='img_tip' src='" + data.image + "'/>");
      },
      error: function(){
        $("#bucket_title").html("No response.  The server may be down.");
      }
  });

    function resetBucket() {
       $.ajax({
         dataType: 'json',
         url: '/adventures/get_random_adventure',
         success: function(data){
           $("#bucket_title").html(data.title);
           $("#bucket_creator").html(data.ingredients);
           $("#bucket_image").html("<img src='" + data.image + "'/>");
         },
         error: function(){
           $("#bucket_title").html("No response.  The server may be down.");
         }
       });
    };
    
  
});
