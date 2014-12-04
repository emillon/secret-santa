class Participant < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, allow_blank: true, format: { with: /@/ }
  belongs_to :event

  validates :name, uniqueness: { scope: :event }
end
