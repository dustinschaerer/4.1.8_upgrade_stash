# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  replyString = '\nCustomer Response:'
  text = $("#order_question").val() 
  $("#order_question").val($("#order_question").val() + replyString)
  $("#order_question").focus()

jQuery ->
  regions = $('#order_state').html()
  console.log(regions)
  $('#order_country').change ->
    country = $('#order_country :selected').text()
    console.log(country)
    options = $(regions).filter("optgroup[label='#{country}']").html()
    if options
      $('#order_state').html(options)
      $('#order_state').prepend('<option selected="selected">Please select...</option>')
    else  
      $('#order_state').empty()
     
