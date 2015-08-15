class AddDealToItems < ActiveRecord::Migration
  def change
    add_column :items, :deal, :boolean
  end
end
