class AddSentAtToDraws < ActiveRecord::Migration
  def change
    add_column :draws, :sent_at, :datetime
  end
end
