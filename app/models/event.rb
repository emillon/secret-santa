class Event < ActiveRecord::Base
  validates :title, presence: true

  has_many :participants
  accepts_nested_attributes_for :participants,
    :reject_if => :all_blank,
    :allow_destroy => true

  has_many :constraints
  accepts_nested_attributes_for :constraints,
    :reject_if => :all_blank,
    :allow_destroy => true

  def all_constraints_ok(draw)
    draw.all? do |(giver, receiver)|
      self.constraints.all? { |c| c.respected_by(giver, receiver) }
    end
  end

  def select_participants
    self.participants.collect { |x| [x.name, x.id] }
  end
end
