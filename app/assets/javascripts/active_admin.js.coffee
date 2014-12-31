#= require jquery
#= require best_in_place
#= require jquery-ui
#= require best_in_place.jquery-ui
#= require jquery.purr
#= require best_in_place.purr
#= require active_admin/base

jQuery ->
  $('.best_in_place').best_in_place()

jQuery ->
  $(".best_in_place").bind "ajax:success", ->
    $(this).closest("tr").effect "highlight"

  $(document).on "best_in_place:error", (event, request, error) ->

	  # Display all error messages from server side validation
	  response = $.parseJSON(request.responseText)
	  $.each response["errors"], (index, value) ->
	    if value.length > 0
	      value = index + " " + value.toString()  if typeof (value) is "object"
	      container = $("<span class='flash-error'></span>").html(value)
	      container.purr()

jQuery ->
  $('#content_wrapper').prepend( '<div id="adminlogo"></div>')
  $('#content_wrapper h2').html( 'Americo Administrator Login')
