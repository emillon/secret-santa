class DrawMailer < ApplicationMailer
  default from: 'noreply@example.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.draw_mailer.gift.subject
  #
  def gift(draw)
    @draw = draw
    subject = "#{@draw.event.title} - gift assignment for #{@draw.giver.name}"
    mail to: @draw.giver.email, subject: subject
  end
end
