class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validates :username, uniqueness: true

  has_attached_file :avatar, styles: { medium: "300x300>", small: "200x200>", thumb: "100x100>" }, default_url: "https://robohash.org/nycda.png?size=200x200"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  has_many :items, dependent: :destroy
  has_many :item_shares
  has_many :shared_items, :foreign_key => "shared_user_id", :through => :items, :source => :item_shares
  has_many :inverse_shared_items, :class_name => "ItemShare", :foreign_key => "user_id"
  has_many :inverse_items, :through => :inverse_shared_items, :source => :user

  def self.search(user_name)
  	if user_name
  		user_name.downcase!
  		where('LOWER(username) LIKE ?', "%#{user_name}%")
  	else
  		all
  	end
  end

  def borrowed_from_user
    array = []
    inverse_shared_items.map do | item|
      array << [item.item_borrowed.name, item.item_borrowed.user.username, item.item_borrowed.user.email]
    end
    array
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
