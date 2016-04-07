$(document).ready(function(){
  var clip = new ZeroClipboard($(".clip_button"));
  $(".clip_button").click(function() {
    clip = new ZeroClipboard($(".clip_button"));

    $(".copied").fadeIn(300);
    $(".copied").fadeOut(5000);

  });
});