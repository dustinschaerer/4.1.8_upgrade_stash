#= require jquery
#= require best_in_place
#= require jquery.purr
#= require best_in_place.purr
#= require active_admin/base

jQuery ->
  $(".best_in_place").best_in_place()


jQuery ->
  $('#content_wrapper').prepend( '<div id="adminlogo"></div>')
  $('#content_wrapper h2').html( 'Americo Administrator Login')
