class Draw < ActiveRecord::Base
  belongs_to :event
  belongs_to :giver, :class_name => 'Participant'
  belongs_to :receiver, :class_name => 'Participant'
end
