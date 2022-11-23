class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :body
      t.belongs_to :user
      t.timestamps
    end
  end
end
