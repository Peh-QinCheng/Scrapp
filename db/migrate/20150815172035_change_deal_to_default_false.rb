class ChangeDealToDefaultFalse < ActiveRecord::Migration
  def change
    change_column :items, :deal, :boolean, default: false
  end
end
