$(function() {
  $(".example.stopwatch").TimeCircles({ time: { Days: { show: false }, Hours: { show: false } }});
  $(".start").click(function(){ $(".example.stopwatch").TimeCircles().start(); });
  $(".stop").click(function(){ $(".example.stopwatch").TimeCircles().stop(); });
  $(".restart").click(function(){ $(".example.stopwatch").TimeCircles().restart(); });
});
