class AddUserNameToImages < ActiveRecord::Migration
  def change
    add_column :images, :user_name, :string
  end
end
