class Friend < ApplicationRecord
  belongs_to :follower, foreign_key: "follower_id", class_name: "User", inverse_of: :followers
  belongs_to :followee, foreign_key: "followee_id", class_name: "User", inverse_of: :followees

end
