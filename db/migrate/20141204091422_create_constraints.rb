class CreateConstraints < ActiveRecord::Migration
  def change
    create_table :constraints do |t|
      t.references :event, index: true
      t.references :one, index: true
      t.references :other, index: true

      t.timestamps null: false
    end
    add_foreign_key :constraints, :events
    add_foreign_key :constraints, :ones
    add_foreign_key :constraints, :others
  end
end
