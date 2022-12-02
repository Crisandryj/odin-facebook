class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
end
