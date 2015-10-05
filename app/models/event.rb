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

  has_many :draws

  before_create :randomize_id

  def select_participants
    self.participants.collect { |x| [x.name, x.id] }
  end

  def draw_order
    participants = self.participants
    participants = participants.collect { |x| x }
    draw = []
    max_tries = 1000
    max_tries.times do
      participants.shuffle!
      draw = participants.zip(participants.rotate)
      if all_constraints_ok draw
        return draw
      end
    end
    nil
  end

  private

    def all_constraints_ok(draw)
      draw.all? do |(giver, receiver)|
        self.constraints.all? { |c| c.respected_by(giver, receiver) }
      end
    end

    def randomize_id
      begin
        self.id = SecureRandom.random_number(1_000_000)
      end while Event.where(id: self.id).exists?
    end
end
