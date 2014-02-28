# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  colors = $('#upholsteryroll_color_id').html();
  $('#upholsteryroll_series_id').change ->
    series = $('#upholsteryroll_series_id :selected').text()
    options = $(colors).filter("optgroup[label='#{series}']").html()
    if options
      $('#upholsteryroll_color_id').html(options)
    else 
      $('#upholsteryroll_color_id').empty() 