class UserItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  scope :owned, -> {
  	where(owned: true)
  }
end
