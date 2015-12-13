$(document).ready ->
  $form = $('form.edit_event')

  $form.bind 'ajax:beforeSend', ->
    $submitButton = $(this).find('input[name="commit"]')
    $submitButton.prop('disabled', true)
    $status = $(this).find('.status')
    $status.text("Sending emails...")
    $('.indicator').show()

  $form.bind 'ajax:success', ->
    $status = $(this).find('.status')
    $status.text 'Success! Participants should have received an email with their contract.'

  $form.bind 'ajax:error', ->
    $status = $(this).find('.status')
    $status.text 'Oops! An error occured.'

  $form.bind 'ajax:complete', ->
    $('.indicator').slideUp()
