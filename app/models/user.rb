class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include HTTParty  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_or_create_from_auth_hash(auth_hash)
    user = User.find_by uid:auth_hash['info']['uid']
    unless user
      user = User.new
      user.uid = auth_hash['info']['uid']
      user.password = Devise.friendly_token.first(8)
    end
    user.nickname = auth_hash['info']['nickname']
    user.email = auth_hash['info']['email']
    user.image = auth_hash['info']['image']
    user.token = auth_hash['credentials']['token']
    user.save!
    user
  end
end
