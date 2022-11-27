class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.belongs_to :invitor_id
      t.belongs_to :inivtee_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
