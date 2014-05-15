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

jQuery ->
  $('#line_shape_id').change ->
    shape_text = $('#line_shape_id :selected').text()
    cover_text = $('#line_cover_id :selected').text()
    console.log(shape_text)
    console.log(cover_text)
    if (shape_text == 'Round')
      $("#velcro_booth").hide(500)
    if (shape_text == 'Rectangle')
      if (cover_text != 'Elastic Contour')
        $("#velcro_booth").show(500)
    if (shape_text == 'Square')
      if (cover_text != 'Elastic Contour')
        $("#velcro_booth").show(500)

jQuery ->
  $('#line_cover_id').change ->
    shape_kind = $('#line_shape_id :selected').text()
    cover_kind = $('#line_cover_id :selected').text()
    console.log(shape_kind)
    console.log(cover_kind) 
    if (cover_kind == 'Elastic Contour')
      $("#velcro_booth").hide(500)
      console.log('cover is elastic, so hide #velcro booth')
    else
      if (shape_kind == 'Round')
        $("#velcro_booth").hide(500)
        console.log('cover is not elastic, but shape is round, so hide #velcro booth')
      else
        $("#velcro_booth").show(500)
        console.log('cover is not elastic, and shape is not round, so show #velcro booth')
    if (shape_kind == 'Round')
      $("#velcro_booth").hide(200)
      console.log('shape is not round, so hide #velcro booth')
