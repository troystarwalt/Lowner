class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :item_shares, :user_id, :shared_user_id
  	rename_column :item_shares, :item_id, :shared_item_id
  end
end
