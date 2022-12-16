class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
         
  validates :email, uniqueness: true

  has_many :comments
  has_many :posts

  has_many :friend_follows, foreign_key: :followee_id, class_name: 'Friend'
  has_many :followers, through: :friend_follows

  has_many :friend_followees, foreign_key: :follower_id, class_name: 'Friend'
  has_many :followees, through: :friend_followees

  has_many :recieved_requests, foreign_key: :invitee_id, class_name: 'Request'
  has_many :invitors, through: :recieved_requests

  has_many :sent_requests, foreign_key: :invitor_id, class_name: 'Request'
  has_many :invitees, through: :sent_requests

  has_many :likes

  include Gravtastic
  gravtastic

  after_create :welcome_send

  def welcome_send
    WelcomeMailer.welcome_send(self).deliver
  end

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
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
