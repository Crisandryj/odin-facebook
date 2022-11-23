class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :posts

  has_many :friends,class_name: "User",
                    foreign_key: "friend_id"

  belongs_to :friend, class_name: "User"
end
