$(function() {
  $('#new-run-container').on('click', '#search-for-run-btn', function(event) {
    event.preventDefault();
    var $searchBtn = $(this);
    var route = $searchBtn.attr('href');
    $.ajax({
      url: route,
      method: 'GET'
    }).done(function(response) {
      $('div.run-form').append(response);
      enableMaterialize();
      hideButtons();
    })
  });

  $('#rundown_container').on('click', '#find-partner-btn', function(event) {
    event.preventDefault();
    var $searchForm = $(this);
    var data = $searchForm.parent().serialize();
    var route = $searchForm.parent().attr('action');
    var method = $searchForm.parent().attr('method');
    $.ajax({
      url: route,
      type: method,
      data: data
    }).done(function(response) {
      alert(response);
    })
  })
});

function hideButtons() {
  $('#start-new-run-btn').hide();
  $('#search-for-run-btn').hide();
}

function enableMaterialize() {
  $('.datepicker').pickadate({
   selectMonths: true,
   selectYears: 15
  });
  $('select').material_select();
}
