class ItemShare < ActiveRecord::Base
	belongs_to :shared_user, class_name: "User"
	belongs_to :shared_item, class_name: "Item"

	validates :user_id, presence: true
	validates :item_id, presence: true

	# Set who borred an item.
	def borrower
		User.where(id: user_id).first
	end	
	# Find what item is borrowed/lowned.
	def item_borrowed
		Item.where(id: item_id).first
	end
	# Method created to take back or delete the association.
	def remove_item
		User.shared_item.where(id: item_id).first
	end
	# User search method.
	def self.search_users(user_name)
		if user_name
			user_name.downcase!
			where('LOWER(username) LIKE ?', "%#{user_name}%")
		else
			all
		end
	end

end
