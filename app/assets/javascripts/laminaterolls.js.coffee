# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  colors = $('#laminateroll_color_id').html();
  $('#laminateroll_series_id').change ->
    series = $('#laminateroll_series_id :selected').text()
    options = $(colors).filter("optgroup[label='#{series}']").html()
    if options
      $('#laminateroll_color_id').html(options)
    else 
      $('#laminateroll_color_id').empty()  
