$(function() {
  $(".example.stopwatch").TimeCircles( {start: false}, { time: { Days: { show: false }, Hours: { show: false } }});
  $(".start").click(function(){ $(".example.stopwatch").TimeCircles().start(); });
  $(".stop").click(function(){ $(".example.stopwatch").TimeCircles().stop(); });
  $(".restart").click(function(){ $(".example.stopwatch").TimeCircles().restart(); });
});
