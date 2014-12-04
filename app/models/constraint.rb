class Constraint < ActiveRecord::Base
  belongs_to :event
  belongs_to :one, :class_name => 'Participant'
  belongs_to :other, :class_name => 'Participant'

  def respected_by(giver, receiver)
    not ((self.one == giver and self.other == receiver) or (self.one == receiver and self.other == giver))
  end
end
