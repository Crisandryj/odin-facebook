class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :posts

  has_many :friend_follows, foreign_key: :followee_id, class_name: "Friend"
  has_many :followers, through: :friend_follows, source: :follower

  has_many :friend_followees, foreign_key: :follower_id, class_name: "Friend"
  has_many :followees, through: :friend_followees, source: :followee



  def request_friend()
  end

  def accept_request

  end

  private

  def send_notification
  end

  def add_friend
  end

end
