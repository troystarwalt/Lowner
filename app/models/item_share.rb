class ItemShare < ActiveRecord::Base
    belongs_to :shared_user, class_name: "User"
	belongs_to :shared_item, class_name: "Item"
end
