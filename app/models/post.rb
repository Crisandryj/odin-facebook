class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  accepts_nested_attributes_for :comments
  has_many :likes
end
