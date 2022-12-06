class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :age, :integer
    add_column :users, :birthday, :date
    add_column :users, :relationship, :string

  end
end
