class CreateDraws < ActiveRecord::Migration
  def change
    create_table :draws do |t|
      t.references :event, index: true
      t.references :giver, index: true
      t.references :receiver, index: true

      t.timestamps null: false
    end
    add_foreign_key :draws, :events
    add_foreign_key :draws, :givers
    add_foreign_key :draws, :receivers
  end
end
