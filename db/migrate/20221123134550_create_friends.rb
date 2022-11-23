class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.belongs_to :follower, foreign_key: true
      t.belongs_to :followee, foreign_key: true
      t.timestamps
    end
  end
end
