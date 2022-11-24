class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.belongs_to :follower
      t.belongs_to :followee

      t.timestamps
    end
  end
end
