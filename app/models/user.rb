class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :fname, :lname, :type, :username, :login
  
  attr_accessor :login
  
  validates :username, :uniqueness => { :case_sensitive => false }
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end

=begin
# filters
before_filter :authenticate_user!

# controller helpers
user_signed_in?
current_user

# url helpers
new_user_registration_path
new_user_session_path
destroy_user_session_path
=end