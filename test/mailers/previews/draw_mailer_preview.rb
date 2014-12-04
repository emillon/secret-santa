# Preview all emails at http://localhost:3000/rails/mailers/draw_mailer
class DrawMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/draw_mailer/gift
  def gift
    event = Event.first
    draw = event.draw_order
    (giver, receiver) = draw[0]
    DrawMailer.gift event, giver, receiver
  end

end
