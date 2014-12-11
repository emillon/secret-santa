class AddAmountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :amount, :string
  end
end
