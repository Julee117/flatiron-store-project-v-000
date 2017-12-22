class AddCurrentCardIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_card_id, :integer
  end
end
