class Participant < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, format: { with: /@/ }
  belongs_to :event, optional: true

  validates :name, uniqueness: { scope: :event }
end
