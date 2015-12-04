class ItemShare < ActiveRecord::Base
    belongs_to :shared_user, class_name: "User"
	belongs_to :shared_item, class_name: "Item"

	validates :user_id, presence: true
	validates :item_id, presence: true
		def borrower
			User.where(user_id).first
		end	

		def item_borrowed
			Item.where(item_id).first
		end

end

# Item.where(@item_loaned.item_id).first

# @item_loaned = ItemShare.where(item_id: 14).first