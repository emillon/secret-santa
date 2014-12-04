class Event < ActiveRecord::Base
  validates :title, presence: true

  has_many :participants
  accepts_nested_attributes_for :participants,
    :reject_if => :all_blank,
    :allow_destroy => true

  has_many :constraints

  def all_constraints_ok(draw)
    draw.all? do |(giver, receiver)|
      self.constraints.all? { |c| c.respected_by(giver, receiver) }
    end
  end
end
