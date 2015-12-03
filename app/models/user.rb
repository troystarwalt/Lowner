class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://www.gravatar.com/avatar/wavatar"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  has_many :items

  has_many :item_shares
  has_many :shared_items, :foreign_key => "shared_user_id", :through => :items, :source => :item_shares

  def self.search(user_name)
  	if user_name
  		user_name.downcase!
  		where('LOWER(username) LIKE ?', "%#{user_name}%")
  	else
  		all
  	end
  end
end
