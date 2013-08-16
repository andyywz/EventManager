class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :trackable, :validatable, authentication_keys: [:login]

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :fname, :lname, :kind, :username, :login, :avatar
  
  attr_accessor :login

  validates :username, uniqueness: { case_sensitive: false }
  validates :username, :fname, :lname, presence: true    

  has_many :events
  has_many :attendings
  has_many :attending_events, through: :attendings, source: :occurrence
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: ["100x100>", :png] }, default_url: "/attachments/"
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
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