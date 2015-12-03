class Item < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	has_many :item_shares
  	has_many :shared_users, :foreign_key => "shared_item_id", :through => :user, :source => :item_shares

  	after_destroy :log_destroy_action

  	def log_destroy_action
  		puts "Item Deleted"
  	end
end
