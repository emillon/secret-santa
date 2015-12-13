class DrawMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.draw_mailer.gift.subject
  #
  def gift(draw)
    @draw = draw
    I18n.with_locale @draw.event.locale do
      subject = "#{@draw.event.title} - #{I18n.t 'draw_mailer.gift.subject_template'} #{@draw.giver.name}"
      mail to: @draw.giver.email, subject: subject
    end
  end
end
