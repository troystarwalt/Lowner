class Item < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/bookshelf.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	validates :description, length: { maximum: 180, 
		too_long: "%{count} characters is the maximum allowed" }
	validates :category, length: { maximum: 50, 
		too_long: "%{count} characters is the maximum allowed" }

	validates :name, presence: true, length: { maximum: 25, 
		too_long: "%{count} characters is the maximum allowed"}

	belongs_to :user
	has_many :item_shares, dependent: :destroy
  	has_many :shared_users, :foreign_key => "shared_item_id", :through => :user, :source => :item_shares

  	after_destroy :log_destroy_action

  	def log_destroy_action
  		puts "Item Deleted"
  	end
end
