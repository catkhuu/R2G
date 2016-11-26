$(function() {

  $('.rundown-container').on('click', '#start-new-run-btn', function(event) {
    event.preventDefault();
    var $startButton = $(this);
    var route = $(this).attr('href');
    $.ajax({
      url: route,
      method: 'GET'
    }).done(function(response) {
      $('.run-form').append(response);
      enableMaterialize();
      $startButton.hide();
    })
  });

  $('.rundown-container').on('click', '#find-partner-btn', function(event) {
    event.preventDefault();
    var form = $(this).closest('form');
    var data = $(form).serialize();
    var route = $(form[0]).attr('action');
    $.ajax({
      url: route,
      method: 'POST',
      data: data
    }).done(function(response) {
      alert(response);
      $(form).parent().remove();
    })


  })
});

function enableMaterialize() {
  $('.datepicker').pickadate({
   selectMonths: true,
   selectYears: 15
  });
  $('select').material_select();
}
