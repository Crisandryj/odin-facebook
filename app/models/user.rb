class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :posts

  has_many :friend_followers, foreign_key: :followee_id, class_name: "Friend"
  has_many :followers, through: :friend_followers, source: :follower

  has_many :friend_followees, foreign_key: :follower_id, class_name: "Friend"
  has_many :followees, through: :friend_follower, source: :followee

end
