update_title = ->
  title = $('#event_title').val()
  $('.preview-title').text(title)

update_amount = ->
  amount = $('#event_amount').val()
  if amount != ''
    $('.preview-amount-div').show()
    $('.preview-amount').text(amount)
  else
    $('.preview-amount-div').hide()

update_locale = ->
  locale = $('#event_locale').val()
  if locale == 'en'
    other = 'fr'
  else
    other = 'en'
  $(".preview-#{locale}").show()
  $(".preview-#{other}").hide()

$(document).ready ->
  $('.preview-fr').hide()
  $('.preview-amount-div').hide()

  update_title()
  update_amount()
  update_locale()

  $('#event_title').keyup update_title
  $('#event_amount').keyup update_amount
  $('#event_locale').change update_locale
