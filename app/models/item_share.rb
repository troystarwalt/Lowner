class ItemShare < ActiveRecord::Base
    belongs_to :shared_user, class_name: "User"
	belongs_to :shared_item, class_name: "Item"

	validates :user_id, presence: true
	validates :item_id, presence: true

	def borrower
		User.where(user_id).first
	end	

	delegate :hello, to: :user

end
