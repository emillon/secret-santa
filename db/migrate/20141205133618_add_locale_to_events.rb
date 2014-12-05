class AddLocaleToEvents < ActiveRecord::Migration
  def change
    add_column :events, :locale, :string, :default => :en
  end
end
