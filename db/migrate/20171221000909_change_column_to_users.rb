class ChangeColumnToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :current_card_id, :current_cart_id
  end
end
