class DrawMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.draw_mailer.gift.subject
  #
  def gift(event, giver, receiver)
    byebug
    @event = event
    @giver = giver
    @receiver = receiver
    mail to: @giver.email
  end
end
