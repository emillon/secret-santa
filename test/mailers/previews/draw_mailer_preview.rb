# Preview all emails at http://localhost:3000/rails/mailers/draw_mailer
class DrawMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/draw_mailer/gift
  def gift
    draws = Event.find(3).draws
    draw = draws[0]
    DrawMailer.gift draw
  end

end
