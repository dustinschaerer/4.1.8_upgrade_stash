# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  colors = $('#line_color_id').html();
  $('#line_series_id').change ->
    series = $('#line_series_id :selected').text()
    options = $(colors).filter("optgroup[label='#{series}']").html()
    if options
      $('#line_color_id').html(options)
      $('#line_color_id').prepend('<option selected="selected">Please select...</option>')
    else 
      $('#line_color_id').empty()  

jQuery ->
  $('#new_line').find('.form-inputs label:first').hide();
  $('#line_quote_product_id').hide();
