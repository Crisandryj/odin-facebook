class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :invitor_id
      t.integer :inivtee_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
