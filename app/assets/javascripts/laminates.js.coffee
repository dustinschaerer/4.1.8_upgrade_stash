# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  colors = $('#laminate_color_id').html();
  $('#laminate_series_id').change ->
    series = $('#laminate_series_id :selected').text()
    options = $(colors).filter("optgroup[label='#{series}']").html()
    if options
      $('#laminate_color_id').html(options)
    else 
      $('#laminate_color_id').empty()  

jQuery ->
  drops = $('#laminate_drop').html(); 
# console.log(drops)
  $('#laminate_cover').change ->
    cover = $('#laminate_cover :selected').text()
    console.log(cover)
    options = $(drops).filter("optgroup[label='#{cover}']").html()
    if options
      $('#laminate_drop').html(options)
      if cover == 'Regular Drape'
        $('#laminate_drop').val('8 inch (We Recommend this length for this Regular Drape Cover)')
        return
      if cover == 'Fitted (Hat Box)'
        $('#laminate_drop').val('6 inch (We Recommend this length for the Fitted (Hat Box) Cover)')
        return
    else 
      $('#laminate_drop').empty()  
    