class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name_of_admin, :email, :password, :password_confirmation, :remember_me, :chat_status,:chat_friend_name

  #validation
  validates :name_of_admin, :uniqueness => true

end

