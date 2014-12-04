class DrawMailer < ApplicationMailer
  default from: 'noreply@example.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.draw_mailer.gift.subject
  #
  def gift(draw)
    @draw = draw
    subject = "#{@draw.event.title} - your gift assignment"
    mail to: @draw.giver.email, subject: subject
  end
end
