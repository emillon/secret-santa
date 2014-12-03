class Participant < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, format: { with: /@/ }
  belongs_to :event
end
