class CreateItemShares < ActiveRecord::Migration
  def change
    create_table :item_shares do |t|
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
