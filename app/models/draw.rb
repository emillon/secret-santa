class Draw < ActiveRecord::Base
  belongs_to :event
  belongs_to :giver, :class_name => 'Participant'
  belongs_to :receiver, :class_name => 'Participant'

  def send_email
    DrawMailer.gift(self).deliver_now
  end
end
