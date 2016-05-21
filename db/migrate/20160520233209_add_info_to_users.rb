class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :telephone, :string
    add_column :users, :referall, :string
  end
end
