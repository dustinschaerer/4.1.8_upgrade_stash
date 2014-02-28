# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  colors = $('#vinylcut_color_id').html();
  $('#vinylcut_series_id').change ->
    series = $('#vinylcut_series_id :selected').text()
    options = $(colors).filter("optgroup[label='#{series}']").html()
    if options
      $('#vinylcut_color_id').html(options)
    else 
      $('#vinylcut_color_id').empty()  