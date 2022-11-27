class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.belongs_to :invitor
      t.belongs_to :invitee
      t.boolean :accepted

      t.timestamps
    end
  end
end
