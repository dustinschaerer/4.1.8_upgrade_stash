# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  replyString = '\nCustomer Response:'
  text = $("#quote_question").val() 
  $("#quote_question").val($("#quote_question").val() + replyString)
  $("#quote_question").focus()
