# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $("#make_same_address").change ->
    if @checked
      $("#purchase_pay_firstname").prop('readonly', true)
      $("input#purchase_pay_firstname")
      $('input:text[id*=purchase_pay_firstname]').val($('input:text[id*=purchase_firstname]').val())

      $("#purchase_pay_lastname").prop('readonly', true)
      $('input:text[id*=purchase_pay_lastname]').val($('input:text[id*=purchase_lastname]').val())

      $("#purchase_pay_company").prop('readonly', true) 
      $('input:text[id*=purchase_pay_company]').val($('input:text[id*=purchase_company]').val())

      $("#purchase_pay_telephone").prop('readonly', true) 
      $('input:text[id*=purchase_pay_telephone]').val($('input:text[id*=purchase_telephone]').val())

      $("#purchase_pay_street_address").prop('readonly', true) 
      $('input:text[id*=purchase_pay_street_address]').val($('input:text[id*=purchase_ship_street_address]').val())

      $("#purchase_pay_city").prop('readonly', true)
      $('input:text[id*=purchase_pay_city]').val($('input:text[id*=purchase_ship_city]').val())

      $("#purchase_pay_zipcode").prop('readonly', true)
      $('input:text[id*=purchase_pay_zipcode]').val($('input:text[id*=purchase_ship_zipcode]').val())
     
      $('select[id*=purchase_pay_state]').val($("select[id*=purchase_ship_state]").val()); 

      $('select[id*=purchase_pay_country]').val($('select[id*=purchase_ship_country]').val())
      $("#purchase_pay_country").prop('disabled', true)

      alert "Shipping address copied to Payment Address"

    else
      alert "not checked"
      $("#purchase_pay_firstname").prop('enabled', true)
      $('input:text[id*=purchase_pay_firstname]').val("")
 
      $("#purchase_pay_lastname").prop('enabled', true) 
      $('input:text[id*=purchase_pay_lastname]').val("")

      $("#purchase_pay_company").prop('enabled', true) 
      $('input:text[id*=purchase_pay_company]').val("")

      $("#purchase_pay_telephone").prop('enabled', true) 
      $('input:text[id*=purchase_pay_telephone]').val("")

      $("#purchase_pay_street_address").prop('enabled', true) 
      $('input:text[id*=purchase_pay_street_address]').val("")

      $("#purchase_pay_city").prop('enabled', true)
      $('input:text[id*=purchase_pay_city]').val("")

      $("#purchase_pay_zipcode").prop('enabled', true)
      $('input:text[id*=purchase_pay_zipcode]').val("")

      $('select[id=purchase_pay_state]').prop('enabled', true)
      $('select[id=purchase_pay_state]').val("")

      $("#purchase_pay_country").prop('enabled', true)
      $('input:text[id=purchase_pay_country]').val($('input:text[id=purchase_country]').val())




  