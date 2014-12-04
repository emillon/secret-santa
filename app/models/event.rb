class Event < ActiveRecord::Base
  validates :title, presence: true

  has_many :participants
  accepts_nested_attributes_for :participants,
    :reject_if => :all_blank,
    :allow_destroy => true

  has_many :constraints
end
