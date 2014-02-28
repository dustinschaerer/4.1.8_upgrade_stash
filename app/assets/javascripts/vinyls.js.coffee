# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  colors = $('#vinyl_color_id').html();
  $('#vinyl_series_id').change ->
    series = $('#vinyl_series_id :selected').text()
    options = $(colors).filter("optgroup[label='#{series}']").html()
    if options
      $('#vinyl_color_id').html(options)
    else 
      $('#vinyl_color_id').empty()  

jQuery ->
  drops = $('#vinyl_drop').html(); 
# console.log(drops)
  $('#vinyl_cover').change ->
    cover = $('#vinyl_cover :selected').text()
    console.log(cover)
    options = $(drops).filter("optgroup[label='#{cover}']").html()
    if options
      $('#vinyl_drop').html(options)
      if cover == 'Regular Drape'
        $('#vinyl_drop').val('8 inch (We Recommend this length for this Regular Drape Cover)')
        return
      if cover == 'Fitted (Hat Box)'
        $('#vinyl_drop').val('6 inch (We Recommend this length for the Fitted (Hat Box) Cover)')
        return
    else 
      $('#vinyl_drop').empty()  
    