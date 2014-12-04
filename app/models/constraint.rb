class Constraint < ActiveRecord::Base
  belongs_to :event
  belongs_to :one, :class_name => 'Participant'
  belongs_to :other, :class_name => 'Participant'
end
